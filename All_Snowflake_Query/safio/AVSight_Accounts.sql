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
