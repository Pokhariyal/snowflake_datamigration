/*copy into @adp/adp/test5/
from test
file_format = (type = csv
        field_optionally_enclosed_by='"'
        COMPRESSION = 'NONE');
        
        */
copy into @adp/adp/SAFIO_PRODUCTS/
from SAFIO_PRODUCTS
file_format = (type = csv
        field_optionally_enclosed_by='"'
        COMPRESSION = 'NONE');

COPY INTO @adp/adp/SAFIO_SALES_ORDERS/SAFIO_SALES_ORDERS.csv from SAFIO_SALES_ORDERS
file_format = (type ='csv' compression=none) single = false max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_VENDORS/SAFIO_VENDORS.csv from SAFIO_VENDORS
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_PRODUCTS/safio_products.csv from safio_products
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_SHIPMENTS/SAFIO_SHIPMENTS.csv from SAFIO_SHIPMENTS
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;

COPY INTO @adp/adp/SAFIO_EXTERNAL_PURCHASE_ORDER/SAFIO_EXTERNAL_PURCHASE_ORDER.csv from SAFIO_EXTERNAL_PURCHASE_ORDER
file_format = (type ='csv' compression=none) single = True max_file_size = 4900000000;
