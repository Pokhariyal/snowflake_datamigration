CREATE TABLE adp_CONTACTS(
	DOC_NO int NOT NULL,
	ACCTNO char(12) not NULL,
	SUBC char(5) not NULL,
	CCODE char(10) NOT NULL,
	CONTACT_TYPE char(5) NULL,
	LOGICAL char(1) ,
	HOME_ADDRESS3 varchar(100) NULL,
	HOME_PHONE_EXT varchar(10) NULL,
	PRIVATE_CELLPHONE varchar(20) NULL,
	PRIVATE_EMAIL varchar(100) NULL,
	RESERVATION_PORTAL_PASSWORD varchar(64) NULL,
	RESERVATION_PORTAL_SALT varchar(64) NULL,
	TWITTER varchar(100) NULL,
	FACEBOOK varchar(50) NULL,
	LINKEDLN varchar(50) NULL,
	SKYPE varchar(50) NULL,
	NATIONALITY varchar(40) NULL,
	ISSUED_COUNTRY varchar(40) NULL,
	PASSPORT_NO varchar(20) NULL,
	PASSPORT_EXPIRATION_DATE datetime NULL,
	PRIORITY_CLASS char(1) NULL,
	DEFAULT_PROJECT_DOC_NO int NULL,
	SITA_CONTACT_CODE varchar(40) NULL,
	TRAVEL_START_DATE datetime NULL,
	TRAVEL_END_DATE datetime NULL,
	CREATION_DATE datetime NULL,
	VALIDATION_DATE datetime NULL,
	REFUSED_REASON varchar(200) NULL,
	REASON_FOR_TAR varchar(200) NULL,
	MR_MS char(5) NULL,
	F_NAME char(25) NULL,
	M_NAME char(25) NULL,
	L_NAME char(25) NULL,
	TITLE varchar(30) NULL,
	DEPARTMENT char(5) NULL,
	TEL_PFIX char(8) NULL,
	TEL1_AREA_CODE char(10) NULL,
	TEL1 varchar(40) NULL,
	CELL_AREA_CODE char(10) NULL,
	CELLPHONE varchar(20) NULL,
	TEL1_EXT varchar(10) NULL,
	FAX1_AREA_CODE char(10) NULL,
	FAX1 varchar(40) NULL,
	EMAIL varchar(100) NULL,
	PAD text NULL,
	BIRTHDATE datetime NULL,
	HOME_ADDRESS1 varchar(100) NULL,
	HOME_ADDRESS2 varchar(100) NULL,
	HOME_CITY varchar(50) NULL,
	HOME_COUNTRY varchar(50) NULL,
	HOME_STATE char(2) NULL,
	HOME_ZIPCODE char(25) NULL,
	HOME_AREA_CODE char(10) NULL,
	HOME_PHONE varchar(50) NULL,
	HOME_FAX_AREA_CODE char(10) NULL,
	HOME_FAX_NO varchar(50) NULL,
	WORK_ADDRESS1 varchar(100) NULL,
	WORK_ADDRESS2 varchar(100) NULL,
	WORK_CITY varchar(50) NULL,
	WORK_COUNTRY varchar(50) NULL,
	WORK_STATE char(2) NULL,
	WORK_ZIPCODE char(25) NULL,
	WORK_AREA_CODE char(10) NULL,
	WORK_PHONE varchar(50) NULL,
	WORK_FAX_AREA_CODE char(10) NULL,
	WORK_FAX_NO varchar(50) NULL,
	ASSISTANT_NAME varchar(100) NULL,
	ASSISTANT_PHONE varchar(50) NULL,
	HOLD char(1) NULL,
	NOTE varchar(30) NULL,
	REMOTE_LOGIN_PASSWORD varchar(20) NULL,
	REMOTE_EMAIL_PASSWORD varchar(200) NULL,
	ECOMMERCE_SALT varchar(64) NULL,
	REMOTE_LOGIN_EMAIL varchar(100) NULL,
	B2B_LOGIN_USER_ID varchar(12) NULL,
	B2B_LOGIN_PASSWORD varchar(20) NULL,
	B2B_LOGIN_BLOCK char(1) NULL,
	COMPANYNO smallint NULL ,
	DIVISION char(5) NULL,
	DEPART char(5) NULL,
	RECLOCK char(4) NULL,
	ADDED_USR char(4) NULL,
	ADDED_DTE datetime NULL,
	UPDATED_USR char(4) NULL,
	UPDATED_DTE datetime NULL,
constraint 	CONTACT_PK PRIMARY KEY DOC_NO);
