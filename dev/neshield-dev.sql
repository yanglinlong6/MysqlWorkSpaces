select *
from t_role_menu;

select *
from t_menu tm
         left join t_menu_permission tmp on tmp.id = tm.menu_no
where tmp.permission_tag = 'vehicle_vin_frequency';

select *
from t_menu_permission
where permission_tag = 'vehicle_vin_frequency';

select *
from t_menu
where permission_tag = 'vehicle_vin_frequency';

select *
from t_role_menu
where menu_id = 6010211;

SELECT * FROM t_workorder tw WHERE tw.order_source = 'zlgj' AND tw.del_flag = 0 and tw.status = 2;
SELECT * FROM t_workorder tw WHERE tw.order_source = 'glsx_nes' AND tw.del_flag = 0 and tw.status = 2;
SELECT * FROM t_workorder tw WHERE tw.order_source = 'GLSX' AND tw.del_flag = 0 and tw.status = 2;
SELECT * FROM t_workorder tw WHERE tw.partner_order_no  = 'AP16868834504270';
SELECT * FROM t_vehicle tv WHERE tv.vin = 'LZW16868813223590';
SELECT * FROM t_vehicle tv WHERE tv.workorder_id = 33714;
SELECT * FROM t_workorder_vehicle twv WHERE twv.workorder_id  =33714;
SELECT * FROM t_workorder tw WHERE tw.id = 21957;
SELECT *FROM t_tenant tt ;

SELECT tw.* FROM t_workorder tw left join t_workorder_vehicle twv ON twv.workorder_id = tw.id WHERE twv.vin = 'FBIBFT10020911991'; 


select
*
from t_workorder_documents
where del_flag = 0;

 select tw.*
        from t_workorder tw
                 left join t_workorder_vehicle twv on twv.workorder_id = tw.id
        where tw.del_flag = 0
          and tw.status = 2
          and tw.order_source = 'zlgj'
          and tw.service_type = 'IS'
          and tw.partner_order_no = 2022042015005999
          and twv.vin = 'LF23F89K010215999'
        order by tw.id desc limit 1;

select *
from t_role tr
where tr.del_flag = 0;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010211, 0, sysdate(), 1
from t_role tr
where del_flag = 0;

select id, count(1) as num
from t_role_menu
where del_flag = 0
  and menu_id = 6010211
group by role_id
having num > 1;

delete
from t_role_menu
where id in (6988, 7069, 7040);

select *
from t_alarm_track_stujudge
where sn = '1501014648';

select *
from t_vehicle_device
where del_flag = 0;


select tvd.sn
from t_vehicle_device tvd
         left join t_vehicle tv on tv.id = tvd.vehicle_id
         left join t_user tu on tu.id = tv.created_by
where tu.tenant_id = 44
  and tv.del_flag = 0
  and tv.del_flag = 0
  and tu.del_flag = 0;

select turr.user_id      as userId,
       turr.role_id      as roleId,
       tm.menu_no        as menuNo,
       tm.menu_name      as menuName,
       tm.permission_tag as permissionTag
from t_role_menu trm
         left join t_menu tm on trm.menu_id = tm.menu_no
         left join t_user_role_relation turr on trm.role_id = turr.role_id
where trm.del_flag = 0
  and tm.del_flag = 0
  and turr.del_flag = 0
  and tm.enable_status = 1
  and tm.permission_tag = 'vehicle_vin_frequency'
  and turr.user_id in (1048);

select *
from t_user
where id = 1048;

select *
from t_user_role_relation
where user_id = 1048;

select *
from t_role_menu
where role_id = 64
  and menu_id = 6010211;

select *
from t_workorder
where id = 33707;

select *
from t_workorder_vehicle
where workorder_id = 33707;

select *
from t_workorder_vehicle_device
where workorder_id = 33707;

select *
from t_workorder_documents
where workorder_id = 33707;

select sysdate();

