import csv
import datetime
from dotenv import load_dotenv
import glob
from google.cloud import bigquery
import logging
import os
import pandas as pd
import requests
from const import PATHS
import snowflake.connector
from snowflake.connector import connect
from snowflake.connector import DictCursor
from snowflake.connector.pandas_tools import write_pandas
from snowflake.connector.pandas_tools import pd_writer


load_dotenv(".env")
ABSOLUTE_PATH = os.environ.get("ABSOLUTE_PATH")
CSV_WAREHOUSE_PATH = os.environ.get("CSV_WAREHOUSE_PATH")
SNOW_USER=os.environ.get("SNOW_USER")
SNOW_PASSWORD=os.environ.get("SNOW_PASSWORD")
SNOW_ACCOUNT=os.environ.get("SNOW_ACCOUNT")
SNOW_ROLE=os.environ.get("SNOW_ROLE")
SNOW_WAREHOUSE=os.environ.get("SNOW_WAREHOUSE")
SNOW_DATABASE=os.environ.get("SNOW_DATABASE")

# **********************************************************
# ****************** Google Bigquery IO ********************
# **********************************************************

# create a Google Big Query connection
# this relies on environmental variable GOOGLE_APPLICATION_CREDENTIALS which is loaded from the .env
def connect_bigquery():
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "./google_bigquery_credential.json"
    client = bigquery.Client()
    print("📺 Got Google bigquery client")
    return client


# Get data from Google Bigquery
def download_from_google_bigquery(sql, csv_filename_with_path=None):
    g_client = connect_bigquery()
    query_job = g_client.query(sql)
    print("🌍🌍 Executing query on google big query:")
    print(sql)
    df = query_job.to_dataframe()
    if csv_filename_with_path != None:
        df.to_csv(csv_filename_with_path, index=False)
    return df


# upsert data from Google Bigquery
def copy_from_google_bigquery_to_postgres(sql, table, csv_filename_with_path=None, use_upsert=False, key=None):
    """
    copy a source table in google big query using the sql into a target table in postgres.
    """
    print("⛳️⛳️⛳️ GBQ Upsert starting at " + str(datetime.datetime.now()))
    df = download_from_google_bigquery(sql)

    print("⛳️⛳️⛳️ loading into postgres")
    copy_from_df_to_snowflake_table(
        df=df, table=table, csv_filename_with_path=csv_filename_with_path, use_upsert=use_upsert, key=key
    )

####**********************************************************
#### ****************** Snowflake  ********************
#### **********************************************************

# Creating connection to snowflake
def connect_snowflake():
    try:
        conn = connect(
        user=SNOW_USER,
        password=SNOW_PASSWORD,
        account=SNOW_ACCOUNT,
        role=SNOW_ROLE

        )
        logging.info('Connection created successfully')
        return conn

    except:
        logging.warning('Connection creation unsuccessful')

def set_session():
    conn = connect_snowflake()
    cur = conn.cursor()
        #cursor = self.create_snowflake_connection().cursor(DictCursor) here the session is hardcoded
    try:
            #cursor.execute(f'USE ROLE {SNOW_ROLE};') Mostly for our purose without this we can fullfill our requirement
            #cursor.execute(f'USE WAREHOUSE {SNOW_WAREHOUSE};'
        sql = "use role ACCOUNTADMIN"
        cur.execute(sql)
        sql = "use warehouse COMPUTE_WH"  # But in future you want to move to different cluster use its name
        cur.execute(sql)
        sql = "use database ANALYTICS"
        cur.execute(sql)
        sql = "use schema PUBLIC"
        cur.execute(sql)
        return conn
    except Exception as error_returned:
        raise RuntimeError(f'Setting the Role and Warehouse threw error: {error_returned}' )


def query_snowflake(sql, columns=None):
    # A cursor object represents a database cursor for execute and fetch operations
    conn = set_session()
    cur = conn.cursor()
    print("🌿🌿 executing query on snowflake:" + str(datetime.datetime.now()))
    try:
        # Prepare and execute a database command, fetch data into a Pandas DataFrame
        cur.execute(sql)
        df = cur.fetch_pandas_all()
        if columns != None:
            data_rows = cur.fetchall()
            print(datetime.datetime.now())
            return pd.DataFrame(data_rows, columns=columns)
        conn.commit()
        print("🌿🌿 finished: " + str(datetime.datetime.now()))

    except Exception as error_returned:
        raise RuntimeError(
            f'SQL statement: {sql}\n threw error {error_returned}')

    finally:
        # Close the cursor
        cur.close()
        conn.close()

