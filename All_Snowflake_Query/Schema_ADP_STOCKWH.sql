CREATE OR REPLACE TABLE ADP_STOCKWH(
	PARTNUMBER char(30) NOT NULL,
	SUBP char(5) NOT NULL,
	LOGNO int NOT NULL,
	DOS_LOGNO int NULL,
	DOS_FROM_LOGNO int NULL,
	DOS_FROM_TO char(1) NULL,
	DOS_CONVERTED varchar(30) NULL,
	PART_SSN int NULL,
	SERIAL_NO varchar(30) NULL,
	WHCODE char(4) NULL,
	LOCATION char(12) NULL,
	LOT_WHCODE char(4) NULL,
	CUSTOMS_WHCODE char(4) NULL,
	PART_LOCATION varchar(5) NULL,
	MFG char(12) NULL,
	MFG_SUBC char(5) ,
	MFG_DATE datetime NULL,
	WARRANTY datetime NULL,
	SHELF_LIFE int NULL,
	GOOD_TILL datetime NULL,
	LAST_CUSTOM_TC_1 datetime NULL,
	SOURCE char(12) NULL,
	SUBS char(3) NULL,
	SOURCEDT datetime NULL,
	REPAIREDBY char(12) NULL,
	SUBR char(3) NULL,
	REPAIREDT datetime NULL,
	ORIGDOC_CATEGORY char(2) NULL,
	ORIGDOC_NO int NULL,
	ORIGDOC_LINE decimal(28, 9) ,
	RCVDOC_CATEGORY char(2) NULL,
	RCVDOC_NO int NULL,
	RCVDOC_LINE decimal(28, 9) ,
	COUNT_DATE datetime NULL,
	COUNT_QTY decimal(28, 9) ,
	RESERVED decimal(28, 9) ,
	TRANSPORT decimal(28, 9) ,
	INHOUSE_QA decimal(28, 9) ,
	BOOKED decimal(28, 9) ,
	CONVERT_FROM char(30) NULL,
	CONVERT_LOGNO int NULL,
	REF1 char(20) NULL,
	REF2 char(20) NULL,
	REF3 char(20) NULL,
	REF4 char(20) NULL,
	REF5 char(20) NULL,
	REF6 char(20) NULL,
	REF7 char(20) NULL,
	REF8 char(20) NULL,
	REF9 char(20) NULL,
	REF10 char(20) NULL,
	REF11 char(20) NULL,
	REF12 char(20) NULL,
	REF13 datetime NULL,
	REF14 datetime NULL,
	REF15 datetime NULL,
	RCV_DATE datetime NULL,
	QTY decimal(28, 9) ,
	COND char(5) NULL,
	QTY_INSTOCKUM char(5) NULL,
	QTY_INSTOCKREV varchar(10) NULL,
	CRNCY_CODE char(5) NULL,
	CURENCY_CONV char(5) NULL,
	CRNCY_FACTOR decimal(28, 9) ,
	CRNCY_DATE datetime NULL,
	FIRSTCOST decimal(28, 9) ,
	FIRSTCOSTUM char(5) NULL,
	FIRSTCOSTTYPE char(2) NULL,
	MINIMUM_UNITP decimal(28, 9) ,
	MINIMUM_UNITP_CRNCY char(5) NULL,
	COST decimal(28, 9) ,
	COSTUM char(5) NULL,
	COST_CALCULATED decimal(28, 9) ,
	FORMULA char(5) NULL,
	GL_ACCOUNT char(15) NULL,
	COMPANYNO smallint ,
	DIVISION char(5) NULL,
	DEPART char(5) NULL,
	LINE_TYPE char(2) NULL,
	UNITP decimal(28, 9) ,
	UNITP1 decimal(28, 9) ,
	UNITP2 decimal(28, 9) ,
	UNITP3 decimal(28, 9) ,
	COST_CAP decimal(28, 9) ,
	DIFF_COST decimal(28, 9) ,
	UNITP1_ADD char(1) ,
	UNITP2_ADD char(1) ,
	UNITP3_ADD char(1) ,
	COST_CAP_ADD char(1) ,
	SUBTOTAL decimal(28, 9) ,
	DISC_AMT decimal(28, 9) ,
	SUBTOTALNET decimal(28, 9) ,
	MISC1_AMT decimal(28, 9) ,
	MISC2_AMT decimal(28, 9) ,
	MISC3_AMT decimal(28, 9) ,
	MISC4_AMT decimal(28, 9) ,
	MISC5_AMT decimal(28, 9) ,
	MISC6_AMT decimal(28, 9) ,
	MISC1_ADD char(1) ,
	MISC2_ADD char(1) ,
	MISC3_ADD char(1) ,
	MISC4_ADD char(1) ,
	MISC5_ADD char(1) ,
	MISC6_ADD char(1) ,
	CERTIFICATE_CODE char(5) NULL,
	CERTIFICATE_NO char(40) NULL,
	MNT_CERTIFICATE_CODE char(5) NULL,
	MNT_CERTIFICATE_NO char(40) NULL,
	QUALITY_CODE char(5) NULL,
	MFG_CERTIFICATE_CODE char(5) NULL,
	ROHS_COMPLIANCE char(5) NULL,
	ORIG_PARTNUMBER char(30) NULL,
	ORIG_SUBP char(5) NULL,
	ORIG_LOGNO int NULL,
	COUNTRY varchar(40) NULL,
	WORK_PERFORMED char(5) NULL,
	NO_REPAIR_WAS_DONE char(1) ,
	CURE_DATE datetime NULL,
	DOCNUMBER char(25) NULL,
	REV_NO char(10) NULL,
	DISC_CODE char(5) NULL,
	GDP_FACTOR decimal(28, 9) ,
	GDP_EC char(30) NULL,
	GDP_FROM_DATE datetime NULL,
	SUPPLIER_ACCOUNTNO char(12) NULL,
	SUPPLIER_SUBC char(5) NULL,
	INVENTORY_IMPORT_HIST_DOC_NO int NULL,
	STOCK_MOVEMENT_CODE char(15) NULL,
	STOCK_MOVEMENT_DATE datetime NULL,
	RECLOCK char(4) NULL,
	ADDED_USR char(4) NULL,
	ADDED_DTE datetime NULL,
	UPDATED_USR char(4) NULL,
	UPDATED_DTE datetime NULL,
CONSTRAINT STOCKWH_PK PRIMARY KEY (PARTNUMBER,SUBP,LOGNO)
);
