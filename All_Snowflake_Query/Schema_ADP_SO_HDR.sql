CREATE or replace TABLE ADP_SO_HDR(
	DOC_NO int NOT NULL,
	PARENT_DOC_NO int NULL,
	PARENT_DOCCATEGORY varchar(10) NULL,
	PARENT_LINE decimal(28, 9) ,
	USER_DOC char(20) NOT NULL,
	DOC_TYPE char(2) NOT NULL,
	DOC_CATEGORY char(2) NOT NULL,
	DOC_STATUS smallint NULL,
	PROC_TYPE char(2) NULL,
	ACCTNO char(12) not NULL,
	SUBC char(5) not NULL,
	CCODE char(5) NULL,
	OURCONTACT char(4) NULL,
	LINES int NULL,
	ULINES char(1) ,
	ENTER_DATE datetime NULL,
	DOC_DATE datetime NULL,
	DUE_DATE datetime NULL,
	SHIP_DATE datetime NULL,
	SHIP_COMPLETE char(1) ,
	PRICED_DATE datetime NULL,
	VALIDTILL_DATE datetime NULL,
	VALIDFOR smallint NULL,
	AMENDED datetime NULL,
	ACKNLDGE datetime NULL,
	RECV_DATE datetime NULL,
	PICKED_DATE datetime NULL,
	SHIPPED_DATE datetime NULL,
	REVISION varchar(20) NULL,
	POST_GL_DATE datetime NULL,
	POST_STK_DATE datetime NULL,
	APPROVED_DATE datetime NULL,
	BATCH_NO int NULL,
	BATCH_DATE datetime NULL,
	PRINTED_DATE datetime NULL,
	PRINTED_COUNT smallint NULL,
	CUST_REF1 char(22) NULL,
	CUST_REF2 char(22) NULL,
	CUST_REF3 char(22) NULL,
	CUST_REF4 char(22) NULL,
	DROPSHIP char(1) NULL,
	DROPSHIP_ACCT char(12) NULL,
	DROPSHIP_SUBC char(5) NULL,
	DROPSHIP_CCODE char(5) NULL,
	DROPSHIPTO smallint NULL,
	SHIPTO smallint NULL,
	SHIPTO_SUBC char(5) NULL,
	SHIPTO_CCODE char(4) NULL,
	BILLTO smallint NULL,
	BILLTO_SUBC char(5) NULL,
	BILLTO_CCODE char(4) NULL,
	PAYTO smallint NULL,
	PAYTO_SUBC char(5) NULL,
	PAYTO_CCODE char(4) NULL,
	COMPANYNO smallint ,
	DIVISION char(5) NULL,
	DEPART char(5) NULL,
	HOLD_DATE datetime NULL,
	HOLD_BY char(4) NULL,
	HOLD_REASON char(5) NULL,
	DELIVERY char(1) ,
	TERM_CODE char(5) NULL,
	PRIORITY char(5) NULL,
	SHIPVIA varchar(20) NULL,
	FOB varchar(20) NULL,
	FOB_LBL char(10) NULL,
	PACKAGES int NULL,
	SHIPMENT_NO int NULL,
	CONSOL_NO int NULL,
	HOUS_AIRBILL varchar(30) NULL,
	MAST_AIRBILL varchar(30) NULL,
	PRINT_PN_MEM1 char(1) ,
	PRINT_PN_MEM2 char(1) ,
	PRINT_DOC_MSG char(1) ,
	PRINT_DOC_MEM char(1) ,
	DOC_INVNO char(20) NULL,
	DOC_INVAMOUNT decimal(28, 9) ,
	GL_ACCOUNT char(15) NULL,
	GL_BYLINE char(1) ,
	FORM_1099TYPE char(2) NULL,
	SMAN1_CODE char(4) NULL,
	SMAN2_CODE char(4) NULL,
	SMAN3_CODE char(4) NULL,
	SMAN4_CODE char(4) NULL,
	SMAN5_CODE char(4) NULL,
	SMAN1_PERC decimal(28, 9) ,
	SMAN2_PERC decimal(28, 9) ,
	SMAN3_PERC decimal(28, 9) ,
	SMAN4_PERC decimal(28, 9) ,
	SMAN5_PERC decimal(28, 9) ,
	SMAN1_DOCLN char(1) ,
	SMAN2_DOCLN char(1) ,
	SMAN3_DOCLN char(1) ,
	SMAN4_DOCLN char(1) ,
	SMAN5_DOCLN char(1) ,
	SMAN1_NG char(1) ,
	SMAN2_NG char(1) ,
	SMAN3_NG char(1) ,
	SMAN4_NG char(1) ,
	SMAN5_NG char(1) ,
	WGHT_TO char(5) NULL,
	VOL_TO char(5) NULL,
	LENGTH_TO char(5) NULL,
	WGHT_TTL decimal(28, 9) ,
	VOL_TTL decimal(28, 9) ,
	LENGTH_TTL decimal(28, 9) ,
	WGHT_GROSS decimal(28, 9) ,
	VOL_GROSS decimal(28, 9) ,
	LENGTH_GROSS decimal(28, 9) ,
	CURENCY_STATE char(1) ,
	CURENCY_BASE char(5) NULL,
	CURENCY_CONV char(5) NULL,
	CURENCY_FACTOR decimal(28, 9) ,
	CURENCY_DATE datetime NULL,
	SIGN_1 char(4) NULL,
	SIGN_2 char(4) NULL,
	SIGN_3 char(4) NULL,
	SIGN_4 char(4) NULL,
	SIGN_5 char(4) NULL,
	SIGN_1_APR char(1) ,
	SIGN_2_APR char(1) ,
	SIGN_3_APR char(1) ,
	SIGN_4_APR char(1) ,
	SIGN_5_APR char(1) ,
	SIGN_1_DATE datetime NULL,
	SIGN_2_DATE datetime NULL,
	SIGN_3_DATE datetime NULL,
	SIGN_4_DATE datetime NULL,
	SIGN_5_DATE datetime NULL,
	DISC_TYPE char(1) ,
	MISC1_TYPE char(1) ,
	MISC2_TYPE char(1) ,
	MISC3_TYPE char(1) ,
	MISC4_TYPE char(1) ,
	MISC5_TYPE char(1) ,
	MISC6_TYPE char(1) ,
	DISC_PERC decimal(28, 9) ,
	MISC1_PERC decimal(28, 9) ,
	MISC2_PERC decimal(28, 9) ,
	MISC3_PERC decimal(28, 9) ,
	MISC4_PERC decimal(28, 9) ,
	MISC5_PERC decimal(28, 9) ,
	MISC6_PERC decimal(28, 9) ,
	MISC1_PRN char(1) ,
	MISC2_PRN char(1) ,
	MISC3_PRN char(1) ,
	MISC4_PRN char(1) ,
	MISC5_PRN char(1) ,
	MISC6_PRN char(1) ,
	MISC1_TTL char(1) ,
	MISC2_TTL char(1) ,
	MISC3_TTL char(1) ,
	MISC4_TTL char(1) ,
	MISC5_TTL char(1) ,
	MISC6_TTL char(1) ,
	LABOR_MISC1_TTL char(1) ,
	LABOR_MISC2_TTL char(1) ,
	LABOR_MISC3_TTL char(1) ,
	LABOR_MISC4_TTL char(1) ,
	LABOR_MISC5_TTL char(1) ,
	LABOR_MISC6_TTL char(1) ,
	DISC_DOCLN char(1) ,
	MISC1_DOCLN char(1) ,
	MISC2_DOCLN char(1) ,
	MISC3_DOCLN char(1) ,
	MISC4_DOCLN char(1) ,
	MISC5_DOCLN char(1) ,
	MISC6_DOCLN char(1) ,
	TAX_SUBTOTAL_DOCLN char(1) ,
	TAX_SUBTOTAL_TYPE char(1) ,
	TAX_A_CODE char(5) NULL,
	TAX_B_CODE char(5) NULL,
	TAX_C_CODE char(5) NULL,
	TAX_A_PERC decimal(28, 9) ,
	TAX_B_PERC decimal(28, 9) ,
	TAX_C_PERC decimal(28, 9) ,
	TAX_A_AMT decimal(28, 9) ,
	TAX_B_AMT decimal(28, 9) ,
	TAX_C_AMT decimal(28, 9) ,
	ADDITIONAL_TAX_AMT decimal(28, 9) ,
	TAX_A_TTL char(1) ,
	TAX_B_TTL char(1) ,
	TAX_C_TTL char(1) ,
	TAX_ON_TAX_B char(1) ,
	TAX_A_CALC char(1) ,
	TAX_B_CALC char(1) ,
	SUB_TAX_A char(1) ,
	SUB_TAX_B char(1) ,
	SUB_TAX_AMT decimal(28, 9) ,
	M1_TAX_A char(1) ,
	M1_TAX_B char(1) ,
	M1_TAX_AMT decimal(28, 9) ,
	M2_TAX_A char(1) ,
	M2_TAX_B char(1) ,
	M2_TAX_AMT decimal(28, 9) ,
	M3_TAX_A char(1) ,
	M3_TAX_B char(1) ,
	M3_TAX_AMT decimal(28, 9) ,
	M4_TAX_A char(1) ,
	M4_TAX_B char(1) ,
	M4_TAX_AMT decimal(28, 9) ,
	M5_TAX_A char(1) ,
	M5_TAX_B char(1) ,
	M5_TAX_AMT decimal(28, 9) ,
	M6_TAX_A char(1) ,
	M6_TAX_B char(1) ,
	M6_TAX_AMT decimal(28, 9) ,
	AEROXCHANGE char(1) ,
	LINE_TAX_A_AMT decimal(28, 9) ,
	LINE_TAX_B_AMT decimal(28, 9) ,
	LINE_TAX_C_AMT decimal(28, 9) ,
	HDR_TAX_A_AMT decimal(28, 9) ,
	HDR_TAX_B_AMT decimal(28, 9) ,
	HDR_TAX_C_AMT decimal(28, 9) ,
	TAX_A_GL char(15) NULL,
	TAX_B_GL char(15) NULL,
	TAX_C_GL char(15) NULL,
	SUBTOTAL decimal(28, 9) ,
	DISC_AMT decimal(28, 9) ,
	SUBTOTALNET decimal(28, 9) ,
	SMAN1_AMT decimal(28, 9) ,
	SMAN2_AMT decimal(28, 9) ,
	SMAN3_AMT decimal(28, 9) ,
	SMAN4_AMT decimal(28, 9) ,
	SMAN5_AMT decimal(28, 9) ,
	MISC1_AMT decimal(28, 9) ,
	MISC2_AMT decimal(28, 9) ,
	MISC3_AMT decimal(28, 9) ,
	MISC4_AMT decimal(28, 9) ,
	MISC5_AMT decimal(28, 9) ,
	MISC6_AMT decimal(28, 9) ,
	MISC1_AMT_PAID decimal(28, 9) ,
	MISC2_AMT_PAID decimal(28, 9) ,
	MISC3_AMT_PAID decimal(28, 9) ,
	MISC4_AMT_PAID decimal(28, 9) ,
	MISC5_AMT_PAID decimal(28, 9) ,
	MISC6_AMT_PAID decimal(28, 9) ,
	DOC_TOTAL decimal(28, 9) ,
	C_SUBTOTAL decimal(28, 9) ,
	C_DISC_AMT decimal(28, 9) ,
	C_SUBTOTALNET decimal(28, 9) ,
	C_SMAN1_AMT decimal(28, 9) ,
	C_SMAN2_AMT decimal(28, 9) ,
	C_SMAN3_AMT decimal(28, 9) ,
	C_SMAN4_AMT decimal(28, 9) ,
	C_SMAN5_AMT decimal(28, 9) ,
	C_MISC1_AMT decimal(28, 9) ,
	C_MISC2_AMT decimal(28, 9) ,
	C_MISC3_AMT decimal(28, 9) ,
	C_MISC4_AMT decimal(28, 9) ,
	C_MISC5_AMT decimal(28, 9) ,
	C_MISC6_AMT decimal(28, 9) ,
	C_MISC1_AMT_PAID decimal(28, 9) ,
	C_MISC2_AMT_PAID decimal(28, 9) ,
	C_MISC3_AMT_PAID decimal(28, 9),
CONSTRAINT SO_HDR_PK PRIMARY KEY (DOC_NO)
);
