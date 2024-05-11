select *
from sys_order
where order_sn = '81283946137295712256';

SELECT *FROM sys_order so WHERE order_sn  = '81285474531082498048';

select *
from sys_order
where work_order_no = 'PA1482200741698473984';

SELECT * FROM  sys_order so WHERE so.id = 142803; 
select *
from sys_order
where vin_no = 'PA20*********4018';

select * from sys_order so WHERE id = 142803;
ALTER TABLE sys_order modify `work_order_no` varchar(128) DEFAULT '' COMMENT '其他渠道传入的工单号';

select *
from sys_user;

select so.work_order_no,so.work_order_number  ,so.vin_no, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_order WHERE work_order_no = 'AP16859534760160';

select * from sys_order WHERE mechanic_id IS NOT NULL  ORDER BY create_time desc;

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

select *
from sys_order
where order_sn = '81282221029082066944';

select *
from sys_service_item
where is_audit = 1;

select reserve_install_time,install_device_type,work_order_no
from sys_order
where id = '141378';

select *
from sys_order where work_order_no = '81281006128757989376';

select * from sys_dict_data where dict_type = 'reserve_install_reason';
select * from sys_dict_data where data_key = 'reserve_install_reason_5'  AND data_status = 1;

select *
from sys_dict_type where dict_type = 'reserve_install_reason';

select *
from sys_reserve_install_log;

select *
from sys_user where username = 'wu_test';

select *
from sys_user_service_fee;

select *
from sys_order where order_sn = '81281006128757989376';