select tfofs.sn
from t_fake_offline_fence_sn tfofs
         left join t_vehicle_device tvd on tvd.sn = tfofs.sn
where tfofs.del_flag = 0
  and tfofs.status = 1
  and tvd.id in
      (select tvd.id
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)
union
select tfocf.sn
from t_fake_offline_change_frequently tfocf
         left join t_vehicle_device tvd on tvd.sn = tfocf.sn
where tfocf.del_flag = 0
  and tfocf.status = 1
  and tvd.id in
      (select tvd.id
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)
union
select tws.sn
from t_whitelist_sn tws
         left join t_vehicle_device tvd on tvd.sn = tws.sn
where tws.del_flag = 0
  and tvd.id in
      (select tvd.id
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)

  and tws.department_id IN
      (select sub_id
       from t_organization
       where del_flag = 0
         and superior_id = 1611
       order by superior_id, depth);

select *
from t_workorder
where partner_order_no = 'ZL1111119930930';

select *
from t_workorder_documents
where workorder_id = 33721;

select *
from t_device_location
where sn in (1700112234, 1570916886);

select *
from t_menu tm where permission_tag in ('vehicle_table_car_model','vehicle_table_car_label','vehicle_table_car_use');

select *
from t_role_menu where menu_id in (select menu_no from t_menu tm where permission_tag in ('vehicle_table_car_model','vehicle_table_car_label','vehicle_table_car_use'));

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010212, 0, sysdate(), 1
from t_role tr;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010213, 0, sysdate(), 1
from t_role tr;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010214, 0, sysdate(), 1
from t_role tr;

SELECT  * FROM t_tenant tt 

select tvd.sn
from t_vehicle_device tvd
         left join t_vehicle tv on tv.id = tvd.vehicle_id
         left join t_user tu on tu.id = tv.created_by
where tu.tenant_id = 44
  and tv.del_flag = 0
  and tvd.bind_status = 1
  and tvd.del_flag = 0
  and tv.del_flag = 0
  and tu.del_flag = 0 LIMIT 200;

 SHOW COLUMNS  from  t_vehicle_device;

SELECT * FROM t_user WHERE account = 'zlgj' AND del_flag = 0;
SELECT * FROM t_user WHERE account = 'yanglinlong' AND del_flag = 0;
SELECT * FROM t_user WHERE account = 'yangll' AND del_flag = 0;
UPDATE t_user SET special_mark = NULL WHERE id = 1048;


alter table t_user add special_login tinyint(2) DEFAULT 0 COMMENT '0:不特殊登陆，1:特殊登陆' AFTER enable_status;
alter table t_user add special_mark varchar(512) DEFAULT NULL COMMENT '特殊登陆识别字符串' AFTER special_login;
alter table t_user drop special_mark ;

CREATE TABLE `t_dev_split` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `vid` int(11) DEFAULT NULL COMMENT '车辆ID',
  `vin` varchar(32) DEFAULT NULL COMMENT '车架号',
  `split_flag` tinyint(2) DEFAULT '0' COMMENT '是否分离 0=未分离 1=分离',
  `begin_time` datetime DEFAULT NULL COMMENT '设备分离报警推送时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `index_vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新e盾|设备分离表';

SELECT id,vid,vin,split_flag,begin_time,created_date FROM t_dev_split WHERE vid = 123 
AND DATE_FORMAT(begin_time, '%Y-%m-%d')= DATE_FORMAT(CURDATE(), '%Y-%m-%d') ORDER BY id DESC;

DROP table t_dev_split;
SELECT *FROM t_dev_split WHERE del_flag = 0;
UPDATE t_dev_split SET del_flag = -1 WHERE del_flag = 0;


SELECT * FROM t_vehicle tv WHERE vin = 'LZW16859504947880'; 

