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
