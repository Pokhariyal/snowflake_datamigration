CREATE or replace TABLE adp_PO_HDR(
	DOC_NO int NOT NULL,
	PARENT_DOC_NO int NULL,
	PARENT_DOCCATEGORY varchar(10) NULL,
	PARENT_LINE decimal(28, 9) NULL ,
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
	ULINES char(1) NULL ,
	ENTER_DATE datetime NULL,
	DOC_DATE datetime NULL,
	DUE_DATE datetime NULL,
	SHIP_DATE datetime NULL,
	SHIP_COMPLETE char(1) NULL ,
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
	COMPANYNO smallint NULL ,
	DIVISION char(5) NULL,
	DEPART char(5) NULL,
	HOLD_DATE datetime NULL,
	HOLD_BY char(4) NULL,
	HOLD_REASON char(5) NULL,
	DELIVERY char(1) NULL ,
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
	PRINT_PN_MEM1 char(1) NULL ,
	PRINT_PN_MEM2 char(1) NULL ,
	PRINT_DOC_MSG char(1) NULL ,
	PRINT_DOC_MEM char(1) NULL ,
	DOC_INVNO char(20) NULL,
	DOC_INVAMOUNT decimal(28, 9) NULL ,
	GL_ACCOUNT char(15) NULL,
	GL_BYLINE char(1) NULL ,
	FORM_1099TYPE char(2) NULL,
	SMAN1_CODE char(4) NULL,
	SMAN2_CODE char(4) NULL,
	SMAN3_CODE char(4) NULL,
	SMAN4_CODE char(4) NULL,
	SMAN5_CODE char(4) NULL,
	SMAN1_PERC decimal(28, 9) NULL ,
	SMAN2_PERC decimal(28, 9) NULL ,
	SMAN3_PERC decimal(28, 9) NULL ,
	SMAN4_PERC decimal(28, 9) NULL ,
	SMAN5_PERC decimal(28, 9) NULL ,
	SMAN1_DOCLN char(1) NULL ,
	SMAN2_DOCLN char(1) NULL ,
	SMAN3_DOCLN char(1) NULL ,
	SMAN4_DOCLN char(1) NULL ,
	SMAN5_DOCLN char(1) NULL ,
	SMAN1_NG char(1) NULL ,
	SMAN2_NG char(1) NULL ,
	SMAN3_NG char(1) NULL ,
	SMAN4_NG char(1) NULL ,
	SMAN5_NG char(1) NULL ,
	WGHT_TO char(5) NULL,
	VOL_TO char(5) NULL,
	LENGTH_TO char(5) NULL,
	WGHT_TTL decimal(28, 9) NULL ,
	VOL_TTL decimal(28, 9) NULL ,
	LENGTH_TTL decimal(28, 9) NULL ,
	WGHT_GROSS decimal(28, 9) NULL ,
	VOL_GROSS decimal(28, 9) NULL ,
	LENGTH_GROSS decimal(28, 9) NULL ,
	CURENCY_STATE char(1) NULL ,
	CURENCY_BASE char(5) NULL,
	CURENCY_CONV char(5) NULL,
	CURENCY_FACTOR decimal(28, 9) NULL ,
	CURENCY_DATE datetime NULL,
	SIGN_1 char(4) NULL,
	SIGN_2 char(4) NULL,
	SIGN_3 char(4) NULL,
	SIGN_4 char(4) NULL,
	SIGN_5 char(4) NULL,
	SIGN_1_APR char(1) NULL ,
	SIGN_2_APR char(1) NULL ,
	SIGN_3_APR char(1) NULL ,
	SIGN_4_APR char(1) NULL ,
	SIGN_5_APR char(1) NULL ,
	SIGN_1_DATE datetime NULL,
	SIGN_2_DATE datetime NULL,
	SIGN_3_DATE datetime NULL,
	SIGN_4_DATE datetime NULL,
	SIGN_5_DATE datetime NULL,
	DISC_TYPE char(1) NULL ,
	MISC1_TYPE char(1) NULL ,
	MISC2_TYPE char(1) NULL ,
	MISC3_TYPE char(1) NULL ,
	MISC4_TYPE char(1) NULL ,
	MISC5_TYPE char(1) NULL ,
	MISC6_TYPE char(1) NULL ,
	DISC_PERC decimal(28, 9) NULL ,
	MISC1_PERC decimal(28, 9) NULL ,
	MISC2_PERC decimal(28, 9) NULL ,
	MISC3_PERC decimal(28, 9) NULL ,
	MISC4_PERC decimal(28, 9) NULL ,
	MISC5_PERC decimal(28, 9) NULL ,
	MISC6_PERC decimal(28, 9) NULL ,
	MISC1_PRN char(1) NULL ,
	MISC2_PRN char(1) NULL ,
	MISC3_PRN char(1) NULL ,
	MISC4_PRN char(1) NULL ,
	MISC5_PRN char(1) NULL ,
	MISC6_PRN char(1) NULL ,
	MISC1_TTL char(1) NULL ,
	MISC2_TTL char(1) NULL ,
	MISC3_TTL char(1) NULL ,
	MISC4_TTL char(1) NULL ,
	MISC5_TTL char(1) NULL ,
	MISC6_TTL char(1) NULL ,
	LABOR_MISC1_TTL char(1) NULL ,
	LABOR_MISC2_TTL char(1) NULL ,
	LABOR_MISC3_TTL char(1) NULL ,
	LABOR_MISC4_TTL char(1) NULL ,
	LABOR_MISC5_TTL char(1) NULL ,
	LABOR_MISC6_TTL char(1) NULL ,
	DISC_DOCLN char(1) NULL ,
	MISC1_DOCLN char(1) NULL ,
	MISC2_DOCLN char(1) NULL ,
	MISC3_DOCLN char(1) NULL ,
	MISC4_DOCLN char(1) NULL ,
	MISC5_DOCLN char(1) NULL ,
	MISC6_DOCLN char(1) NULL ,
	TAX_SUBTOTAL_DOCLN char(1) NULL ,
	TAX_SUBTOTAL_TYPE char(1) NULL ,
	TAX_A_CODE char(5) NULL,
	TAX_B_CODE char(5) NULL,
	TAX_C_CODE char(5) NULL,
	TAX_A_PERC decimal(28, 9) NULL ,
	TAX_B_PERC decimal(28, 9) NULL ,
	TAX_C_PERC decimal(28, 9) NULL ,
	TAX_A_AMT decimal(28, 9) NULL ,
	TAX_B_AMT decimal(28, 9) NULL ,
	TAX_C_AMT decimal(28, 9) NULL ,
	ADDITIONAL_TAX_AMT decimal(28, 9) NULL ,
	TAX_A_TTL char(1) NULL ,
	TAX_B_TTL char(1) NULL ,
	TAX_C_TTL char(1) NULL ,
	TAX_ON_TAX_B char(1) NULL ,
	TAX_A_CALC char(1) NULL ,
	TAX_B_CALC char(1) NULL ,
	SUB_TAX_A char(1) NULL ,
	SUB_TAX_B char(1) NULL ,
	SUB_TAX_AMT decimal(28, 9) NULL ,
	M1_TAX_A char(1) NULL ,
	M1_TAX_B char(1) NULL ,
	M1_TAX_AMT decimal(28, 9) NULL ,
	M2_TAX_A char(1) NULL ,
	M2_TAX_B char(1) NULL ,
	M2_TAX_AMT decimal(28, 9) NULL ,
	M3_TAX_A char(1) NULL ,
	M3_TAX_B char(1) NULL ,
	M3_TAX_AMT decimal(28, 9) NULL ,
	M4_TAX_A char(1) NULL ,
	M4_TAX_B char(1) NULL ,
	M4_TAX_AMT decimal(28, 9) NULL ,
	M5_TAX_A char(1) NULL ,
	M5_TAX_B char(1) NULL ,
	M5_TAX_AMT decimal(28, 9) NULL ,
	M6_TAX_A char(1) NULL ,
	M6_TAX_B char(1) NULL ,
	M6_TAX_AMT decimal(28, 9) NULL ,
	AEROXCHANGE char(1) NULL ,
	LINE_TAX_A_AMT decimal(28, 9) NULL ,
	LINE_TAX_B_AMT decimal(28, 9) NULL ,
	LINE_TAX_C_AMT decimal(28, 9) NULL ,
	HDR_TAX_A_AMT decimal(28, 9) NULL ,
	HDR_TAX_B_AMT decimal(28, 9) NULL ,
	HDR_TAX_C_AMT decimal(28, 9) NULL ,
	TAX_A_GL char(15) NULL,
	TAX_B_GL char(15) NULL,
	TAX_C_GL char(15) NULL,
	SUBTOTAL decimal(28, 9) NULL ,
	DISC_AMT decimal(28, 9) NULL ,
	SUBTOTALNET decimal(28, 9) NULL ,
	SMAN1_AMT decimal(28, 9) NULL ,
	SMAN2_AMT decimal(28, 9) NULL ,
	SMAN3_AMT decimal(28, 9) NULL ,
	SMAN4_AMT decimal(28, 9) NULL ,
	SMAN5_AMT decimal(28, 9) NULL ,
	MISC1_AMT decimal(28, 9) NULL ,
	MISC2_AMT decimal(28, 9) NULL ,
	MISC3_AMT decimal(28, 9) NULL ,
	MISC4_AMT decimal(28, 9) NULL ,
	MISC5_AMT decimal(28, 9) NULL ,
	MISC6_AMT decimal(28, 9) NULL ,
	MISC1_AMT_PAID decimal(28, 9) NULL ,
	MISC2_AMT_PAID decimal(28, 9) NULL ,
	MISC3_AMT_PAID decimal(28, 9) NULL ,
	MISC4_AMT_PAID decimal(28, 9) NULL ,
	MISC5_AMT_PAID decimal(28, 9) NULL ,
	MISC6_AMT_PAID decimal(28, 9) NULL ,
	DOC_TOTAL decimal(28, 9) NULL ,
	C_SUBTOTAL decimal(28, 9) NULL ,
	C_DISC_AMT decimal(28, 9) NULL ,
	C_SUBTOTALNET decimal(28, 9) NULL ,
	C_SMAN1_AMT decimal(28, 9) NULL ,
	C_SMAN2_AMT decimal(28, 9) NULL ,
	C_SMAN3_AMT decimal(28, 9) NULL ,
	C_SMAN4_AMT decimal(28, 9) NULL ,
	C_SMAN5_AMT decimal(28, 9) NULL ,
	C_MISC1_AMT decimal(28, 9) NULL ,
	C_MISC2_AMT decimal(28, 9) NULL ,
	C_MISC3_AMT decimal(28, 9) NULL ,
	C_MISC4_AMT decimal(28, 9) NULL ,
	C_MISC5_AMT decimal(28, 9) NULL ,
	C_MISC6_AMT decimal(28, 9) NULL ,
	C_MISC1_AMT_PAID decimal(28, 9) NULL ,
	C_MISC2_AMT_PAID decimal(28, 9) NULL ,
	C_MISC3_AMT_PAID decimal(28, 9) NULL,
CONSTRAINT PO_HDR_PK PRIMARY KEY (DOC_NO)
);
