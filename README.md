# Overview: Pyspark Data Migration to Snowflake from various sources.
Oracle is acting as backend for client and with the increase in volume of data the real problem starts. The current system experiencing a reduction in the working performance and unable to handle situation efficiently. To add into the misery the client also want to implement delta data from bigquery daily loaded into database and stored Csv files in S3 and some analysis are done along the way and finally data is loaded to snowflake Tables (data warehouse). The processed data after some value addition Like analytics and businnes logics implementation is put back into Datalake.  

#Project DATA Pipeline is Properly Showcased in Lucid_ELT.jpg

## After Deployment snow_cron_exec.sh will execute Pyspark code daily on the server.
### The Code are divided into three parts 
#### 1.Util (Methods and connectors)
#### 2.Oracle_TO_S3
#### 3.S3_To_Snowflake

 ## Access management:To Setup up role and proper access These Step should be refered.
Aws Iam roles and access credential generated with required policy in place. sample Template is shared as well.
First on snowflake just run the query describe on snowflake_IAM_role.sql then Aws user group and different policy same goes for oracle jdbc connection credentials required.

## Pyspaprk script: To read data from RDBMS and Store in S3 then loaded into snowflake for analytics.