select tv.id as vid, tw.partner_order_no as appcode, tv.owner_name as username, tv.vin as vin, tvd.sn as imei, td.source,
 (CASE td.source WHEN 1 THEN '有线' WHEN 0 THEN '无线' ELSE '' END) as equipment 
 from t_vehicle_device tvd 
 left join t_device td on td.sn = tvd.sn 
 left join t_vehicle tv on tv.id = tvd.vehicle_id 
 left join t_workorder tw on tw.id = tv.workorder_id 
 left join t_user tu on tv.created_by = tu.id 
 where tu.tenant_id = 44  and tv.del_flag = 0  
and tvd.del_flag = 0  and tvd.bind_status = 1  and tw.del_flag = 0  and tw.status = 2 AND td.source IS NULL ;

SELECT * FROM t_device WHERE sn = '1611088776';

SELECT * FROM t_vehicle_device tvd  WHERE vehicle_id =67761; 

alter table t_vehicle_device add active_flag tinyint(2) DEFAULT 0 COMMENT '是否是工单激活的设备 0: 是 1: 否' after wire_type;
alter table t_vehicle_device drop active_flag ;

SELECT * FROM t_device dti WHERE dti.sn  = '1570717414';
SELECT * FROM t_device dti WHERE dti.sn  = '1570915965';
1570717414 3010005954
DROP TABLE t_poi_fence; 
CREATE TABLE `t_poi_fence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `poi_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'poi名称',
  `poi_type` tinyint(2) DEFAULT '0' COMMENT 'POI类型 1:黑区圆心，2:二押点，3:异常聚集点',
  `lnglat` text COLLATE utf8_bin COMMENT '经纬度坐标',
  `enable_status` tinyint(4) DEFAULT '1' COMMENT '状态 0=关闭 1=开启',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述(备注)',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_tef_created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='POI列表';

SELECT * FROM t_poi_fence;

SELECT tpf.poi_name AS poiName, 
tpf.poi_type AS poiType,
tpf.enable_status AS enableStatus,
tpf.created_date AS createdDate,
tu.username AS  createUserName
FROM 
t_poi_fence tpf LEFT JOIN t_user tu ON tu.Id = tpf.created_by ;

SELECT tpf.poi_name AS poiName,
        tpf.poi_type AS poiType,
        tpf.enable_status AS enableStatus,
        tpf.created_date AS createdDate,
        tu.username AS createUserName,
        tu.created_by AS createdBy
        FROM t_poi_fence tpf LEFT JOIN t_user tu ON tu.Id = tpf.created_by
        where tpf.del_flag = 0
        order by tpf.id DESC;
       
 SELECT DISTINCT  LENGTH(sn) FROM  d_track_info ;


SELECT * FROM t_role tr ;

SELECT * FROM t_workorder tw ;

show OPEN TABLES where In_use > 0;

show processlist

SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCKS; 
SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCK_WAITS; 

SELECT r.trx_id waiting_trx_id,r.trx_mysql_thread_id waiting_thread,
TIMESTAMPADD(SECOND,r.trx_wait_started,CURRENT_TIMESTAMP) wait_time,
r.trx_query waiting_query,
l.lock_table waiting_table_lock,
b.trx_id blocking_trx_id,b.trx_mysql_thread_id blocking_thread,
SUBSTRING(p.`HOST`,1,INSTR(p.`HOST`,':')-1) blocking_host,
SUBSTRING(p.`HOST`,INSTR(p.`HOST`,':')+1) blocking_port,
IF(p.COMMAND ='Sleep',p.TIME,0) idle_in_trx,
b.trx_query blocking_query
from information_schema.INNODB_LOCK_WAITS w
INNER JOIN information_schema.INNODB_TRX b ON b.trx_id = w.blocking_lock_id
INNER JOIN information_schema.INNODB_TRX r ON r.trx_id = w.requesting_trx_id
INNER JOIN information_schema.INNODB_LOCKS l ON l.lock_id = w.requested_lock_id
LEFT JOIN information_schema.`PROCESSLIST` p ON p.id = b.trx_mysql_thread_id
ORDER BY wait_time desc;

show status like '%lock%';

