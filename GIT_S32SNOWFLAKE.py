import pandas as pd
import snowflake.connector
import logging
import os
from io import StringIO
import boto3
import csv

# MY ACCOUNT HAVE DEXPLORER ROLE AND WE MAY NEED TO ASSIGN SYSADMIN\(MASTER ROLE :ACCOUNTADMIN)

# Create the connection string
cnn = snowflake.connector.connect(
   user='*********',
   password='**********', # IF YOU WANT TO PASS THIS ARGUMENT YOU CAN DO IT.
   account='**************')

cs = cnn.cursor()
try:
   cs.execute('SELECT current_version()')
   test = cs.fetchone()
   print(test[0])
   cs.execute('show databases')
   print('The SNOWFLAKE session connection established')

finally:
    pass
# CREATING THE S3 TO SNOWFLAKE tables pipes......
def file_format():
    sql = "CREATE FILE FORMAT ANALYTICS.PUBLIC.D_FILEFORMAT_NOHEADER /" \
          "TYPE = 'CSV' COMPRESSION = 'AUTO' FIELD_DELIMITER = ',' " \
          "RECORD_DELIMITER = '\n' SKIP_HEADER = 0 FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE'" \
          " TRIM_SPACE = FALSE ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE ESCAPE = 'NONE' ESCAPE_UNENCLOSED_FIELD = '\134' " \
          "DATE_FORMAT = 'AUTO' TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('\\N')";
    cs.execute(sql)

cs = cnn.cursor()
try:
    sql = "use role EXPLORER_ROLE"
    cs.execute(sql)
    print('accesing warehouse ')
    sql = "use warehouse COMPUTE_WH"
    cs.execute(sql)
    print("accesing database")
    sql = "use database ANALYTICS"
    cs.execute(sql)
    print("accesing schema")
    sql = "use schema PUBLIC"
    cs.execute(sql)
    print('creating pipeline')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_ETH_CONTRACTS auto_ingest=true as copy into ANALYTICS.PUBLIC.eth_contracts from @ANALYTICS.public.GETS3DATA/ETH_CONTRACTS file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print("PIPE CREATED= SNOW_PIPE_ETH_CONTRACTS please upload the file in 'GETS3DATA/ETH_CONTRACTS' OBJECT")
    print('creating pipeline nft_trades')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_NFT_TRADES auto_ingest=true as copy into ANALYTICS.PUBLIC.nft_trades from @ANALYTICS.public.GETS3DATA/NFT_TRADES file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print("PIPE CREATED= SNOW_PIPE_NFT_TRADES please upload the file in 'GETS3DATA/NFT_TRADES' OBJECT")
    print('creating pipeline for Collection table')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_COLLECTION auto_ingest=true as copy into ANALYTICS.PUBLIC.collection from @ANALYTICS.public.GETS3DATA/COLLECTION file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline nft_trx_union')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_NFT_TRX_UNION auto_ingest=true as copy into ANALYTICS.PUBLIC.nft_trx_union from @ANALYTICS.public.GETS3DATA/NFT_TRX_UNION file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline nft_ownership')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_NFT_OWNERSHIP auto_ingest=true as copy into ANALYTICS.PUBLIC.nft_ownership from @ANALYTICS.public.GETS3DATA/NFT_OWNERSHIP file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline nft_contract_floor_price')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_NFT_CONTRACT_FLOOR_PRICE auto_ingest=true as copy into ANALYTICS.PUBLIC.nft_contract_floor_price from @ANALYTICS.public.GETS3DATA/NFT_CONTRACT_FLOOR_PRICE file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline owner_collection_total_worth')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_OWNER_COLLECTION_TOTAL_WORTH auto_ingest=true as copy into ANALYTICS.PUBLIC.owner_collection_total_worth from @ANALYTICS.public.GETS3DATA/OWNER_COLLECTION_TOTAL_WORTH file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline insider_to_circle_mapping ')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_INSIDER_TO_CIRCLE_MAPPING auto_ingest=true as copy into ANALYTICS.PUBLIC.insider_to_circle_mapping from @ANALYTICS.public.GETS3DATA/INSIDER_TO_CIRCLE_MAPPING file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline Insider ')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_INSIDER auto_ingest=true as copy into ANALYTICS.PUBLIC.Insider from @ANALYTICS.public.GETS3DATA/INSIDER file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline Circle')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_CIRCLE auto_ingest=true as copy into ANALYTICS.PUBLIC.circle from @ANALYTICS.public.GETS3DATA/CIRCLE file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline Address_metadata')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_ADDRESS_METADATA auto_ingest=true as copy into ANALYTICS.PUBLIC.ADDRESS_METADATA from @ANALYTICS.public.GETS3DATA/ADDRESS_METADATA file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline insider_portfolio')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_INSIDER_PORTFOLIO auto_ingest=true as copy into ANALYTICS.PUBLIC.INSIDER_PORTFOLIO from @ANALYTICS.public.GETS3DATA/INSIDER_PORTFOLIO file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline insight')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_INSIGHT auto_ingest=true as copy into ANALYTICS.PUBLIC.INSIGHT from @ANALYTICS.public.GETS3DATA/INSIGHT file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)
    print('creating pipeline Insight_trx ')
    sql = "create or replace pipe ANALYTICS.PUBLIC.SNOW_PIPE_INSIGHT_TRX auto_ingest=true as copy into ANALYTICS.PUBLIC.INSIGHT_TRX from @ANALYTICS.public.GETS3DATA/INSIGHT_TRX file_format= (FORMAT_NAME=D_FILEFORMAT)"
    cs.execute(sql)

finally:
    cs.close()
cnn.close()

# Different pipes where cretaed for different table this is not actuallly implemented in final code but this part works fine while used in demonstration.