CREATE TABLE `sys_device_install_address_info`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sqbh`        varchar(50)   DEFAULT NULL COMMENT '工单申请编号',
    `device_info` varchar(1024) DEFAULT NULL COMMENT '设备组合信息',
    `create_time` datetime      DEFAULT null comment '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT ='设备组合数据表';

select *
from sys_device_install_address_info;

truncate table sys_device_install_address_info;

insert into sys_device_install_address_info(sqbh, device_info, create_time)
select so.work_order_no,
       concat('[', group_concat(concat('{"sn":"', sod.device_no, '"', ',', '"installLocation":"', sod.install_location, '"}')), ']'),
       sysdate()
from sys_order_device sod
         left join sys_order so on so.id = sod.order_id
where so.order_source = 'PAZL'
group by so.work_order_no;

SELECT * FROM  sys_manager sm WHERE user_id = 915;
SELECT * FROM sys_merchant sm2   WHERE  user_id = 915;
SELECT * FROM sys_mechanic sm2   WHERE  user_id = 915;

SELECT * FROM  sys_user su WHERE su.username = 'test';

    select
	m.id, m.`name`, m.parent_id, m.sort, m.right_des,
	m.request_add, m.menu_type, m.menu_icon, m.is_show,
	m.label, m.menu_status, m.menu_icon
	from sys_menu m
	LEFT JOIN sys_role_menu rm on m.id = rm.menu_id
	LEFT JOIN sys_role r on rm.role_id = r.id
	LEFT JOIN sys_user_role ur on r.id = ur.role_id
	LEFT JOIN sys_user u on ur.user_id = u.id
    WHERE u.id = 611
	and m.is_show = 1 
	and m.menu_status = 1
	and m.parent_id = 33377
	order by m.sort asc ,m.id DESC;

	SELECT
	*
	from sys_menu WHERE  parent_id = 33377
	and menu_status in (0,1)
	ORDER BY `sort` ASC;

SELECT * FROM sys_menu sm WHERE name = '批量指派技工'; 
SELECT * FROM sys_menu sm WHERE name = '批量指派服务商'; 
SELECT * FROM sys_order_service_type WHERE order_id = 146451;
SELECT * FROM sys_order_file WHERE order_id = 146451;
SELECT * FROM sys_order_label WHERE order_id = 146451;
SELECT * FROM sys_order_bidding_records WHERE order_id = 146451;

SELECT * FROM sys_order so WHERE so.order_sn = '81284317125757440000';
SELECT * FROM sys_order so WHERE so.order_sn = '81280758739887386624';
SELECT * FROM sys_order so WHERE so.work_order_no = 'PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1720270939788283904';
SELECT * FROM sys_order so WHERE so.order_sn = '81280796934092025856';
ALTER TABLE sys_order ADD COLUMN `install_contacts` varchar(50) DEFAULT NULL COMMENT '安装联系人' AFTER audit_time;
ALTER TABLE sys_order ADD COLUMN `install_contact_number` varchar(20) DEFAULT NULL COMMENT '安装联系人电话号码' AFTER install_contacts;

ALTER TABLE sys_order  DROP COLUMN  `install_contact_number`;

SELECT * FROM sys_user su WHERE su.id = '1410';

SELECT * FROM sys_order_material som ;
SELECT * FROM sys_sub_order sso ; 

SELECT service_code  FROM sys_order;
SELECT * FROM sys_order WHERE order_sn = '10288910153897406464';
SELECT * FROM sys_order_material som ;
SELECT * FROM sys_sub_order sso;
SELECT * FROM sys_order_status sos WHERE order_id = 143379;
SELECT * FROM sys_delivery sd ;

SELECT * FROM sys_service_item ssi;  
SELECT * FROM sys_user_service_items;
SELECT * FROM sys_delivery WHERE order_id = 143349;
SELECT * FROM sys_order_file sof ;

SELECT * FROM sys_order_vassal;
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


SELECT * FROM sys_order so WHERE order_source = 'PAZL' ;
SELECT * FROM sys_order so WHERE order_sn  = '60067175107008196608' ;
SELECT * FROM sys_user su WHERE username = '电饭锅所发生的';
SELECT * FROM sys_user su WHERE name = '流传奇';
SELECT * FROM sys_order_file sof ;
SELECT * FROM sys_area;

ALTER TABLE sys_order ADD COLUMN `volvo_approved_status` tinyint(2) DEFAULT 0 COMMENT '沃尔沃审核通过状态 0 默认 1 通过' AFTER audit_time;
ALTER TABLE sys_order ADD COLUMN `volvo_approved_time` datetime DEFAULT NULL COMMENT '沃尔沃审核通过时间' AFTER volvo_approved_status;

SELECT * FROM sys_order so  WHERE id = 143365;
select * from sys_order so WHERE so.order_sn = '10288910153897406464';

SELECT
		DISTINCT
		u.id,
		u.username,
		u.password,
		u.org_id orgId,
		sm.shop_name shopName,
		user_status userStatus,
		sm.service_type serviceType,
		u. NAME,
		phone_number phoneNumber,
		sm.district district,
		sm.address address,
		susi.match_status as matchStatus,
		GROUP_CONCAT(DISTINCT ssi.service_name SEPARATOR '/') serviceItems,
		GROUP_CONCAT(DISTINCT ssi.service_code ) serviceKey,
		u.group_id groupId,
		ifnull(suot.create_order_type,0) as createOrderType
FROM
		sys_user_org suo
		LEFT JOIN sys_organization so ON suo.org_id = so.id
		LEFT JOIN sys_user u ON u.org_id = so.id
		LEFT JOIN sys_merchant sm ON sm.user_id = u.id
		LEFT JOIN sys_user_service_items susi ON sm.user_id = susi.user_id
		LEFT JOIN sys_service_item ssi ON susi.service_code = ssi.service_code
		LEFT JOIN sys_user_order_type suot ON u.id = suot.user_id
		WHERE suo.user_id = 1413
		AND u.user_type = 2
		and u.id = 1413
GROUP BY u.id
ORDER BY u.id DESC;

sys_order_service_item_gps,sys_order_service_item_gps_wireless,sys_order_service_item_wireline_dasouche,sys_order_service_item_wireline_msyz,sys_order_service_item_car_dvr,sys_order_service_item_wireless_dasouche,sys_order_service_item_wireless_msyz,sys_order_service_item_car_mirrors,sys_order_service_item_tiny_dasouche,sys_order_service_item_tiny_msyz,sys_order_service_item_control_screen,sys_order_service_item_other_dasouche,sys_order_service_item_other_msyz,sys_order_service_item_cars,sys_order_service_item_gps_GT700F

SELECT * FROM sys_user_service_items WHERE user_id  =  1413;

SELECT * FROM sys_service_item WHERE service_code = 'sys_order_service_item_gps_GT700F';

select * from sys_service_item;

SELECT * FROM sys_delivery sd ;
SELECT * FROM sys_delivery_file sdf ;

select * from sys_vin_check_ocr;
-- INSERT INTO sys_vin_check_ocr (order_id,file_id,db_vin,ocr_vin,create_time)
select sof.*,so.vin_no from sys_order_file sof LEFT JOIN sys_order so ON so.id = sof.order_id 
WHERE so.order_source = 'pazl' AND sof.file_name = '三码合一';

SELECT sysdate();

SELECT * FROM sys_vin_check_ocr; 
truncate TABLE sys_vin_check_ocr; 

INSERT
	INTO
	sys_vin_check_ocr (
		order_id,
		file_id,
		db_vin,
		ocr_vin,
		create_time
	)
VALUES (
	'273654',
	'767494',
	'LFV3A23C4D3025959',
	'LFV3A23C4D3025959',
	sysdate()
);

DROP TABLE sys_vin_check_ocr;
SHOW CREATE TABLE sys_vin_check_ocr;

CREATE TABLE `sys_vin_check_ocr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` int(11) DEFAULT NULL COMMENT '工单id',
  `file_id` int(11) DEFAULT NULL COMMENT '照片Id',
  `db_vin` varchar(100) DEFAULT NULL COMMENT '数据库车架号',
  `ocr_vin` varchar(100) DEFAULT NULL COMMENT 'OCR识别车架号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM sys_order_file;

INSERT INTO sys_order_file (order_id,sub_order_id,file_name,file_path,file_type,sort,create_by,create_time) VALUES
	 (142778,NULL,'无线设备安装位置照','https://bhg.didihu.com.cn/group1/M00/07/6C/wKgFHV6L7oeAY9IlAAEdamQpFdc939.jpg',12,1,NULL,NULL);

select * from sys_order_file_ocr sofo ORDER BY ;
SELECT * FROM sys_vin_check_ocr ORDER BY id DESC;
truncate TABLE  sys_vin_check_ocr;

SELECT count(1) FROM sys_vin_check_ocr;
SELECT count(1) FROM sys_vin_check_ocr WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr WHERE ocr_vin IS NOT NULL;

SELECT count(1) FROM sys_vin_check_ocr_01;
SELECT count(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin IS NOT NULL;

SELECT b.* FROM sys_vin_check_ocr_01 a LEFT JOIN sys_order_file_ocr b ON b.id  = a.file_id 
WHERE a.ocr_vin IS NULL ;

CREATE TABLE sys_vin_check_ocr_02 LIKE sys_vin_check_ocr; 
select * from sys_vin_check_ocr_02 WHERE db_vin LIKE  '%WDDWI4CB3JF760410%' ;
truncate TABLE  sys_vin_check_ocr_02;

CREATE TABLE sys_vin_check_ocr_03 LIKE sys_vin_check_ocr; 
select * from sys_vin_check_ocr_03 WHERE db_vin LIKE  '%WDDWI4CB3JF760410%' ;
truncate TABLE  sys_vin_check_ocr_03;

CREATE TABLE sys_vin_check_ocr_04 LIKE sys_vin_check_ocr; 
select * from sys_vin_check_ocr_04;

-- 拷贝表
-- DROP TABLE sys_order_file_ocr_01;
CREATE TABLE sys_order_file_ocr_01 LIKE sys_order_file_ocr;
INSERT INTO sys_order_file_ocr_01 SELECT * FROM sys_order_file_ocr;
select count(1) from sys_order_file_ocr;
select count(1) from sys_order_file_ocr_01;

#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr WHERE ocr_vin != db_vin OR ocr_vin IS NULL)
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配失败率


#匹配成功率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr WHERE ocr_vin = db_vin AND ocr_vin IS NOT NULL)
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配成功率


#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin != db_vin OR ocr_vin IS NULL AND db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配失败率


#匹配成功率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin = db_vin AND ocr_vin IS NOT NULL OR db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配成功率


#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_04 WHERE (ocr_vin != db_vin OR ocr_vin IS NULL) AND db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配失败率


#匹配成功率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_04 WHERE ocr_vin = db_vin AND ocr_vin IS NOT NULL OR db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_01)*100, 2) AS 匹配成功率


SELECT count(1) FROM sys_vin_check_ocr_01;
SELECT count(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr_01 WHERE ocr_vin IS NOT NULL;

CREATE TABLE sys_vin_check_ocr_04 LIKE sys_order_file_ocr;
INSERT INTO sys_vin_check_ocr_04 SELECT * FROM sys_order_file_ocr;
SELECT count(1) FROM sys_vin_check_ocr_04;
SELECT count(1) FROM sys_vin_check_ocr_04 WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr_04 WHERE ocr_vin IS NOT NULL;

CREATE TABLE sys_vin_check_ocr_05 LIKE sys_vin_check_ocr_01;
DROP TABLE sys_vin_check_ocr_05;
INSERT INTO sys_vin_check_ocr_05 SELECT * FROM sys_order_file_ocr;
SELECT * FROM sys_vin_check_ocr_05;
SELECT count(1) FROM sys_vin_check_ocr_05;
SELECT count(1) FROM sys_vin_check_ocr_05 WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr_05 WHERE ocr_vin IS NOT NULL;

CREATE TABLE sys_vin_check_ocr_06 LIKE sys_vin_check_ocr_01;
DROP TABLE sys_vin_check_ocr_06;
truncate TABLE sys_vin_check_ocr_06; 
INSERT INTO sys_vin_check_ocr_06 SELECT * FROM sys_order_file_ocr;
SELECT * FROM sys_vin_check_ocr_06;
SELECT count(1) FROM sys_vin_check_ocr_06;
SELECT count(1) FROM sys_vin_check_ocr_06 WHERE ocr_vin IS NULL;
SELECT count(1) FROM sys_vin_check_ocr_06 WHERE ocr_vin IS NOT NULL;

CREATE TABLE sys_vin_check_ocr_11 LIKE sys_vin_check_ocr_01;
SELECT * FROM sys_vin_check_ocr_11;
truncate  TABLE  sys_vin_check_ocr_11;

CREATE TABLE sys_vin_check_ocr_12 LIKE sys_vin_check_ocr_01;
SELECT * FROM sys_vin_check_ocr_12;
truncate  TABLE  sys_vin_check_ocr_12;

SELECT * FROM sys_vin_check_ocr_01 WHERE ocr_vin != db_vin AND ocr_vin IS NOT NULL AND db_vin NOT LIKE '%*%';
SELECT * FROM sys_vin_check_ocr_04 WHERE ocr_vin != db_vin AND ocr_vin IS NOT NULL AND db_vin NOT LIKE '%*%';

SELECT * FROM sys_order_file_ocr;
truncate  TABLE  sys_order_file_ocr;

#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_10 WHERE db_vin NOT LIKE '%*%' AND ocr_vin != db_vin OR ocr_vin IS NULL )
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_07 WHERE db_vin  NOT LIKE '%*%')*100, 2) AS 匹配失败率



#匹配成功率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_10 WHERE db_vin NOT LIKE '%*%' AND ocr_vin = db_vin AND ocr_vin IS NOT NULL)
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_10 WHERE db_vin  NOT LIKE '%*%')*100, 2) AS 匹配成功率


#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_11 WHERE db_vin NOT LIKE '%*%' AND ocr_vin != db_vin OR ocr_vin IS NULL )
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_11 WHERE db_vin  NOT LIKE '%*%')*100, 2) AS 匹配失败率


#匹配成功率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_11 WHERE db_vin NOT LIKE '%*%' AND ocr_vin = db_vin AND ocr_vin IS NOT NULL)
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_11 WHERE db_vin  NOT LIKE '%*%')*100, 2) AS 匹配成功率


SELECT * FROM  sys_vin_check_ocr_05 WHERE db_vin NOT LIKE '%*%' AND ocr_vin != db_vin OR ocr_vin IS NULL;
SELECT * FROM  sys_vin_check_ocr_06 WHERE db_vin NOT LIKE '%*%' AND ocr_vin != db_vin OR ocr_vin IS NULL;

SELECT b.* FROM sys_vin_check_ocr_05 a LEFT JOIN sys_order_file_ocr b ON b.id  = a.file_id 
WHERE a.ocr_vin IS NULL ;

SELECT b.file_path,b.vin_no ,a.ocr_vin FROM sys_vin_check_ocr_10 a LEFT JOIN sys_order_file_ocr b ON b.id  = a.file_id 
-- WHERE a.ocr_vin IS NULL ;
WHERE db_vin NOT LIKE '%*%' AND ocr_vin != db_vin OR ocr_vin IS NULL;

#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_05 WHERE ocr_vin != db_vin OR ocr_vin IS NULL AND db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_05)*100, 2) AS 匹配失败率

#匹配失败率
SELECT ROUND((SELECT COUNT(1) FROM sys_vin_check_ocr_06 WHERE (ocr_vin != db_vin OR ocr_vin IS NULL) AND db_vin NOT LIKE '%*%')
/
(SELECT COUNT(1) FROM sys_vin_check_ocr_06)*100, 2) AS 匹配失败率


CREATE TABLE sys_order_file_ocr_sn (
	id INT NOT NULL,
	order_id INT NOT NULL,
	sub_order_id INT NULL,
	file_name VARCHAR(32) NULL,
	file_path VARCHAR(255) NULL,
	file_type TINYINT NOT NULL,
	sort TINYINT NOT NULL,
	create_by INT NULL,
	create_time DATETIME NULL,
	sns text NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

SELECT * FROM sys_order_file_ocr_sn;
DROP TABLE sys_order_file_ocr_sn;

SHOW CREATE TABLE sys_vin_check_ocr_06;

CREATE TABLE `sys_vin_check_ocr_sn` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` int(11) DEFAULT NULL COMMENT '工单id',
  `file_id` int(11) DEFAULT NULL COMMENT '照片Id',
  `db_sn` text DEFAULT NULL COMMENT '数据库设备号',
  `ocr_sn` text DEFAULT NULL COMMENT 'OCR识别设备号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