def copy_from_file_to_snowflake_table(csv_filename_with_path, table):
    import datetime
    conn = set_session()
    cur = conn.cursor()
    print(f"🌿 Loading {csv_filename_with_path} into snowflake stage at: " + str(datetime.datetime.now()))
    try:
        sql = 'put file://{0} @INNERCIRCLE auto_compress=false'.format(csv_filename_with_path)
        cur.execute(sql)
        print(f"🌿🌿 copying data from stage into snowflake {table}:" + str(datetime.datetime.now()))
        sql = 'copy into {0} from (select c.* from @innercircle (file_format => D_FILEFORMAT ) c) PURGE =TRUE'.format(table)
        cur.execute(sql)
        print(f"🌿🌿 copy data from stage into snowflake {table}:" + str(datetime.datetime.now()))

    finally:
        cur.close()
    conn.close()

def upsert_from_file_to_snowflake(csv_filename_with_path, table, key, update=False):
    print(f"🌿 Upsert into {csv_filename_with_path} into {table} at: " + str(datetime.datetime.now()))
    staging_table = create_staging_table(table)
    copy_from_file_to_snowflake_table(csv_filename_with_path, table=staging_table)
    if update:
        update_snowflake(source = staging_table, target=table, key = key)
    else:
       upsert_snowflake(source=staging_table, target=table, key=key)
    query_snowflake(f"drop table if exists {staging_table}")

def copy_from_df_to_snowflake_table(df, table, csv_filename_with_path=None, use_upsert=False, key=None, update=False):
    print("""🌿 Load a python df into snowflake""")
    temp_file_will_be_removed = False

    # create a temp csv file name
    if csv_filename_with_path == None:
        now_str = str(datetime.datetime.now()).replace(" ", "_").replace(":", "_").replace(".", "_")
        csv_filename_with_path = ABSOLUTE_PATH + f"tmp_dataframe_{now_str}.csv"
        temp_file_will_be_removed = True

    df.to_csv(csv_filename_with_path, index=False)
    if use_upsert:
        if key == None:
            raise ValueError("🤯 executing upsert without providing key")
        upsert_from_file_to_snowflake(csv_filename_with_path=csv_filename_with_path, table=table, key=key, update=update)
    else:
        copy_from_file_to_snowflake_table(csv_filename_with_path=csv_filename_with_path, table=table)

    if temp_file_will_be_removed:
        os.remove(csv_filename_with_path)

# upsert data from one snowflake table to another
def upsert_snowflake(source, target, key):
    """
    upsert a source table in snowflake into a target table. The two tables should
    have the same schema. The old records and new should be differentated using the key variable
    I n snowflake the table ust exist frst inorder to insert i.e schema on write otherwise create then insert
    """
    sql = f"""
        insert into {target}
        select
            s.*
        from {source} s
        left join {target} t
            on t.{key} = s.{key}
        where t.{key} is null
    """
    query_snowflake(sql)

def update_snowflake(source, target, key):
    df = query_snowflake(sql=f'''
        SELECT column_name
        FROM information_schema.columns
        WHERE table_schema ilike 'public'
            AND table_name ilike '{target}'
            and column_name != '{key}'
        ;'''
        , columns = ['col'])
    s = str(df.col.apply(lambda x: f'{x} = s.{x}').to_list())
    sql_set_string = s.replace("'", '').replace('[','').replace(']','')
    query_snowflake(sql=f'''
    update {target}
    set
    {sql_set_string}
    from {source} s
        where {target}.{key} = s.{key};
    ''')

def create_staging_table(table):
    staging_table = f"{table}_staging"
    query_snowflake(f"drop table if exists {staging_table}")
    query_snowflake(f"create table {staging_table} as select * from {table} limit 0")
    return staging_table

