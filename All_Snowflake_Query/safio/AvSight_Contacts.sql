create table AvSight_Contacts as 
(
select 
adp_contacts.AcctNo as Account,adp_contacts.email as Email, adp_contacts.fax1 as Fax, adp_contacts.f_name as Firstname,
adp_contacts.l_name as Lastname, adp_contacts.work_address1 as MailingStreet,adp_contacts.tel1 as MobilePhone,
adp_contacts.work_city as Other_City,adp_contacts.work_country as Other_Country,adp_contacts.work_zipcode as Other_Postal_Code,
adp_contacts.work_phone as Phone,adp_contacts.work_state as Other_State,adp_contacts.title as Title,adp_contacts.doc_no as External_Reference_ID

from adp_contacts
)
--###########################
create table avsight_contacts (ACCOUNT VARCHAR(12),EMAIL VARCHAR(100),FAX VARCHAR(40),FIRSTNAME VARCHAR(25),
                               LASTNAME VARCHAR(25),MAILINGSTREET VARCHAR(100),MOBILEPHONE
VARCHAR(40),OTHER_CITY
VARCHAR(50),OTHER_COUNTRY
VARCHAR(50),OTHER_POSTAL_CODE
VARCHAR(25),PHONE
VARCHAR(50),OTHER_STATE
VARCHAR(2),TITLE
VARCHAR(30),EXTERNAL_REFERENCE_ID
NUMBER(38,0))

COPY INTO @adp/adp/AVSIGHT_CONTACTS/avsight_contacts.csv from avsight_contacts
file_format = (type ='csv' compression=none field_optionally_enclosed_by='"' compression=none NULL_IF=())  header =true HEADER = TRUE single = true max_file_size = 4900000000;