SELECT * FROM sys_vin_check_ocr_sn;
SELECT count(1)  FROM sys_vin_check_ocr_sn;
SELECT count(1)  FROM sys_vin_check_ocr_sn WHERE ocr_sn IS NULL;
CREATE TABLE sys_vin_check_ocr_sn_01 LIKE sys_vin_check_ocr_sn;
select * from sys_vin_check_ocr_sn_01;


truncate TABLE  sys_vin_check_ocr_sn;

SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn a LEFT JOIN sys_order_file_ocr_sn b ON b.id = a.file_id 
WHERE  a.ocr_sn IS NULL;



SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn a LEFT JOIN sys_order_file_ocr_sn b ON b.id = a.file_id 
WHERE  FIND_IN_SET(a.ocr_sn, a.db_sn) > 0;

SELECT * FROM sys_vin_check_ocr_sn WHERE ocr_sn = '96311030615';

SELECT * FROM sys_vin_check_ocr_sn_01;
SELECT count(1)  FROM sys_vin_check_ocr_sn_01;
SELECT count(1)  FROM sys_vin_check_ocr_sn_01 WHERE ocr_sn IS NULL;
SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn_01 a LEFT JOIN sys_order_file_ocr_sn b ON b.id = a.file_id 
WHERE  FIND_IN_SET(a.ocr_sn, a.db_sn) = 0 OR a.ocr_sn IS NULL ;

