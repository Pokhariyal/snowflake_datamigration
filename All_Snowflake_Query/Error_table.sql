create or replace table error_shipto as select * from table(validate(adp_shipto, job_id=>'**********'));
create or replace table error_po_line as select * from table(validate(adp_po_line, job_id=>'**********'));
create or replace table error_po_hdr as select * from table(validate(adp_po_hdr, job_id=>'**********'));
create or replace table error_so_line as select * from table(validate(adp_so_line, job_id=>'**********'));
create or replace table error_so_hdr as select * from table(validate(adp_so_hdr, job_id=>'**********'));
create or replace table error_rfq_line as select * from table(validate(adp_rfq_line, job_id=>'**********'));
create or replace table error_rfq_hdr as select * from table(validate(adp_rfq_hdr, job_id=>'**********'));
create or replace table error_quote_line as select * from table(validate(adp_quote_line, job_id=>'**********'));
create or replace table error_quote_hdr as select * from table(validate(adp_quote_hdr, job_id=>'**********'));