def exports_from_snowflake_to_s3(sql, table):
    conn = set_session()
    cur = conn.cursor()
    print(f"🌿 Loading snowflake query results into s3/{table}: " + str(datetime.datetime.now()))
    try:
        sql = "copy into '@gets3data/{0}/' from ({1})  file_format=(type=csv COMPRESSION =  NONE)HEADER = TRUE OVERWRITE = FALSE SINGLE = TRUE".format(table, sql)
        cur.execute(sql)

    finally:
        cur.close()
    conn.close()

# **********************************************************
# ****************** ETL utils *****************************
# **********************************************************

# get a list of dates from start_date ('2021-12-24' format) to end_date and return the list reverse if required.
# The default end_date is the day before the execution date.
def get_date_list(start_date=None, end_date=None, reverse=False):
    dim_date = pd.read_csv("dim_dates.csv")

    if end_date == None:  # default end date is yesterday
        end_date = get_previous_day()

    dim_date = dim_date[dim_date.full_date <= end_date]

    if start_date != None:
        dim_date = dim_date[dim_date.full_date >= start_date]

    dates = list(dim_date.full_date)
    dates.sort()

    if reverse:
        dates.reverse()
    return dates

def delete_current_day_data(date, table, key="timestamp"):
    gap = check_table_for_date_gaps(
        table=table
        , start_date=date
        , end_date=date
        , key=key)

    if len(gap)==0: # there is existing data.
        query_snowflake(
            sql = f"delete from {table} where date({key}) = '{date}'"
        )

def get_previous_day(from_date=None, num_days=1):
    dim_date = pd.read_csv("dim_dates.csv")
    if from_date == None:
        today = datetime.datetime.now().date().strftime("%Y-%m-%d")
        from_date = today
    prev_day = dim_date.full_date[dim_date.full_date < from_date].max()
    if num_days == 1:
        return prev_day
    else:
        return get_previous_day(from_date=prev_day, num_days=num_days-1)


# get max(timestamp of existing table)
def get_terminal_ts(table, end, offset=None, key="timestamp"):
    if end != "max" and end != "min":
        raise ValueError("🤯 The end param in get_terminal_ts should be either max or min")
    offset_string = ""
    if offset != None:
        offset_string = f" + interval'{offset}'"
    sql = f"select cast({end}({key} {offset_string}) as varchar) from {table}"
    data = query_snowflake(sql, columns=["ts"])
    ts = data.ts.iloc[0]
    print("⏱ Terminal ts retrieved: " + str(ts))
    return ts

def check_table_for_date_gaps(table, start_date, end_date=None, key="timestamp"):
    dates = get_date_list(start_date=start_date, end_date=end_date)
    end_date_clause = f"and {key} <= date('{end_date}') + interval'1 day'" if end_date != None else ""
    sql = f"""
        select cast(date({key}) as varchar) as date
        from {table}
        where {key} >= '{start_date}'
            {end_date_clause}
        group by 1
    """
    uploaded = query_snowflake(sql, columns=["date"])
    uploaded = uploaded.date.to_list()

    gaps = [date for date in dates if date not in uploaded]
    gaps.sort()
    print(f"🦄🦄: {table} gaps:")
    print(gaps)
    return gaps

# **********************************************************
# ****************** CSV FILE IO ***************************
# **********************************************************

# get the filenames under a certain path
def get_all_files_in_path(path):
    files = glob.glob(path + "*")
    files.sort()
    return files


# load all files under a path into postgres
def load_all_local_files(table, path):
    files = get_all_files_in_path(path)
    for file in files:
        print("🦄🦄 copying >> " + file)
        copy_from_file_to_snowflake_table(file,table)


def rename_csv_header_single_file(file, new_columns):
    print("🪖 renaming " + file.split("/")[-1])
    with open(file, "r") as f:
        reader = csv.reader(f)
        header = next(reader)
    if header != new_columns:
        data = pd.read_csv(file)
        data.columns = new_columns
        data.to_csv(file, index=False)


def rename_csv_header_dataset(table, new_columns):
    files = glob.glob(CSV_WAREHOUSE_PATH + PATHS[table] + "*")
    for file in files:
        rename_csv_header_single_file(file, new_columns)