CREATE TABLE sys_vin_check_ocr_sn_02 LIKE sys_vin_check_ocr_sn;
select * from sys_vin_check_ocr_sn_02 WHERE ocr_sn IS NOT NULL ;

SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn_02 a LEFT JOIN sys_order_file_ocr_sn b ON b.id = a.file_id 
WHERE  FIND_IN_SET(a.ocr_sn, a.db_sn) = 0 OR a.ocr_sn IS NULL ;

CREATE TABLE sys_order_file_ocr_sn_01 (
	id INT NOT NULL,
	order_id INT NOT NULL,
	sub_order_id INT NULL,
	file_name VARCHAR(32) NULL,
	file_path VARCHAR(255) NULL,
	file_type TINYINT NOT NULL,
	sort TINYINT NOT NULL,
	create_by INT NULL,
	create_time DATETIME NULL,
	sns text NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COLLATE=utf8_general_ci;

SELECT * FROM sys_order_file_ocr_sn_01;

CREATE TABLE sys_vin_check_ocr_sn_03 LIKE sys_vin_check_ocr_sn;
select * from sys_vin_check_ocr_sn_03 WHERE ocr_sn IS NOT NULL ;

SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn_03 a LEFT JOIN sys_order_file_ocr_sn_01 b ON b.id = a.file_id 
WHERE  FIND_IN_SET(a.ocr_sn, a.db_sn) = 0 OR a.ocr_sn IS NULL ;

select * from sys_vin_check_ocr_sn_03;
select * from sys_vin_check_ocr_sn_03 WHERE ocr_sn IS NOT NULL ;

SELECT b.* ,a.ocr_sn FROM sys_vin_check_ocr_sn_03 a LEFT JOIN sys_order_file_ocr_sn_01 b ON b.id = a.file_id 
WHERE  FIND_IN_SET(a.ocr_sn, a.db_sn) > 0 ;

select 'false' as QUERYID, id, username, name, org_id, phone_number, user_status, create_by, create_time, update_by, update_time, password, sex, remark, user_type, group_id,public_openId,mini_openId,latitude,longitude,lastest_address from sys_user WHERE ( username = '18682185877' );

SELECT * FROM  sys_order_repair;

SELECT sa.id,
		 CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
		FROM sys_area sa
		LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
		LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id;
	
SELECT * FROM sys_order so ;
select * from sys_order_file_ocr sofo limit 1000;

SELECT * FROM sys_order_ocr_sn_result;
UPDATE sys_order_ocr_sn_result SET file_id = 457 WHERE id = 16;

SELECT * FROM sys_device_repertory; 
SELECT * FROM sys_user su ;
SELECT * FROM sys_manager sm;   # 服务商
SELECT * FROM sys_mechanic sm ; # 技工
SELECT * FROM sys_merchant sm ; # 商户
SELECT * FROM sys_user_org;
SELECT * FROM sys_dict_data; 
SELECT * FROM sys_indent; 

SELECT * FROM sys_service_mechanic; 
SELECT * FROM sys_organization; 
SELECT * FROM sys_user_services; 
SELECT * FROM sys_manager sm WHERE user_id = 576;
SELECT * FROM sys_mechanic sm WHERE user_id = 578; 

SELECT * FROM sys_user su WHERE su.id = 576; 
SELECT * FROM sys_user su WHERE su.id = 578; 
SELECT * FROM sys_device; 
SELECT * FROM sys_indent;

SELECT u.id,u.username, suo.id,so.id 
FROM sys_user_org suo
LEFT JOIN sys_organization so ON suo.org_id = so.id
LEFT JOIN sys_user u ON u.org_id = so.id
LEFT JOIN sys_merchant sm ON sm.user_id = u.id
LEFT JOIN sys_user_service_items susi ON sm.user_id = susi.user_id
LEFT JOIN sys_service_item ssi ON susi.service_code = ssi.service_code
LEFT JOIN sys_user_order_type suot ON u.id = suot.user_id;

SELECT suo.id,suo.user_id ,so.id,so.name ,u.*
FROM sys_user_org suo 
LEFT JOIN sys_organization so ON so.id = suo.org_id  
LEFT JOIN sys_user su ON su.id = suo.user_id 
LEFT JOIN sys_user u ON u.org_id = so.id
WHERE suo.user_id = 634 AND u.user_type = 2;

SELECT * FROM sys_user su WHERE user_type = 0; 
SELECT * FROM sys_organization; 
SELECT * FROM sys_merchant; 

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











