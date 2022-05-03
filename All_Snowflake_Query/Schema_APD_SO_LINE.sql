CREATE TABLE ADP_SO_LINE(
	DOC_NO int NOT NULL,
	LINE decimal(28, 9) NOT NULL ,
	ACCTNO char(12) not NULL,
	SUBC char(5) not NULL,
	BLINE decimal(28, 9) NULL ,
	BLINEYN char(1) NULL ,
	ULINE1 char(6) NULL,
	ULINE2 char(6) NULL,
	NOCHARGE char(1) NULL ,
	LINE_TYPE char(2) NULL,
	LSTATUS char(1) NULL,
	CANCELED char(1) NULL,
	UNDER_WARRANTY char(1) NULL ,
	CLOSE_QBACK char(1) NULL ,
	STATUS char(5) NULL,
	PRINTLINE char(1) NULL ,
	HPOST char(1) NULL ,
	PRINTED datetime NULL,
	NO_CHARGE char(1) NULL ,
	PARTNUMBER char(30) NULL,
	SUBP char(5) NULL,
	PARTSERIAL int NULL,
	PART_SSN int NULL,
	SERIAL_NO char(30) NULL,
	LOGNO int NULL,
	CUST_PN char(30) NULL,
	DESCRIPTN char(50) NULL,
	NOTE varchar(100) NULL,
	ALT1 char(30) NULL,
	ALT2 char(30) NULL,
	CATEGORY char(10) NULL,
	PICK_STATUS int NULL,
	PICK_LOCATION char(5) NULL,
	PN_RCV_AS char(30) NULL,
	PN_RCV_AS_SUBP char(5) NULL,
	PN_RCV_LOGNO int NULL,
	QREQ decimal(28, 9) NULL ,
	QTY_UM char(5) NULL,
	QORDER decimal(28, 9) NULL ,
	QSHIP decimal(28, 9) NULL ,
	QBACK decimal(28, 9) NULL ,
	QTY_CHANGE decimal(28, 9) NULL ,
	QTY_CHANGE_UM char(5) NULL,
	QTY_FACTOR decimal(28, 9) NULL ,
	QTY_CONVERT decimal(28, 9) NULL ,
	QSCHEDULE char(1) NULL ,
	UNITP decimal(28, 9) NULL ,
	UNITP_UM char(5) NULL,
	UNITP1 decimal(28, 9) NULL ,
	UNITP1_UM char(5) NULL,
	UNITP2 decimal(28, 9) NULL ,
	UNITP2_UM char(5) NULL,
	UNITP3 decimal(28, 9) NULL ,
	UNITP3_UM char(5) NULL,
	SOURCE_PRICE_VALUE decimal(28, 9) NULL ,
	SOURCE_PRICE smallint NULL,
	SHIP_DATE datetime NULL,
	DUE_DATE datetime NULL,
	DLV smallint NULL,
	RNG char(1) NULL,
	COST_DOC_CATEGORY char(2) NULL,
	COST_DOC int NULL,
	COST_DOCLINE decimal(28, 9) NULL ,
	COST decimal(28, 9) NULL ,
	COST_UM char(5) NULL,
	COST_CAP decimal(28, 9) NULL ,
	COST1 decimal(28, 9) NULL ,
	COST1_UM char(5) NULL,
	COST2 decimal(28, 9) NULL ,
	COST2_UM char(5) NULL,
	COST3 decimal(28, 9) NULL ,
	COST3_UM char(5) NULL,
	COST_CURENCY char(5) NULL,
	COST_DATE datetime NULL,
	COST_FACTOR decimal(28, 9) NULL ,
	CONV_DOC_CATEGORY varchar(10) NULL,
	CONV_DOC int NULL,
	CONV_LN decimal(28, 9) NULL ,
	C_UNITP decimal(28, 9) NULL ,
	C_UNITP1 decimal(28, 9) NULL ,
	C_UNITP2 decimal(28, 9) NULL ,
	C_UNITP3 decimal(28, 9) NULL ,
	C_SOURCE_PRICE_VALUE decimal(28, 9) NULL ,
	C_COST decimal(28, 9) NULL ,
	C_COST_CAP decimal(28, 9) NULL ,
	C_CURENCY char(5) NULL,
	C_DATE datetime NULL,
	C_FACTOR decimal(28, 9) NULL ,
	REF1 char(20) NULL,
	REF2 char(20) NULL,
	REF3 char(20) NULL,
	LINE_REF varchar(20) NULL,
	MFG char(12) NULL,
	MFG_SUBC char(5) NULL,
	COND char(5) NULL,
	QTY_INSTOCKREV varchar(10) NULL,
	SHIPTO smallint NULL,
	SHIPTO_SUBC char(5) NULL,
	PRIORITY char(5) NULL,
	PRN_PN_MEMO1 char(1) NULL ,
	PRN_PN_MEMO2 char(1) NULL ,
	GL_ACCOUNT char(15) NULL,
	COMPANYNO smallint NULL DEFAULT ((1)),
	DIVISION char(5) NULL,
	DEPART char(5) NULL,
	DISCOUNT decimal(28, 9) NULL ,
	DISCOUNT_TYPE char(1) NULL,
	WGHT_FROM char(5) NULL,
	VOL_FROM char(5) NULL,
	LENGTH_FROM char(5) NULL,
	WGHT_FROM_TTL decimal(28, 9) NULL ,
	VOL_FROM_TTL decimal(28, 9) NULL ,
	LENGTH_FROM_TTL decimal(28, 9) NULL ,
	WGHT_GROSS decimal(28, 9) NULL ,
	VOL_GROSS decimal(28, 9) NULL ,
	LENGTH_GROSS decimal(28, 9) NULL ,
	WGHT_TO_TTL decimal(28, 9) NULL ,
	VOL_TO_TTL decimal(28, 9) NULL ,
	LENGTH_TO_TTL decimal(28, 9) NULL ,
	SMAN1_PERC decimal(28, 9) NULL ,
	SMAN2_PERC decimal(28, 9) NULL ,
	SMAN3_PERC decimal(28, 9) NULL ,
	SMAN4_PERC decimal(28, 9) NULL ,
	SMAN5_PERC decimal(28, 9) NULL ,
	AGENT_COMMISSION decimal(28, 9) NULL ,
	DISC_PERC decimal(28, 9) NULL ,
	MISC1_PERC decimal(28, 9) NULL ,
	MISC2_PERC decimal(28, 9) NULL ,
	MISC3_PERC decimal(28, 9) NULL ,
	MISC4_PERC decimal(28, 9) NULL ,
	MISC5_PERC decimal(28, 9) NULL ,
	MISC6_PERC decimal(28, 9) NULL ,
	SUBT_TAX_A char(1) NULL ,
	SUBT_TAX_B char(1) NULL ,
	SUBT_TAX_C char(1) NULL ,
	TAX_A_CODE char(5) NULL,
	SUBTOTAL decimal(28, 9) NULL ,
	DISC_AMT decimal(28, 9) NULL ,
	SUBTOTALNET decimal(28, 9) NULL ,
	MISC1_AMT decimal(28, 9) NULL ,
	MISC2_AMT decimal(28, 9) NULL ,
	MISC3_AMT decimal(28, 9) NULL ,
	MISC4_AMT decimal(28, 9) NULL ,
	MISC5_AMT decimal(28, 9) NULL ,
	MISC6_AMT decimal(28, 9) NULL ,
	SMAN1_AMT decimal(28, 9) NULL ,
	SMAN2_AMT decimal(28, 9) NULL ,
	SMAN3_AMT decimal(28, 9) NULL ,
	SMAN4_AMT decimal(28, 9) NULL ,
	SMAN5_AMT decimal(28, 9) NULL ,
	TAX_A_PERC decimal(28, 9) NULL ,
	TAX_B_PERC decimal(28, 9) NULL ,
	TAX_C_PERC decimal(28, 9) NULL ,
	TAX_A_AMT decimal(28, 9) NULL ,
	TAX_B_AMT decimal(28, 9) NULL ,
	TAX_C_AMT decimal(28, 9) NULL ,
	DOC_TOTAL decimal(28, 9) NULL ,
	C_SUBTOTAL decimal(28, 9) NULL ,
	C_DISC_AMT decimal(28, 9) NULL ,
	C_SUBTOTALNET decimal(28, 9) NULL ,
	C_MISC1_AMT decimal(28, 9) NULL ,
	C_MISC2_AMT decimal(28, 9) NULL ,
	C_MISC3_AMT decimal(28, 9) NULL ,
	C_MISC4_AMT decimal(28, 9) NULL ,
	C_MISC5_AMT decimal(28, 9) NULL ,
	C_MISC6_AMT decimal(28, 9) NULL ,
	C_SMAN1_AMT decimal(28, 9) NULL ,
	C_SMAN2_AMT decimal(28, 9) NULL ,
	C_SMAN3_AMT decimal(28, 9) NULL ,
	C_SMAN4_AMT decimal(28, 9) NULL ,
	C_SMAN5_AMT decimal(28, 9) NULL ,
	C_TAX_A_AMT decimal(28, 9) NULL ,
	C_TAX_B_AMT decimal(28, 9) NULL ,
	C_TAX_C_AMT decimal(28, 9) NULL ,
	C_TAX_C_PERC decimal(28, 9) NULL ,
	C_AGENT_COMMISSION decimal(28, 9) NULL ,
	C_DOC_TOTAL decimal(28, 9) NULL ,
	CONTRACT_DOC_NO int NULL,
	CUTTING_REQUIRED char(1) NULL ,
	PRICE_BY_WEIGHT char(1) NULL ,
	PIECE_LENGTH decimal(28, 9) NULL ,
	PIECE_WIDTH decimal(28, 9) NULL ,
	WEIGHT_PER_PIECE decimal(28, 9) NULL ,
	PRICE_PER_WEIGHTUM decimal(28, 9) NULL ,
	C_PRICE_PER_WEIGHTUM decimal(28, 9) NULL ,
	TOTAL_WEIGHT decimal(28, 9) NULL ,
	PRICE_PER_PIECE decimal(28, 9) NULL ,
	C_PRICE_PER_PIECE decimal(28, 9) NULL ,
	CHARGE_AMOUNT decimal(28, 9) NULL ,
	C_CHARGE_AMOUNT decimal(28, 9) NULL ,
	CUTTING_DIRECTION char(2) NULL,
	PRICE_CONTRACT_DOC_NO int NULL,
	PRICE_CONTRACT_TYPE int NULL,
	REQUESTED_PARTNUMBER char(30) NULL,
	REQUESTED_PN_SUBP char(5) NULL,
	ROHS_COMPLIANCE char(5) NULL,
	CUSTOM_PRICE decimal(28, 9) NULL ,
	C_CUSTOM_PRICE decimal(28, 9) NULL ,
	CUSTOM_PRICE_UM char(5) NULL,
	EXCLUSIONS char(5) NULL,
	REPLENISHMENT_COST decimal(28, 9) NULL ,
	STOCK_TAX_CALC char(1) NULL ,
	STOCK_TAX_PERC decimal(28, 9) NULL ,
	STOCK_TAX_AMT decimal(28, 9) NULL ,
	IMPORT_EXPORT_LICENSE int NULL,
	IMPORT_EXPORT_REQUIRED char(1) NULL ,
	IMPORT_EXPORT_OVERRIDE char(1) NULL ,
	MIN_QTY decimal(28, 9) NULL ,
	MIN_SELL decimal(28, 9) NULL ,
	MAX_SELL decimal(28, 9) NULL ,
	FACTOR decimal(28, 9) NULL ,
	LAST_PRICE_APPROVED decimal(28, 9) NULL ,
	PRICE_APPROVED_BY char(5) NULL,
	PRICE_APPROVAL_DATE datetime NULL,
	AEROXCHANGE_REPAIRS_PROCESS_REQUEST char(1) NULL,
	EXCLUDE_PART_COST decimal(28, 9) NULL ,
	C_EXCLUDE_PART_COST decimal(28, 9) NULL ,
	EXCLUDE_PART_COST_REASON char(5) NULL,
	PICKED_BY char(4) NULL,
	RECEIVED_BY char(4) NULL,
	RESERVED_BY char(4) NULL,
	RELEASED_BY char(4) NULL,
	PICKED_ON datetime NULL,
	RECEIVED_ON datetime NULL,
	RESERVED_ON datetime NULL,
	RELEASED_ON datetime NULL,
	RECOMM_DOC_CATEGORY char(2) NULL,
	RECOMM_DOC int NULL,
	RECOMM_LN decimal(28, 9) NULL ,
	SOURCE_CATEGORY char(2) NULL,
	SOURCE_DOC_NO int NULL,
	SOURCE_LINE decimal(28, 9) NULL ,
	EARLY_SHIPMENT char(1) NULL ,
	SHIP_CONFIRMED char(1) NULL ,
	HOLD char(1) NULL ,
	HOLD_BY char(4) NULL,
	HOLD_DATE datetime NULL,
	WORK_REQUESTED char(5) NULL,
	BUYER_CODE char(4) NULL,
	AEROX_MSG_PURPOSE_INDICATOR char(1) NULL,
	RECLOCK char(4) NULL,
	ADDED_USR char(4) NULL,
	ADDED_DTE datetime NULL,
	UPDATED_USR char(4) NULL,
	UPDATED_DTE datetime NULL
 );
