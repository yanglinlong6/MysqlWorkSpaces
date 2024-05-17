select *
from sys_area
where area_name like '%北京%';


select *
from sys_area
where id = 110000;

select id, user_id, mail, occupation, provider_name, address_detail, address_code, IDCard, bank_card_no, bank_name, generate_check_sheet from sys_manager where user_id=1365; 

select * from sys_service_item;
select * from sys_order where order_sn = 81289765526120816640;
SELECT * FROM sys_service_item;

select * from sys_order so WHERE so.work_order_no  = 'PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1669585387368091648';
select service_code  from sys_order where id = 146142;
SELECT * from sys_service_item where service_code = 'NES_GLSX_NES010' limit 1;
SELECT * FROM sys_mechanic sm ;
SELECT *FROM sys_user su WHERE id = 578;

SELECT * FROM sys_order so WHERE order_source  IS NULL;
SELECT * FROM sys_order so WHERE so.id = 142803;

SELECT * FROM sys_role_menu srm WHERE role_id = 0 AND menu_id = 33479;
SELECT * FROM sys_menu sm ;






ALTER TABLE sys_order modify `work_order_no` varchar(128) DEFAULT '' COMMENT '其他渠道传入的工单号';
-- ALTER TABLE d_active_screen_url modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';
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
where id = 310101;

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
from sys_user where username = 'xjq';

select * from sys_order where order_sn = '81281006128757989376';
select id ,service_type,service_code ,merchant_id ,mechanic_id  from sys_order where order_sn = '81289840860002177024';
select *  from sys_order where order_sn = '81289840860002177024';
  select st.order_id orderId,st.service_type serviceType,dd.data_value serviceTypeName
        from sys_order_service_type st left join sys_dict_data dd on dd.data_key=st.service_type
        where st.order_id = 146459;

SELECT * FROM   sys_order_service_type; 
       
select *
from sys_order
where work_order_no in ('glsx_1677044744668');

select *
from sys_merchant
where shop_name = '浦东店面-上海市';



select *
from sys_user;

select * from sys_dict_data where dict_type = 'reserve_install_reason';
select * from sys_dict_data where data_key = 'reserve_install_reason_5'  AND data_status = 1;

select * from sys_dict_data where data_value = '客户安装时间变更';



select *
from sys_reserve_install_log where order_id = 145930;

select *,count(1) as num
from sys_user  group by public_openId having num>1;

select *
from sys_user where username like '%testxjq%';

select *
from sys_merchant where shop_name like '%xjq%';

select *
from sys_user where public_openId = 'o-M5g1b-8EprFrgQK0U8krN6gNLo';

select * from sys_manager where user_id = 1365;

select *
from sys_area where area_name = '黑龙江省';


truncate table  sys_device_install_address_info;

insert into sys_device_install_address_info(sqbh, device_info, create_time)
select so.work_order_no,
       concat('[', group_concat(concat('{"sn":"', sod.device_no, '"', ',', '"installLocation":"', sod.install_location, '"}')), ']'),
       sysdate()
from sys_order_device sod
         left join sys_order so on so.id = sod.order_id
where so.order_source = 'PAZL'
group by so.work_order_no;


SELECT
*
from sys_menu WHERE  parent_id = 33377
and menu_status in (0,1)
ORDER BY `sort` ASC;

SELECT * FROM sys_menu sm WHERE name = '批量指派技工'; 
SELECT * FROM sys_menu sm WHERE name = '批量指派服务商'; 
SELECT * FROM sys_menu sm WHERE name = '数据重推'; 

SELECT * FROM sys_role_menu srm WHERE srm.role_id =0 AND menu_id = 33479;
SELECT * FROM 

SELECT
        sm. NAME,
        sm.id,
        sm.parent_id parentId,
        sm.sort
        FROM
        sys_role_menu srm
        LEFT JOIN sys_menu sm ON srm.menu_id = sm.id
        WHERE sm.menu_status = 1
        <if test="_parameter != 0">
            AND srm.role_id = #{id,jdbcType=INTEGER}
        </if>;
       
SELECT * FROM sys_role_menu srm WHERE  menu_id = 33480;  

SELECT * FROM sys_role WHERE id in(26,40);

SELECT *FROM sys_user su WHERE su.username = '13729407587';
-- o-M5g1b-8EprFrgQK0U8krN6gNLo
-- o-M5g1b-8EprFrgQK0U8krN6gNLo
-- o-M5g1b-8EprFrgQK0U8krN6gNLo

SELECT * FROM sys_order so WHERE so.order_sn = '81280354510446190592';
SELECT * FROM sys_order so WHERE so.work_order_no  = 'Zr10281376665327964160';
SELECT * FROM sys_order so WHERE so.vin_no = 'testURP1695806905';
SELECT * FROM sys_order so WHERE so.id = 142804;

ALTER TABLE sys_order ADD COLUMN `install_contacts` varchar(50) DEFAULT NULL COMMENT '安装联系人' AFTER audit_time;
ALTER TABLE sys_order ADD COLUMN `install_contact_number` varchar(20) DEFAULT NULL COMMENT '安装联系人电话号码' AFTER install_contacts;

