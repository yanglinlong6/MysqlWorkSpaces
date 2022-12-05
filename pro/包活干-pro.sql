select id,
       user_id,
       mail,
       occupation,
       provider_name,
       address_detail,
       address_code,
       IDCard,
       bank_card_no,
       bank_name,
       generate_check_sheet
from sys_manager
where user_id = 4569;

select *
from sys_manager
where provider_name = '南京臻浩';

select merchant_id
from sys_order
where id = 297011;

select *
from sys_manager
where user_id = 9588;

select *
from sys_manager
where user_id = 4569;

select *
from sys_order
where order_sn = '81286557781739233280';

select *
from sys_order_status
where order_id = 297555;

select *
from sys_service_item
where service_code = 'PA001'
limit 1;


select *
from sys_order_audit_status
where order_id = 297555;

select *
from sys_order
where vin_no = 'LDP31B96XNG132902';

