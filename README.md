# Snowflake Datamigration project
Postgressql is acting as backend from where the real problem starts that reduces the working performance and unable to handle current requirement to encounter that the upstream delta data from bigquery is loaded into postgresSQL and server as Csv files and immediately unloaded to S3 and some analysis are done along the way and finally data is loaded to snowflake Tables (data warehouse). The processed data after some value addition is put back into RDBMS (For backend use as per client requiremt in this case).  

#Project DATA Pipeline is Properly Showcased in Lucid_ELT.jpg

# Overview
To Setup by role and proper access These Step should be refered. First on snowflake just run the query describe on snowflake_IAM_role.sql ten Aws user group and different policy same goes for oracle jdbc connection credentials required.

