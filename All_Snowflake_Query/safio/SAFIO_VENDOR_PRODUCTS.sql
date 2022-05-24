create table SAFIO_VENDOR_PRODUCTS (SKU VARCHAR(36),VENDORSKU VARCHAR(49),
                                    priority varchar default null,CONTRACTEDPRICE NUMBER(28,9),
                                    orderIncrement varchar default null,packedIncrement varchar default null,
                                    poLineItemMinOrderQty varchar default null,poLineItemMaxOrderQty varchar default null,
                                    poLineItemMinOrderAmt varchar default null,poLineItemMaxOrderAmt varchar default null,
                                    purchaseLeadTime varchar default null,VENDORCODE VARCHAR(12),vendorName varchar default null,
                                    fileUpdate TIMESTAMP_NTZ(9) default null
                                   );

INSERT INTO SAFIO_VENDOR_PRODUCTS (SKU,VENDORSKU,CONTRACTEDPRICE,vendorCode)
with cte as (
SELECT b.partnumber || '-' || b.cond as SKU,b.acctno || '-' || b.partnumber || '-' || b.cond as vendorSku,
        b.unitp as contractedPrice,a.acctno as vendorCode
FROM adp_PO_HDR a
INNER JOIN adp_PO_LINE b
ON a.DOC_NO = b.DOC_NO
WHERE b.QORDER >0
ORDER BY a.ENTER_DATE)
select SKU,vendorSku,contractedPrice,vendorCode from cte ;
