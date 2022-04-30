create OR REPLACE role explorer_role;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO explorer_role;

create user DEXPLORER password='******' comment="User for support " ;

GRANT ROLE explorer_role_ TO USER Dexplorer;

GRANT USAGE ON DATABASE ANALYTICS TO explorer_role;

GRANT USAGE ON SCHEMA ANALYTICS.PUBLIC TO explorer_role;

--GRANT SELECT ON TABLE ANALYTICS.PUBLIC.table_naemss TO explorer_role;

GRANT ALL PRIVILEGES ON SCHEMA ANALYTICS.PUBLIC TO explorer_role;

--error occurs check this
desc user DEXPLORER;
desc user Dexplorer
