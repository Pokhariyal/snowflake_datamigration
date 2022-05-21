COPY INTO @adp/adp/SAFIO_SHIPMENTS/SAFIO_SHIPMENTS.csv from (select distinct(lineItemXref),dataSource
                                                             ,sku,orderStatus,orderType
                                                             ,account,accountClass,accountNumber,
                                                             totalQuantity, quantityShipped,
                                                             unitRevenue,extendedRevenue,requestedShipDate,
                                                             orderNumber,locationCode,customerId,shipCity,
                                                             shipState,shipCountry,shipPostalCode,accountSkuNumber
                                                                from SAFIO_SHIPMENTS)
file_format = (type ='csv' field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;
-- ################# challenges
-- export to deal with null values as showing as /N i used null_if =() in the satement.
