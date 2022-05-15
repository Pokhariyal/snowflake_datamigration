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
