create table SAFIO_VENDORS (VENDORCODE VARCHAR(12),NAME VARCHAR(60),notes varchar default null,POMINORDERQTY NUMBER(28,9),
                           poMaxOrderQty varchar default null, poMinOrderAmt NUMBER(28,9),poMaxOrderAmt varchar default null,
                            fileUpdate TIMESTAMP_NTZ(9) default null);
                                                     
INSERT INTO SAFIO_VENDORS (VENDORCODE,NAME,POMINORDERQTY,poMinOrderAmt)
  WITH cte AS
    (select a.acctno as vendorCode,a.name as name,
     b.min_order_line as poMinOrderQty, b.min_order as poMinOrderAmt
     from adp_custvend a 
//where upper(a.cust_vend) =='V'
     join adp_custvendsetup b
     on a.acctno=b.acctno and a.subc=b.subc
     where upper(b.cust_vend) ='V'
    )
  SELECT VENDORCODE,NAME,POMINORDERQTY,poMinOrderAmt
  FROM cte;
  
COPY INTO @adp/adp/SAFIO_VENDORS/vendors.csv from (select * from SAFIO_VENDORS limit 100)
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;

/* create table SAFIO_VENDORS as select a.acctno as vendorCode,a.name as name,
b.min_order_line as poMinOrderQty, b.min_order as poMinOrderAmt		
from adp_custvend a 
//where upper(a.cust_vend) =='V'
join adp_custvendsetup b
on a.acctno=b.acctno and a.subc=b.subc
where upper(b.cust_vend) ='V';
*/