SELECT * FROM sys_user su WHERE su.username = '18682008974';	

SELECT * FROM sys_user su WHERE su.username = '自动派单-吉林省';
SELECT * FROM sys_resource_matching WHERE merchant_id = 1557;
SELECT * FROM sys_order_file sof ;

DROP TABLE sys_order_vassal;
CREATE TABLE `sys_order_vassal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID,关联sys_order的id字段',
  `zr_accept_info` varchar(1024) DEFAULT NULL COMMENT '供应商收件信息',
  `file_urls` varchar(1024) DEFAULT NULL COMMENT '附件地址集合',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建人',
  `update_by` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='沃尔沃附属表'; 

DROP TABLE sys_sub_order_vassal;
CREATE TABLE `sys_sub_order_vassal` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sub_order_id` int(11) NOT NULL COMMENT '订单ID,关联sys_sub_order的id字段',
  `mortgagee` varchar(64) DEFAULT NULL COMMENT '抵押权人/备案主体',
  `holder_nature` varchar(64) DEFAULT NULL COMMENT '所有人性质',
  `credit_type` tinyint(2) DEFAULT NULL COMMENT '放款类型 0：先抵后放；1：先放后抵',
  `filing_type` varchar(32) DEFAULT NULL COMMENT '备案类型',
  `buyer_name` varchar(32) DEFAULT NULL COMMENT '买方联系人',
  `buyer_mobile` varchar(32) DEFAULT NULL COMMENT '买方联系人电话',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建人',
  `update_by` int(11) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `idx_sub_order_id` (`sub_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='沃尔沃车辆附属表'; 

SELECT *FROM sys_user su WHERE su.username = '小梁用车';
SELECT *FROM sys_user su WHERE su.id = 0;
SELECT * FROM sys_sub_order WHERE id = 148502;
SELECT * FROM sys_service_item ssi;  

SELECT * FROM sys_order WHERE order_sn = '81289126519392952320';	
SELECT * FROM sys_order WHERE order_sn = '10288906312518922240';	
SELECT * FROM sys_order_status sos WHERE order_id = 148565;
SELECT * FROM sys_delivery WHERE order_sn= '60065995141885255680';
SELECT * FROM sys_order WHERE work_order_no = 'sxjd202312150005';
SELECT * FROM sys_order WHERE vin_no  = 'LSVNB4187H1129024';
SELECT * FROM sys_order_material WHERE order_id = 148502;
SELECT * FROM sys_order_file sof WHERE order_id = 148502;
SELECT * FROM sys_order;

ALTER TABLE sys_order ADD COLUMN `volvo_approved_status` tinyint(2) DEFAULT 0 COMMENT '沃尔沃审核通过状态 0 默认 1 通过' AFTER audit_time;
ALTER TABLE sys_order ADD COLUMN `volvo_approved_time` datetime DEFAULT NULL COMMENT '沃尔沃审核通过时间' AFTER volvo_approved_status;

SELECT * FROM sys_order so WHERE so.order_source = 'PAZL' AND active_status = 8;

select distinct d.id, d.order_id, d.order_sn, d.logistics_id, d.express_sn, d.sender_id,
            d.sender, d.sender_phone, d.sender_district, d.sender_address, d.receiver_id,
            d.receiver, d.receiver_phone, d.receiver_district, d.receiver_address, d.`status`,
            d.canceled, d.remark, d.create_time, d.update_time, d.create_by, d.update_by
        from sys_delivery d
        left join sys_user us on us.id = d.sender_id
        left join sys_user ur on ur.id = d.receiver_id
        WHERE  d.status = 2
                and d.canceled = 10
                    or (ur.user_type = 0 and d.status != 1)
        order by d.create_time DESC;
       
SELECT
            so.id   id,
            so.name name,
            so.org_type orgType
        FROM
            sys_organization so
        WHERE
            so.parent_id =0
            AND so.org_status = 1 AND so.name  LIKE '%龙根%';

           SELECT
            so.id   id,
            so.name name,
            so.org_type orgType
        FROM
            sys_organization so
        WHERE
            so.parent_id = 1101
            AND so.org_status = 1;
           
SELECT
            u.id id,
            sm.provider_name name,
            sm.provider_name serviceName,
            u.org_id orgId,
            u.group_id 
        FROM sys_user u
        LEFT JOIN sys_user_org uo ON uo.org_id = u.org_id
        LEFT JOIN sys_organization so ON uo.org_id = so.id
        LEFT JOIN sys_manager sm ON sm.user_id = u.id
        WHERE 
         u.user_status='sys_user_status_normal'
        AND sm.provider_name LIKE concat('%','一号','%')
        AND u.group_id = 1101 
--         u.group_id = 420 
--         AND u.user_type = 1
        GROUP BY id
        LIMIT 50;
            
select * from sys_user su WHERE su.group_id  = 420;  
select * from sys_user su WHERE su.group_id  = 5238;  
select * from sys_organization WHERE name LIKE '%一号%';
select * from sys_organization WHERE id = 5238;
select * from sys_user_org WHERE org_id = 420 AND user_id = 11327;
select su.* from sys_manager sm LEFT JOIN sys_user su ON su.id = sm.user_id  WHERE sm.provider_name  LIKE concat('%','一号','%');

select * from sys_organization so WHERE so.id = 5238;
select * from sys_user_org suo WHERE suo.org_id = 5238; 
select * from sys_user su WHERE su.id = 10465;     
select * from sys_order so WHERE so.order_sn = '10286880296061493248';
select * from sys_delivery WHERE order_id = 148685;

select * from sys_order so WHERE so.order_source = 'pazl';
       
SELECT
	ssi.id,
	ssi.service_code,
	ssi.service_name,
	ssi.TYPE,
	susi.user_id 
FROM
	sys_service_item ssi
LEFT JOIN sys_user_service_items susi ON
	susi.service_code = ssi.service_code
WHERE
	susi.user_id = 1755
	AND ssi.type = 2   
-- 	ssi.type = 2   ;

select * from sys_user_service_items WHERE user_id = 1755;

select * from sys_user su WHERE su.username  = '小梁用车';

select * from sys_user_service_items WHERE user_id = 1414;

SELECT * FROM sys_order_repair;

SELECT * FROM sys_order so WHERE so.id IN (201,202,203,204);

 SELECT id , username, name, org_id, phone_number, user_status, create_by, create_time, update_by, update_time, password, sex, remark, user_type,group_id FROM sys_user su WHERE su.id in (  null, 1675 )

SELECT * FROM sys_order_ocr_sn_result WHERE order_id = 148942;

SELECT * FROM sys_order_file sof ; 

SELECT * FROM sys_device sd WHERE sd.device_no = 8130910018; 

select *
    from sys_device
    where device_status = 1 and device_no =  8130910274
    order by id desc
    limit 1;
   
select * from sys_device where device_status = 1 and device_no = 8130910274 order by id desc limit 1;
select count(*) from sys_secondment_import_device sid left join sys_secondment s on s.secondment_no = sid.secondment_no where s.secondment_status != 40 and sid.device_no = 8130910274;

select count(*)
    from sys_indent_import_device iid
    left join sys_indent si on iid.indent_no = si.indent_no
    where iid.device_no = '8131007361';
SELECT * FROM sys_indent_import_device WHERE device_no = '8131007361';   
SELECT * FROM sys_device WHERE device_no = '8131007361';   
SELECT * FROM sys_indent_import_device; 

SELECT * FROM sys_area sa ; 

SELECT * FROM sys_indent;
SELECT * FROM sys_device WHERE device_no IN (1570717414,1570921461);
SELECT * FROM sys_device WHERE indent_no IN ('8000202405101');
SELECT * FROM sys_indent_logistics;
SELECT * FROM sys_indent_log;
SELECT * FROM sys_device_repertory; 
SELECT * FROM sys_delivery sd ;
SELECT * FROM sys_logistics sl ; 
SELECT * FROM sys_service_mechanic; 
SELECT * FROM sys_area sa ; 
SELECT * FROM sys_user su WHERE id = 576; 
SELECT * FROM sys_user su WHERE id = 688; 
SELECT * FROM sys_manager WHERE user_id  = 576; 
SELECT * FROM sys_user su WHERE user_type = 1; 
SELECT * FROM sys_dict_data WHERE data_key = 'sys_order_service_item_gps_wireless'; 

SELECT * FROM sys_manager WHERE  provider_name = 'aaa123456';
SELECT * FROM sys_service_mechanic WHERE service_id  = 576;
SELECT * FROM sys_mechanic WHERE user_id IN (694,695);
SELECT * FROM sys_user su WHERE id IN (578);

SELECT
        sd.id id,
        sdd.data_value deviceName,
        sd.device_no deviceNo,
        sd.stock_time stockTime,
        sd.remark remark,
        su.name name
        FROM
        sys_device sd
        LEFT JOIN sys_user su ON sd.user_id = su.id
        LEFT JOIN sys_dict_data sdd ON sd.device_type = sdd.data_key
        LEFT JOIN sys_indent si ON sd.indent_no = si.indent_no
        WHERE ( (si.indent_status = 40 AND sd.device_source = 1) OR sd.device_source IN (2,3))
        AND sd.device_status = 1
        AND
        sd.user_id IN (
        select
        ssm.mechanic_id
        from sys_service_mechanic ssm
        where ssm.service_id = 1365
        )
--         <if test="mechanicId != null">
--             and sd.user_id = #{mechanicId}
--         </if>
--         <if test="deviceNo != null and deviceNo != ''">
--             and sd.device_no LIKE concat('%',#{deviceNo},'%')
--         </if>
            and sd.device_type = 'sys_order_service_item_gps'
        ORDER BY sd.stock_time DESC









































        
                