SELECT * FROM t_workorder tw ;
SELECT * FROM t_electric_fence tw ;
SELECT * FROM t_device td WHERE sn = '1570921355'; 
alter table t_electric_fence add `source` tinyint(2) DEFAULT NULL COMMENT '1有源 0无源' after fence_no;
UPDATE t_electric_fence SET source = 1;

SELECT * FROM t_vehicle_log tvl ;
SELECT * FROM t_workorder tw ;

SELECT *FROM t_device td ;
SELECT DISTINCT order_source  FROM t_workorder tw ;



select
taef.id taefId,
taef.fence_id fenceId,
tw.partner_order_no bizOrderNo,
tv.owner_name ownerName,
tv.vin vin,
case when tv.type_id is null then tv.model_name else concat(tv.series_name, '/', tv.type_name) end modelName,
tvd.sn sn,
td.model_name deviceModelName,
tef.fence_name fenceName,
tef.source source,
taef.address address,
taef.fence_type alarmType,
taef.alarm_time alarmTime,
taef.end_time endTime
from t_alarm_electric_fence taef
left join t_vehicle_device tvd on tvd.id = taef.vd_id
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_workorder tw on tw.id = tv.workorder_id and tw.del_flag = 0
left join t_electric_fence tef on tef.id = taef.fence_id
where tv.del_flag = 0
and taef.del_flag = 0
and tvd.del_flag = 0
and tef.del_flag = 0;

select
count(1)
from t_alarm_electric_fence taef
left join t_vehicle_device tvd on tvd.id = taef.vd_id
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_electric_fence tef on tef.id = taef.fence_id
where tv.del_flag = 0
and taef.del_flag = 0
and tvd.del_flag = 0
and tef.del_flag = 0;

SELECT * FROM t_user tu WHERE tu.account  = 'yangll01';	
SELECT * FROM t_cust_user_local_auth tcula WHERE tcula.account = 'yangll01';
SELECT * FROM t_cust_user_local_account tcula WHERE tcula.auth_id IN (25);
SELECT * FROM t_cust_user_auth_rel tcual WHERE  tcual.auth_id IN (25);
SELECT * FROM t_cust_user tcu WHERE tcu.id IN (21);
SELECT * FROM t_user tu WHERE tu.id = 1241;
       
SELECT * FROM t_device td ;

SELECT * FROM t_workorder tw ; 

SELECT * FROM t_vehicle tv ; 

SELECT * FROM t_workorder_vehicle twv ;

select tv.id,
       twv.lessee_name  AS lesseeName,
       tw.`shop_name`   AS shopName,
       tw.partner_order_no AS workOrderNo,
       tv.vin           as vin,
       tv.created_date  AS createTime,
       group_concat(tvd.sn ORDER BY tvd.id)    AS sns,
       group_concat(td.source ORDER BY tvd.id) AS sources,
       group_concat(td.device_type ORDER BY tvd.id) AS deviceTypes
from t_vehicle tv
         LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id
         LEFT JOIN t_device td ON td.sn = tvd.sn
         LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id AND tw.del_flag = 0
         LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id AND twv.del_flag = 0
where tv.del_flag = 0
  AND tvd.bind_status = 1
  AND tvd.del_flag = 0
  AND tv.id = 16171
GROUP BY tv.id;

SELECT * FROM t_vehicle_device tvd WHERE tvd.sn IN (1590427400,1590427891);
SELECT * FROM t_alarm_warn_analyse;
SELECT DATE_FORMAT(created_date , '%Y-%m-%d %H:%i:%s') FROM t_alarm_warn_analyse;

SELECT DISTINCT alarm_level  FROM t_alarm_warn_analyse;
SELECT * FROM t_alarm_warn_analyse;

