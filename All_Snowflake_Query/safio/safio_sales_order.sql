create table SAFIO_SALES_ORDER (dataSource VARCHAR DEFAULT 'EXAVAULT', lineItemXref NUMBER(28,9),sku VARCHAR(36),
                                orderStatus VARCHAR(5),orderType VARCHAR(2),account VARCHAR(60),
                                accountClass VARCHAR(30),accountNumber VARCHAR(12), invoiceNumber VARCHAR DEFAULT null,
                                totalQuantity NUMBER(28,9),quantityShipped NUMBER(28,9),unitRevenue NUMBER(28,9),
                                extendedRevenue NUMBER(28,9), discountAmount VARCHAR DEFAULT null, retailPrice VARCHAR DEFAULT null,
                                invoiceDate VARCHAR DEFAULT null,requestedShipDate TIMESTAMP_NTZ(9),orderNumber NUMBER(38,0),
                                locationCode NUMBER(38,0),customerId VARCHAR(12),shipCity VARCHAR(30),shipState VARCHAR(4),
                                shipCountry VARCHAR(40),shipPostalCode VARCHAR(12),accountSkuNumber VARCHAR(12),fileUpdate TIMESTAMP_NTZ(9) DEFAULT null);
                                
insert into SAFIO_SALES_ORDER (lineItemXref,sku,orderStatus,orderType,account,accountClass,accountNumber,
        totalQuantity,quantityShipped,unitRevenue,extendedRevenue,
        requestedShipDate,orderNumber,locationCode,customerId
        ,shipCity,shipState,shipCountry,shipPostalCode,accountSkuNumber)
with cte as 
(select LINE as lineItemXref, PARTNUMBER||'-'||COND as sku,
STATUS as orderStatus,LINE_TYPE as orderType, NAME as account,ALT2
as accountClass, ACCTNO as accountNumber,QORDER as totalQuantity,
QSHIP as quantityShipped,UNITP as unitRevenue,
SUBTOTAL as extendedRevenue,SHIP_DATE as requestedShipDate,
DOC_NO as orderNumber,SHIPTO as locationCode,ACCTNO as customerId,
CITY as shipCity,STATE as shipState,COUNTRY as shipCountry,
ZIP as shipPostalCode,ACCTNO as accountSkuNumber
from salesorder 
where ship_date is not null and ship_complete !='N')

select  lineItemXref,sku,orderStatus,orderType,account,accountClass,accountNumber,
        totalQuantity,quantityShipped,unitRevenue,extendedRevenue,
        requestedShipDate,orderNumber,locationCode,customerId
        ,shipCity,shipState,shipCountry,shipPostalCode,accountSkuNumber
from cte;

COPY INTO @adp/adp/SAFIO_SALES_ORDER/sales_order.csv from (select * from SAFIO_SALES_ORDER)
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true HEADER = TRUE single = true max_file_size = 4900000000;







create or replace table SAFIO_SALES_ORDERS_Small as select distinct(LINE) as lineItemXref, PARTNUMBER||'-'||COND as sku,
STATUS as orderStatus,LINE_TYPE as orderType, NAME as account,ALT2
as accountClass, ACCTNO as accountNumber,QORDER as totalQuantity,
QSHIP as quantityShipped,UNITP as unitRevenue,
SUBTOTAL as extendedRevenue,SHIP_DATE as requestedShipDate,
DOC_NO as orderNumber,SHIPTO as locationCode,ACCTNO as customerId,
CITY as shipCity,STATE as shipState,COUNTRY as shipCountry,
ZIP as shipPostalCode,ACCTNO as accountSkuNumber
from salesorder 
where ship_date is not null and ship_complete !='N';

ALTER TABLE SAFIO_SALES_ORDERS_Small ADD COLUMN dataSource VARCHAR DEFAULT 'EXAVAULT';

create or replace table SAFIO_SALES_ORDERS_BIG as select distinct(LINE) as lineItemXref, PARTNUMBER||'-'||COND as sku,
STATUS as orderStatus,LINE_TYPE as orderType, NAME as account,ALT2
as accountClass, ACCTNO as accountNumber,QORDER as totalQuantity,
QSHIP as quantityShipped,UNITP as unitRevenue,
SUBTOTAL as extendedRevenue,SHIP_DATE as requestedShipDate,
DOC_NO as orderNumber,SHIPTO as locationCode,ACCTNO as customerId,
CITY as shipCity,STATE as shipState,COUNTRY as shipCountry,
ZIP as shipPostalCode,ACCTNO as accountSkuNumber
from salesorder 
where ship_date is not null;
ALTER TABLE SAFIO_SALES_ORDERS_BIG ADD COLUMN dataSource VARCHAR DEFAULT 'EXAVAULT';

//###################### To discuss the small and big table problem.....
//where ship_date is not null and ship_complete !='N'

COPY INTO @adp/adp/SAFIO_SALES_ORDERS/SAFIO_SALES_ORDERS_Small/sales_orders.csv 
                                                from (select distinct(lineItemXref),dataSource
                                                             ,sku,orderStatus,orderType,account,
                                                             accountClass,accountNumber,
                                                             totalQuantity,quantityShipped,
                                                             unitRevenue,extendedRevenue,
                                                             requestedShipDate,orderNumber,locationCode,customerId
                                                             ,shipCity,shipState,shipCountry,shipPostalCode,accountSkuNumber
                                                             from SAFIO_SALES_ORDERS_Small)
file_format = (type ='csv' field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_SALES_ORDERS/SAFIO_SALES_ORDERS_BIG/sales_orders.csv 
                                                from (select distinct(lineItemXref),dataSource
                                                             ,sku,orderStatus,orderType,account,
                                                             accountClass,accountNumber,
                                                             totalQuantity,quantityShipped,
                                                             unitRevenue,extendedRevenue,
                                                             requestedShipDate,orderNumber,locationCode,customerId
                                                             ,shipCity,shipState,shipCountry,shipPostalCode,accountSkuNumber
                                                             from SAFIO_SALES_ORDERS_BIG)
file_format = (type ='csv' field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;
