select *
from sys_area
where area_name like '%北京%';


select *
from sys_area
where id = 110000;

select *
from sys_order
where id = 145822;

select *
from sys_user
where username = 'maisq';

select *
from sys_organization
where id = 73;

SELECT DISTINCT u.id,
                u.username,
                u.password,
                u.org_id          orgId,
                sm.shop_name      shopName,
                u.user_status     userStatus,
                sm.service_type   serviceType,
                u.NAME,
                u.phone_number    phoneNumber,
                sm.district       district,
                sm.address        address,
                ssi.service_code  serviceKey,
                ssi.service_name  serviceItems,
                susi.match_status matchStatus,
                u.group_id        groupId,
                su.name           serviceName,
                su.phone_number   mechanicPhoneNumber,
                su.id             userId,
                su.user_type
FROM sys_user u
         LEFT JOIN sys_organization so ON u.org_id = so.id
         LEFT JOIN sys_merchant sm ON sm.user_id = u.id
         LEFT JOIN sys_user_service_items susi ON sm.user_id = susi.user_id
         LEFT JOIN sys_service_item ssi ON susi.service_code = ssi.service_code
         LEFT JOIN sys_resource_matching srm ON srm.merchant_id = u.id AND srm.service_key = ssi.service_code
         LEFT JOIN sys_user su ON srm.user_id = su.id
WHERE u.user_type = 2
  and u.id = 839;

select *
from sys_order
where id = 145851;

select so.work_order_no, so.vin_no, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_merchant
where user_id = 1532;

select *
from sys_area
where area_name like '%北京%';

select *
from sys_area
where parent_id = 110000;

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

select *
from sys_role;

select *
from sys_area
where area_name like '%道里区%';

select *
from sys_area
where id = 110100;

select *
from sys_order
where work_order_no = 'PAGLSX202301090001';
select *
from sys_order
where work_order_no in ('PAGLSX202301090001', 'PAGLSX202301090002');

select *
from sys_merchant
where shop_name = '浦东店面-上海市';

select *
from sys_area
where id = '220184';

select *
from sys_user;
