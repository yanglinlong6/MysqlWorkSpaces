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
where provider_name = '南京臻浩-广东';

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
where order_sn = '81282451134225903616';

select *
from sys_order_file
where order_id = 309886;

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

SELECT CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
FROM sys_area sa
         LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
         LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id
WHERE sa.id = 231086;


select *
from sys_user
where username = '天津鸿盛';

select *
from sys_manager
where provider_name = '天津鸿盛';

select *
from sys_merchant;

select *
from sys_user
where id = 9587;

select *
from sys_user_role
where user_id = 9587;

select *
from sys_role
where id = 1;

select sm.*
from sys_role_menu srm
         left join sys_menu sm on sm.id = srm.menu_id
where srm.role_id = 1;

select *
from sys_order
where vin_no = 'JN8BY2NY6K9180471';
select *
from sys_order
where id = 311565;

select *
from sys_order_device
where order_id = 311565;
select *
from sys_order_device
where device_no = 1620804693;
select *
from sys_order_device
where device_no = 16208046931620;
update sys_order_device
set device_no =1620804693
where id = 268346;

select *
from sys_order_audit_status
where order_id = 311565;
select *
from sys_order_status
where order_id = 311565;

select *
from sys_user
where id = 8903;

select *
from sys_order_file
where id = 915929;

select *
from sys_order_status
where order_id = 299873;

select *
from sys_order_audit_status
where order_id = 299873;

select *
from sys_user
where id in (9736, 7322);

select *
from sys_user
where id = 6392;

select *
from sys_mechanic
where user_id = 6392;

select *
from sys_user_org;

select *
from sys_organization
where id = 3809;

select *
from sys_organization
where id = 557;

select *
from sys_user;

SELECT DISTINCT so.id   id,
                so.NAME NAME,
                so.org_type,
                0       user_id
FROM sys_organization so
WHERE so.parent_id = 0
  AND so.org_status = 1;


select sm.*
from sys_mechanic sm
         left join sys_user su on su.id = sm.user_id
where su.name in ('包头市易通加乘咨询','兰州赛弛丰田范磊');


update sys_mechanic
set mechanic_status = 'sys_user_status_pass_check'
WHERE id in (1782,3867
    );


select *
from sys_user
where username = '银川天银张慧';

select *
from sys_user
where username = 'caixy';

select *
from sys_user
where name = '杨振亮';

select *
from sys_user_org
where user_id = 776
  and org_id = 1187;

SELECT u.id,
       u.org_id                                   orgId,
       so.name                                    orgName,
       u.user_status                              userStatus,
       u.NAME,
       u.password                                 password,
       u.phone_number                             phoneNumber,
       sm.district                                district,
       sm.address                                 address,
       u.create_time                              createTime,
       GROUP_CONCAT(sdd.data_value SEPARATOR '/') serviceItems,
       GROUP_CONCAT(sdd.data_key)                 serviceKey,
       sm.service_type                            serviceType,
       sm.IDCard,
       sm.mechanic_status                         mechanicStatus,
       sm.work_time_start                         workTimeStart,
       sm.work_time_end                           workTimeEnd,
       sm.dispatch_type                           dispatchType,
       sm.send_type                               sendType,
       sm.bank_card_no         as                 bankCardNo,
       sm.real_name            as                 realName,
       sm.bank_province_code   as                 bankProvinceCode,
       sm.bank_city_code       as                 bankCityCode,
       sm.bank_district_code   as                 bankDistrictCode,
       sm.bank_province        as                 bankProvince,
       sm.bank_district        as                 bankDistrict,
       sm.bank_city            as                 bankCity,
       sm.bank_name            as                 bankName,
       sm.generate_check_sheet as                 generateCheckSheet,
       ssm.service_id          as                 serviceId,
       sp.provider_name        as                 serviceName
FROM sys_user_org suo
         LEFT JOIN sys_organization so ON suo.org_id = so.id
         LEFT JOIN sys_user u ON u.org_id = so.id
         LEFT JOIN sys_mechanic sm ON sm.user_id = u.id
         LEFT JOIN sys_user_services sus ON sm.user_id = sus.user_id
         LEFT JOIN sys_dict_data sdd ON sus.service_key = sdd.data_key
         LEFT JOIN sys_service_mechanic ssm ON ssm.mechanic_id = u.id
         LEFT JOIN sys_user su ON su.id = ssm.service_id
         LEFT JOIN sys_manager sp ON sp.user_id = ssm.service_id
WHERE suo.user_id = 1388
  AND u.user_type = 3;

select *
from sys_order
where order_sn = '81283829481958928384';

select *
from sys_order
where order_sn = '81283825474938990592';

update sys_order
set active_status = 9
where order_sn in (
                   '81283829481958928384',
                   '81283825474938990592'
    );


select *
from sys_order
where vin_no = 'LSVCH6A4XDN016125';

select vin_no
from sys_order
where work_order_no = 1105836711;

select *
from sys_order
where order_sn = '81287426900063809536';

select *
from sys_order_file
where order_id = 305193;

select so.work_order_no, so.vin_no, so.vin_hash, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_merchant
where shop_name in ('汇通信诚租赁有限公司甘肃分公司', '内蒙古朝晟汽车销售服务有限公司', '苏州翼达飞汽车服务有限公司');

select *
from sys_merchant
where user_id = 2181;


select *
from sys_resource_matching
where merchant_id in (9337, 3449, 1835);
select *
from sys_resource_matching
where merchant_id in (2181);

delete
from sys_resource_matching
where id in (316,
             456,
             560,
             561,
             703
    );


select *
from sys_user_service_items
where user_id in (9337, 3449, 1835)
  and match_status = 'sys_user_status_bound';

update sys_user_service_items
set match_status = 'sys_user_status_unbound_service'
where id in (78458, 77282, 77650);

select *
from sys_user_service_items
where id in (78458, 77282, 77650);

select *
from sys_user
where password = '67973faf7760b8665de96d107e6647e5';


select *
from sys_service_item
where service_code in (003, 004);

select *
from sys_order;

select *
from sys_role;

select *
from sys_user
where id = 9143;

select *
from sys_service_item
where is_audit = 1;

select so.work_order_no, so.vin_no, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_area
where parent_id = 310100

select *
from sys_order
where work_order_no = 'PAGL-3207416-2023ZLTJ100505721-ZL-01-0112151146365';

select *
from sys_order_status
where order_id = 313363;

select *
from sys_order_audit_status
where order_id = 313363;

update sys_order
set audit_status = 3
where id = 313363;
INSERT INTO glsx_car_service.sys_order_audit_status (order_id, audit_status, reason, remark, create_time, create_by)
VALUES (313363, 3, '', '', sysdate(), 9887);
