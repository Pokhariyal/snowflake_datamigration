# Snowflake Datamigration project
Postgressql is acting as backend from where the real problem starts that reduces the working performance and unable to handle current requirement to encounter that the upstream delta data from bigquery is loaded into postgresSQL and server as Csv files and immediately unloaded to S3 and some analysis are done along the way and finally data is loaded to snowflake Tables (data warehouse). The processed data after some value addition is put back into RDBMS (For backend use as per client requiremt in this case).  

#Overview
