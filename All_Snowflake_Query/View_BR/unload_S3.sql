COPY INTO @adp/adp/SAFIO_VENDORS/SAFIO_VENDORS.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_PRODUCTS/safio_products.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000 OVERWRITE=TRUE;

COPY INTO @adp/adp/SAFIO_SALES_ORDERS/SAFIO_SALES_ORDERS.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_SHIPMENTS/SAFIO_SHIPMENTS.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_EXTERNAL_PURCHASE_ORDER/SAFIO_EXTERNAL_PURCHASE_ORDER.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;
