create or replace table avsight_accounts (Billing_City varchar(30),Billing_Country varchar(40),Billing_Postal_Code varchar(12),
                                           Billing_State varchar(4),Billing_Street varchar(81),Description varchar default null, 
                                FAX varchar(40),name varchar(60),Phone varchar(40),Account_Owner varchar default null ,
                                Account_Owner_convid varchar default null,
                                Account_Owner_extid varchar default null,shipping_city varchar(30),shipping_country varchar(40),
                                Shipping_Postal_Code varchar(12),Shipping_State varchar(4),Shipping_Street varchar(81),
                                Account_Number varchar(12),Account_Terms varchar default null, Account_Terms_convid varchar default null,
                                Account_Terms_extid varchar default null,Accounting_Type varchar(1),Active_Billing_Contact varchar default null,
                                Billing_Contact_convid varchar default null,Billing_Contact_extid varchar default null,Credit_Limit int,
                                Customer_Priority varchar,EMAIL_ADDRESS varchar, INVOICE_EMAIL varchar default null,Preferred_Ship_Method varchar,
                                Preferred_Ship_Method_convid varchar default null,Preferred_Ship_Method_extid varchar default null,
                                Remit_City VARCHAR(30),Remit_Postal_Code VARCHAR(12),Remit_State VARCHAR(4),Remit_Country VARCHAR(40),
                                Remit_Street VARCHAR(101),Vendor_Terms varchar default null,
                                Vendor_Terms_convid varchar default null, Vendor_Terms_extid varchar default null,Vat varchar default null,
                                Tracking1099 varchar default null,External_Reference_ID VARCHAR(12));
--############################################################
INSERT INTO avsight_accounts (Billing_City,Billing_Country,Billing_Postal_Code,Billing_State,Billing_Street,
                              FAX,name,Phone,shipping_city,shipping_country,Shipping_Postal_Code,Shipping_State,Shipping_Street,
                              Account_Number,Account_Terms_extid,Accounting_Type,Credit_Limit,Customer_Priority,EMAIL_ADDRESS,
                              Preferred_Ship_Method,Remit_City,Remit_Postal_Code,Remit_State,Remit_Country,Remit_Street,
                              External_Reference_ID)
                              (
                              with cte as
( 
select acctno,subc,city as Billing_City,country as Billing_Country,
  zip as Billing_Postal_Code,state as Billing_State,adr1 ||'\n'|| adr2 as Billing_Street,
  fax1 as FAX,name,tel1 as Phone, city as shipping_city,country as shipping_country,zip as Shipping_Postal_Code,
  state as Shipping_State, adr1 ||'\n'|| adr2  as Shipping_Street
  from adp_shipto 
  WHERE upper(ship_type) ='S'
),
base as(
select a.acctno,a.acctno as Account_Number,a.subc,b.term_code as Account_Terms_extid,
  a.cust_vend as Accounting_Type,b.credit as Credit_Limit,b.priority as Customer_Priority,a.email as EMAIL_ADDRESS,
  b.shipvia as Preferred_Ship_Method,a.city as Remit_City,a.zip as Remit_Postal_Code,
  a.state as Remit_State, a.country as Remit_Country,a.adr1 ||'\n'||a.adr2 as Remit_Street
  
  from adp_custvend a
  join adp_custvendsetup b
  on a.acctno=b.acctno and a.subc=b.subc
)

select cte.Billing_City,cte.Billing_Country,cte.Billing_Postal_Code,cte.Billing_State,
cte.Billing_Street,cte.FAX,cte.name,cte.Phone,cte.shipping_city,cte.shipping_country,cte.Shipping_Postal_Code,cte.Shipping_State,cte.Shipping_Street,
base.Account_Number,base.Account_Terms_extid,base.Accounting_Type,base.Credit_Limit,base.Customer_Priority,base.EMAIL_ADDRESS,
base.Preferred_Ship_Method,base.Remit_City,base.Remit_Postal_Code,base.Remit_State,base.Remit_Country,base.Remit_Street,base.acctno as External_Reference_ID  from cte
join base
on cte.acctno=base.acctno and cte.subc=base.subc);
--#####################
COPY INTO @adp/adp/AVSIGHT_ACCOUNTS/avsight_accounts.csv from AVSIGHT_ACCOUNTS
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true HEADER = TRUE single = true max_file_size = 4900000000;


--#####################################################################################################################################################################
create table AVSight_Accounts as
with cte as
( 
select acctno,subc,city as Billing_City,country as Billing_Country,
  zip as Billing_Postal_Code,state as Billing_State,adr1 ||'\n'|| adr2 as Billing_Street,
  fax1 as FAX,name,tel1 as Phone, city as shipping_city,country as shipping_country,zip as Shipping_Postal_Code,
  state as Shipping_State, adr1 ||'\n'|| adr2  as Shipping_Street
  from adp_shipto 
  WHERE upper(ship_type) ='S' limit 5
),
base as(
select a.acctno,a.acctno as Account_Number,a.subc,b.term_code as Account_Terms_extid,
  a.cust_vend as Accounting_Type,b.credit as Credit_Limit,b.priority as Customer_Priority,a.email as EMAIL_ADDRESS,
  b.shipvia as Preferred_Ship_Method,a.city as Remit_City,a.zip as Remit_Postal_Code,
  a.state as Remit_State, a.country as Remit_Country,a.adr1 ||'\n'||a.adr2 as Remit_Street
  
  from adp_custvend a
  join adp_custvendsetup b
  on a.acctno=b.acctno and a.subc=b.subc limit 5
)

select cte.Billing_City,cte.Billing_Country,cte.Billing_Postal_Code,cte.Billing_State,
cte.Billing_Street,cte.FAX,cte.name,cte.Phone,cte.shipping_city,cte.shipping_country,cte.Shipping_Postal_Code,cte.Shipping_State,cte.Shipping_Street,
base.Account_Number,base.Account_Terms_extid,base.Accounting_Type,base.Credit_Limit,base.Customer_Priority,base.EMAIL_ADDRESS,
base.Preferred_Ship_Method,base.Remit_City,base.Remit_Postal_Code,base.Remit_State,base.Remit_Country,base.Remit_Street,base.acctno as External_Reference_ID  from cte
join base
on cte.acctno=base.acctno and cte.subc=base.subc;
