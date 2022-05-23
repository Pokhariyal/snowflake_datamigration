create table AvSight_Contacts as 
(
select 
adp_contacts.AcctNo as Account,adp_contacts.email as Email, adp_contacts.fax1 as Fax, adp_contacts.f_name as Firstname,
adp_contacts.l_name as Lastname, adp_contacts.work_address1 as MailingStreet,adp_contacts.tel1 as MobilePhone,
adp_contacts.work_city as Other_City,adp_contacts.work_country as Other_Country,adp_contacts.work_zipcode as Other_Postal_Code,
adp_contacts.work_phone as Phone,adp_contacts.work_state as Other_State,adp_contacts.title as Title,adp_contacts.doc_no as External_Reference_ID

from adp_contacts
)
