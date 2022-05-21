create or replace table SAFIO_EXTERNAL_PURCHASE_ORDER as
select distinct(LINE) as lineItemXref, PARTNUMBER||'-'||COND as sku, 
STATUS as poStatus,ENTER_DATE as transactionDate,DUE_DATE
as requestedShipDate,QORDER as qtyOrdered, ACCTNO as vendorCode,
SUBTOTAL as openExtendedCost, DOC_NO || '-' || LINE as poNumber,
ACCTNO ||'-'||PARTNUMBER || '-' || COND as vendorSku
from purchaseorder;

ALTER TABLE SAFIO_EXTERNAL_PURCHASE_ORDER ADD COLUMN locationCode VARCHAR DEFAULT 'EXAVAULT';

