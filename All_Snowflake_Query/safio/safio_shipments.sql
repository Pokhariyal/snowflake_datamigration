create table safio_shipments (dataSource VARCHAR DEFAULT 'EXAVAULT',LINEITEMXREF NUMBER(28,9),SKU VARCHAR(36),
                              ORDERSTATUS VARCHAR(5),ORDERTYPE VARCHAR(2),ACCOUNT VARCHAR(60),ACCOUNTCLASS VARCHAR(30),
                              ACCOUNTNUMBER VARCHAR(12),invoiceNumber int defAULT NULL,TOTALQUANTITY NUMBER(28,9),
                              QUANTITYSHIPPED NUMBER(28,9),UNITREVENUE NUMBER(28,9),EXTENDEDREVENUE NUMBER(28,9),
                              discountAmount int defAULT NULL,retailPrice int defAULT NULL,invoiceDate TIMESTAMP_NTZ(9) defAULT NULL,
                              REQUESTEDSHIPDATE TIMESTAMP_NTZ(9),ORDERNUMBER NUMBER(38,0),LOCATIONCODE NUMBER(38,0),CUSTOMERID VARCHAR(12),
                              SHIPCITY VARCHAR(30),SHIPSTATE VARCHAR(4),SHIPCOUNTRY VARCHAR(40),SHIPPOSTALCODE VARCHAR(12),
                              ACCOUNTSKUNUMBER VARCHAR(12),fileUpdate TIMESTAMP_NTZ(9) defAULT NULL
                              );
                                                           
insert into safio_shipments (LINEITEMXREF,SKU,ORDERSTATUS,ORDERTYPE,ACCOUNT,ACCOUNTCLASS,ACCOUNTNUMBER,
TOTALQUANTITY,QUANTITYSHIPPED,UNITREVENUE,EXTENDEDREVENUE,REQUESTEDSHIPDATE,ORDERNUMBER,LOCATIONCODE,
CUSTOMERID,SHIPCITY,SHIPSTATE,SHIPCOUNTRY,SHIPPOSTALCODE,ACCOUNTSKUNUMBER )
with cte as 
(select LINE as lineItemXref,
PARTNUMBER ||'-'|| COND as sku,
STATUS as orderStatus,LINE_TYPE as orderType,
NAME as account,ALT2 as accountClass,ACCTNO as accountNumber,
QORDER as totalQuantity,QSHIP as quantityShipped,UNITP as unitRevenue,
SUBTOTAL as extendedRevenue,SHIP_DATE as requestedShipDate,DOC_NO as orderNumber
,SHIPTO as locationCode,ACCTNO as customerId,CITY as shipCity,STATE as shipState,
COUNTRY as shipCountry,ZIP as shipPostalCode,ACCTNO as accountSkuNumber
from salesorder
where SHIP_COMPLETE != 'N')

select LINEITEMXREF,SKU,ORDERSTATUS,ORDERTYPE,ACCOUNT,ACCOUNTCLASS,ACCOUNTNUMBER,
TOTALQUANTITY,QUANTITYSHIPPED,UNITREVENUE,EXTENDEDREVENUE,REQUESTEDSHIPDATE,ORDERNUMBER,LOCATIONCODE,
CUSTOMERID,SHIPCITY,SHIPSTATE,SHIPCOUNTRY,SHIPPOSTALCODE,ACCOUNTSKUNUMBER  from cte;

COPY INTO @adp/adp/SAFIO_SHIPMENTS/shipments_250.csv from (select * from SAFIO_SHIPMENTS limit 250)
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;



create or replace table safio_shipments as (select LINE as lineItemXref,
PARTNUMBER ||'-'|| COND as sku,
STATUS as orderStatus,LINE_TYPE as orderType,
NAME as account,ALT2 as accountClass,ACCTNO as accountNumber,
QORDER as totalQuantity,QSHIP as quantityShipped,UNITP as unitRevenue,
SUBTOTAL as extendedRevenue,SHIP_DATE as requestedShipDate,DOC_NO as orderNumber
,SHIPTO as locationCode,ACCTNO as customerId,CITY as shipCity,STATE as shipState,
COUNTRY as shipCountry,ZIP as shipPostalCode,ACCTNO as accountSkuNumber
from salesorder
where SHIP_COMPLETE != 'N');

ALTER TABLE safio_shipments ADD COLUMN dataSource VARCHAR DEFAULT 'EXAVAULT';
