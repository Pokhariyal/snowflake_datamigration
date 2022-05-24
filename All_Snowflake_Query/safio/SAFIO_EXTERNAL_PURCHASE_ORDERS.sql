create table SAFIO_EXTERNAL_PURCHASE_ORDER ( lineItemXref NUMBER(28,9),sku VARCHAR(36),poStatus VARCHAR(5),transactionDate TIMESTAMP_NTZ(9),
                                            requestedShipDate TIMESTAMP_NTZ(9),estimatedReceiptDate VARCHAR DEFAULT null,QTYORDERED NUMBER(28,9),
                                            qtyOpen VARCHAR DEFAULT null,qtyCanceled VARCHAR DEFAULT null, qtyReceived VARCHAR DEFAULT null,
                                            VENDORCODE VARCHAR(12),contractedPrice VARCHAR DEFAULT null,OPENEXTENDEDCOST NUMBER(28,9),
                                            locationCode VARCHAR DEFAULT 'EXAVAULT',PONUMBER VARCHAR(16777216), fileUpdate TIMESTAMP_NTZ(9) DEFAULT null,
                                            notes varchar DEFAULT null, vendorNotes varchar DEFAULT null,vendorSku VARCHAR(49)
                                            );

insert into SAFIO_EXTERNAL_PURCHASE_ORDER (lineItemXref,sku,poStatus,transactionDate,requestedShipDate,qtyOrdered,vendorCode,
        openExtendedCost,poNumber,vendorSku) 
with cte as 
 (       select distinct(LINE) as lineItemXref, PARTNUMBER||'-'||COND as sku, 
STATUS as poStatus,ENTER_DATE as transactionDate,DUE_DATE
as requestedShipDate,QORDER as qtyOrdered, ACCTNO as vendorCode,
SUBTOTAL as openExtendedCost, DOC_NO || '-' || LINE as poNumber,
ACCTNO ||'-'||PARTNUMBER || '-' || COND as vendorSku
from purchaseorder
)
select lineItemXref,sku,poStatus,transactionDate,requestedShipDate,qtyOrdered,vendorCode,
        openExtendedCost,poNumber,vendorSku
        from cte;
        

COPY INTO @adp/adp/SAFIO_EXTERNAL_PURCHASE_ORDER/external_purchase_order.csv from (select * from SAFIO_EXTERNAL_PURCHASE_ORDER)
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;




-- # not required
create or replace table SAFIO_EXTERNAL_PURCHASE_ORDER as
select distinct(LINE) as lineItemXref, PARTNUMBER||'-'||COND as sku, 
STATUS as poStatus,ENTER_DATE as transactionDate,DUE_DATE
as requestedShipDate,QORDER as qtyOrdered, ACCTNO as vendorCode,
SUBTOTAL as openExtendedCost, DOC_NO || '-' || LINE as poNumber,
ACCTNO ||'-'||PARTNUMBER || '-' || COND as vendorSku
from purchaseorder;

ALTER TABLE SAFIO_EXTERNAL_PURCHASE_ORDER ADD COLUMN locationCode VARCHAR DEFAULT 'EXAVAULT';

