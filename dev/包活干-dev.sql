select *
from sys_order
where order_sn = '81283946137295712256';

select *
from sys_order
where work_order_no = 'PA1482200741698473984';

select *
from sys_order
where vin_no = 'LSVCH6A4XDN016125';

select *
from sys_user;

select so.work_order_no, so.vin_no, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_order
where order_sn = '81280258530724745216';

select *
from sys_order
where id = 145851;

select *
from sys_area sa1
         left join sys_area sa2 on sa2.parent_id = sa1.area_code
         left join sys_area sa3 on sa3.parent_id = sa2.area_code
where sa1.area_name like '%北京%';

select *
from sys_area sa1
         left join sys_area sa2 on sa2.parent_id = sa1.area_code
         left join sys_area sa3 on sa3.parent_id = sa2.area_code
where sa1.area_name like '%天津%';
select *
from sys_area sa1
         left join sys_area sa2 on sa2.parent_id = sa1.area_code
         left join sys_area sa3 on sa3.parent_id = sa2.area_code
where sa1.area_name like '%重庆%';
select *
from sys_area sa1
         left join sys_area sa2 on sa2.parent_id = sa1.area_code
         left join sys_area sa3 on sa3.parent_id = sa2.area_code
where sa1.area_name like '%上海%';
select *
from sys_area sa1
         left join sys_area sa2 on sa2.parent_id = sa1.area_code
         left join sys_area sa3 on sa3.parent_id = sa2.area_code
where sa1.area_name like '%香港%';

insert into sys_area (id, area_name, area_code, parent_id, init_date) value (110100, '北京城区', 110100, 110000, sysdate());
update sys_area
set parent_id =110100
where parent_id = 110000;

select *
from sys_area
where area_name = '北京城区';

select *
from sys_area
where parent_id = 110100;

insert into sys_area (id, area_name, area_code, parent_id, init_date) value (120100, '天津城区', 120100, 120000, sysdate());

select *
from sys_area
where parent_id = 120000;

update sys_area
set parent_id = 120100
where parent_id = 120000;

insert into sys_area (id, area_name, area_code, parent_id, init_date) value (310100, '上海城区', 310100, 310000, sysdate());

update sys_area
set parent_id =310100
where parent_id = 310000;

select *
from sys_area
where area_name = '上海城区';

insert into sys_area (id, area_name, area_code, parent_id, init_date) value (500100, '重庆城区', 500100, 500000, sysdate());
insert into sys_area (id, area_name, area_code, parent_id, init_date) value (500200, '重庆郊县', 500200, 500000, sysdate());

update sys_area
set parent_id = 500100
where parent_id = 500000
  and area_name like '%区';
update sys_area
set parent_id = 500200
where parent_id = 500000
  and area_name like '%县';

select audit_status
from sys_order
where order_sn = '81280241227102351360';

select *
from sys_service_item
where is_audit = 1;