DROP TABLE t_device_stay_often;
CREATE TABLE `t_device_stay_often` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '里程主键ID',
  `sn` varchar(32) DEFAULT NULL COMMENT '设备号',
  `vd_id` int(11) DEFAULT NULL COMMENT '车辆、设备关系id',
  `home_address` varchar(64) DEFAULT NULL COMMENT '预测家庭地址',
  `home_lng` varchar(20) DEFAULT NULL COMMENT '家庭地址经度',
  `home_lat` varchar(20) DEFAULT NULL COMMENT '家庭地址纬度',
  `work_address` varchar(64) DEFAULT NULL COMMENT '预测工作地址',
  `work_lng` varchar(20) DEFAULT NULL COMMENT '工作地址经度',
  `work_lat` varchar(20) DEFAULT NULL COMMENT '工作地址纬度',
  `predict_date` datetime DEFAULT NULL COMMENT '预测时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间|入库时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sn` (`sn`),
  KEY `idx_predict_date` (`predict_date`),
  KEY `idx_vd_id` (`vd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新e盾|预测家庭地和预测工作地表';

SELECT * FROM t_device_stay_often;
SELECT *
    FROM t_device_stay_often
    where del_flag = 0
    and sn = #{sn}
    AND predict_date =  (SELECT max(predict_date)  FROM t_device_stay_often WHERE sn = #{sn});
   
SELECT max(predict_date)  FROM t_device_stay_often   

SELECT * FROM t_device_location tdl ;
SELECT * FROM t_alarm_second_data tasd ;
SHOW CREATE TABLE t_alarm_second_data;
CREATE TABLE `t_alarm_second_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(32) DEFAULT NULL COMMENT '设备号',
  `vd_id` int(11) DEFAULT '0' COMMENT '车辆、设备关系id',
  `type` varchar(32) DEFAULT NULL COMMENT '二押区域规则类型(二押地停留)',
  `name` varchar(32) DEFAULT NULL COMMENT '二押区域规则名称(二押地停留)',
  `alarm_time` datetime DEFAULT NULL COMMENT '二押区域报警时间',
  `alarm_address` varchar(128) DEFAULT NULL COMMENT '二押区域报警位置',
  `leave_time` datetime DEFAULT NULL COMMENT '离开二押区域时间(当前还未动身的数据不记录到数据库)',
  `stay_time` int(8) DEFAULT NULL COMMENT '二押区域停留时长',
  `lng` varchar(20) DEFAULT NULL COMMENT '二押区域停留经度',
  `lat` varchar(20) DEFAULT NULL COMMENT '二押区域停留纬度',
  `event_time` datetime DEFAULT NULL COMMENT '事件时间，写入事件',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间|入库时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sn` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='二押警情数据表';

SELECT * FROM t_vehicle_device tvd WHERE sn = '1570921451';
SELECT * FROM t_device td WHERE sn = '1570921451'; 
SELECT * FROM t_device_stay_often;

select tvd.sn    AS sn,
               td.source AS source
        from t_vehicle_device tvd
                 LEFT JOIN t_device td ON td.sn = tvd.sn
        where tvd.vehicle_id = 67771
          AND tvd.bind_status = 1
          AND td.source = 1
          AND td.del_flag = 0
          and tvd.del_flag = 0
        order by tvd.created_date;
       
SELECT
      *
      FROM t_device_stay_often
      where del_flag = 0
      AND sn = '1570921451'
      AND predict_date = (SELECT max(predict_date) FROM t_device_stay_often WHERE sn = '1570921451' and del_flag = 0);
     
SELECT * FROM t_alarm_warn_analyse ORDER BY alarm_time desc;    
SELECT * FROM t_device_journey ORDER BY begin_time desc;
SELECT * FROM t_device_journey WHERE sn = '1570921451' ORDER BY begin_time desc;
-- 67771	1570921451
 SELECT
            DATE(begin_time) AS dayInt, sum(mileage) AS dayNum
        FROM t_device_journey
        WHERE sn = '1570921451'
        GROUP BY dayInt
        ORDER BY dayInt;
SELECT * FROM t_device_journey;       

select tv.id,
       twv.lessee_name                              AS lesseeName,
       tw.`shop_name`                               AS shopName,
       tw.partner_order_no                          AS workOrderNo,
       tv.vin                                       as vin,
       tv.created_date                              AS createTime,
       group_concat(tvd.sn ORDER BY tvd.id)         as sns,
       group_concat(td.source ORDER BY tvd.id)      as sources,
       group_concat(td.device_type ORDER BY tvd.id) AS deviceTypes
from t_vehicle tv
         LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id
         LEFT JOIN t_device td ON td.sn = tvd.sn
         LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id AND tw.del_flag = 0
         LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id AND twv.del_flag = 0
where tv.del_flag = 0
  AND tvd.bind_status = 1
  AND tvd.del_flag = 0
  AND tv.id = 67771
GROUP BY tv.id;

select
tv.*
from t_vehicle tv
inner join t_vehicle_device tvd on tvd.vehicle_id = tv.id
where tv.del_flag = 0 and tvd.bind_status = 1 and tvd.del_flag = 0
    and tvd.sn = '1570921451';
   
SELECT * FROM t_device td WHERE td.sn = '1570921451';
SELECT * FROM t_vehicle tv WHERE tv.id = '67763';
SELECT * FROM t_vehicle_device tvd WHERE tvd.vehicle_id = '67763';

select tvd.sn    AS sn,
               td.source AS source
        from t_vehicle_device tvd
                 LEFT JOIN t_device td ON td.sn = tvd.sn
        where tvd.vehicle_id = 16172
          AND tvd.bind_status = 1
--           AND td.source = 1
          AND td.del_flag = 0
          and tvd.del_flag = 0
        order by tvd.created_date;
        
select tvd.id as vdId,
tw.partner_order_no as workOrderNo,
tv.owner_name as ownerName,
tvd.sn as sn,
tv.vin as vin,
tv.created_by as createdBy,
td.device_type as deviceType,
tvd.created_date as activeDate,
tdl.last_gps_time as lastGpsTime,
tdl.last_bs_time as lastBsTime,
td.source as `source`
from t_vehicle tv
left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
left join t_device td on td.sn = tvd.sn
left join t_workorder tw on tw.id = tv.workorder_id and tw.del_flag = 0
left join t_device_location tdl on tdl.sn = td.sn
where tv.del_flag = 0
and tvd.bind_status = 1
and tvd.del_flag = 0
    and ((tdl.last_gps_time < '2024-03-22 10:15:04' and tdl.last_bs_time < '2024-03-22 10:15:04')
    or (tdl.last_gps_time is null and tdl.last_bs_time is null)
    or (tdl.last_gps_time is null and tdl.last_bs_time < '2024-03-22 10:15:04')
    or (tdl.last_gps_time < '2024-03-22 10:15:04' and tdl.last_bs_time is null)
    )
    and tv.id = '67763'
order by vdId DESC; 

 SELECT begin_time,
        YEAR(begin_time) AS yearInt,
        WEEK(begin_time,1) AS weekInt,
        sum(mileage)     AS weekNum
        FROM t_device_journey
        WHERE sn = 1570921451
        AND del_flag = 0
        GROUP BY yearInt,weekInt
        ORDER BY yearInt ,weekInt;
       
SELECT * FROM t_device_journey tdj WHERE tdj.sn = '1570921451';   
SELECT * FROM t_device tdj WHERE tdj.sn = '1570921451';  

SELECT
    YEAR(begin_time) AS yearInt,
    MONTH(begin_time) AS monthInt,
    DAY(begin_time) AS dayInt,
    sum(mileage)/1000 AS dayNum
FROM t_device_journey
WHERE sn = 1570921461
GROUP BY dayInt
ORDER BY dayInt;

SELECT * FROM  t_device_journey WHERE sn = '1570921461';
SELECT * FROM t_vehicle_device tvd WHERE tvd.sn = '1570921461';
SELECT * FROM t_vehicle tv WHERE tv.id = 67771;	

       


























