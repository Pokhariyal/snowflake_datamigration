create table SAFIO_PRODUCTS (SKU VARCHAR(36),DESCRIPTION VARCHAR(50),PRODUCTUNITOFMEASURE VARCHAR(5),UNITCOST NUMBER(28,9),
                            RETAILPRICE NUMBER(28,9),WHOLESALEPRICE NUMBER(28,9),DROPSHIPPRICE NUMBER(28,9),ASSEMBLYCOST NUMBER(28,9),
                            planner varchar default null,productId varchar default null,fileUpdate timestamp default null,SkuStatus varchar default null,
                             ATTR1 NUMBER(28,9), ATTR2 NUMBER(28,9),ATTR3 NUMBER(28,9),ATTR4 VARCHAR(1),ATTR5 VARCHAR(30),ATTR6 VARCHAR(30),
                             ATTR7 VARCHAR(1),ATTR8 VARCHAR(60),ATTR9 VARCHAR(60),ATTR10 VARCHAR(60),ATTR11 VARCHAR(60),Attr12 varchar default null
                            );


INSERT INTO SAFIO_PRODUCTS (SKU,DESCRIPTION,PRODUCTUNITOFMEASURE,UNITCOST,RETAILPRICE,WHOLESALEPRICE,DROPSHIPPRICE,ASSEMBLYCOST,
                            ATTR1,ATTR2,ATTR3,ATTR4,ATTR5,ATTR6,ATTR7,ATTR8,ATTR9,ATTR10,ATTR11)
  WITH cte AS
    (select distinct(SKU) as sku,DESCRIPTN as description, QTY_INSTOCKUM as productUnitOfMeasure ,
STD_COST as unitCost,USER_BASE_PRICE as retailPrice,SELLPRICE as wholesalePrice,USERPRICE as dropShipPrice,
CORE_COST as assemblyCost,SELLPRICE1 as Attr1, SELLPRICE2 as Attr2,USERPRICE as Attr3, SERIALIZED as Attr4, ALT1
as Attr5, ALT2 as Attr6,PN_HAZMAT as Attr7,FIELD1 as Attr8,FIELD2 as Attr9,FIELD8 as Attr10,FIELD10 as Attr11
from inventory
    )
  SELECT SKU,DESCRIPTION,PRODUCTUNITOFMEASURE,UNITCOST,RETAILPRICE,WHOLESALEPRICE,DROPSHIPPRICE,ASSEMBLYCOST,
  ATTR1,ATTR2,ATTR3,ATTR4,ATTR5,ATTR6,ATTR7,ATTR8,ATTR9,ATTR10,ATTR11
  FROM cte;


COPY INTO @adp/adp/SAFIO_PRODUCTS/products_test.csv from (select * from safio_products limit 250)
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true single = True max_file_size = 4900000000;
