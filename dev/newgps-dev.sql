SHOW CREATE TABLE d_pingan_push_key_map;

CREATE TABLE `d_pingan_push_key_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workorder_id` int(11) DEFAULT NULL COMMENT '工单ID',
  `image_name` varchar(50) DEFAULT NULL COMMENT '照片名',
  `old_business_id` varchar(100) DEFAULT NULL COMMENT '平安系统key值(推送成功的key)',
  `new_business_id` varchar(100) DEFAULT NULL COMMENT '平安系统key值(最新的key)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='平安工单推送key值表'

SELECT * FROM d_pingan_push_key_map WHERE workorder_id = 829302;

SELECT * FROM d_vehicle_workorder dvw WHERE orderType = 'Zl'; 
truncate TABLE  d_pingan_push_key_map;
SELECT * FROM d_user du WHERE userRemark LIKE '%仲利%';

ALTER TABLE d_feedback_param modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单申请编号';
ALTER TABLE d_vehicle_workorder modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';
ALTER TABLE d_check_active_log modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单号';
ALTER TABLE d_active_screen_url modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';

SELECT * FROM d_track_info dti WHERE dti.isActive = 0 AND dti.source = 1 ;
select * from d_vehicle_workorder dvw WHERE sqbh = 'PA1645359554676002816';
select * from d_track_alarm_rec dtar  ORDER BY begintime DESC ;
select * from d_track_alarm_rec dtar  WHERE LEFT(begintime,10) = '2023-05-06' ;
SELECT sysdate(); 
select * from d_feedback_pa WHERE workorder_id = 829303;
ALTER TABLE d_feedback_pa modify `status` tinyint(2) DEFAULT NULL COMMENT '1:录入工单 2:工单改约 3:工单异常 4:申请关单 5:拒绝关单 6:更新工单 7:取消工单 8:编辑照片 9:工单激活反馈 10:重推 11:获取设备可复用天数 12:复核失败推送 13:中台核验失败推送';
ALTER TABLE d_feedback_pa modify `remark` varchar(1024) DEFAULT NULL COMMENT '备注';

UPDATE d_pingan_push_key_map dppkm SET dppkm.old_business_id  = dppkm.new_business_id ,dppkm.update_time = sysdate() 
WHERE dppkm.workorder_id =829300; 

ALTER TABLE d_pingan_push_key_map DROP INDEX workorder_id_image_name;

SELECT * FROM d_app_image dai WHERE dai.workOrderId = 829300; 

SELECT * FROM d_app_image_delete daid WHERE daid.workOrderId = 829300; 

select *
from d_pingan_push_key_map a
where a.workorder_id = #{workOrderId} and a.new_business_id = #{newKey};


SELECT * FROM d_vehicle_workorder dvw WHERE dvw.orderType = 'PAZl' AND status = 0 ORDER BY createtime DESC;

SELECT * FROM d_pingan_push_key_map;

INSERT INTO d_pingan_push_key_map (workorder_id	,image_name	,old_business_id,new_business_id,create_time)
SELECT dap.workOrderId ,dap.imageName ,dap.business_id ,dap.business_id ,sysdate()  
FROM  d_app_image dap 
LEFT JOIN d_vehicle_workorder dvw ON dvw.workOrderId = dap.workOrderId  
WHERE dvw.orderType = 'PAZL' AND dap.business_id IS NOT NULL ;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PA1643883073869320192';
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 829302;
SELECT * FROM d_class dc WHERE dc.classid = 88889040; 
SELECT * FROM d_class dc WHERE dc.classid = 88889357; 
SELECT * FROM d_group dg WHERE dg.vehicleGroupId = 200;
SELECT * FROM d_class dc WHERE dc.vehicleGroupId  = 200; 
SELECT * FROM d_vehicle_workorder_rep ORDER BY id DESC ;
UPDATE d_vehicle_workorder_rep SET status =0;

update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+10)*1000
where TRIGGER_NAME = 'ghVehicleWorkOrderTrigger';

SELECT *  from `qrtz_cron_triggers` where trigger_name = 'ghVehicleWorkOrderTrigger';
SELECT *  from `qrtz_triggers` where trigger_name = 'ghVehicleWorkOrderTrigger';
SELECT *  from `qrtz_job_details` where job_name = 'ghVehicleWorkOrderTrigger';

SELECT *  from `qrtz_cron_triggers` where trigger_name in (
'syncInsuranceToEquityOrderTrigger',
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2'
);

SELECT *  from `qrtz_triggers` where trigger_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2'
);

SELECT *  from `qrtz_job_details` where job_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2'
);

DELETE  from `qrtz_cron_triggers` where trigger_name in (
'ghVehicleWorkOrderTrigger'
);

DELETE  from `qrtz_triggers` where trigger_name in (
'ghVehicleWorkOrderTrigger'
);

DELETE  from `qrtz_job_details` where job_name in (
'ghVehicleWorkOrderTrigger'
);

SELECT *FROM d_user du WHERE username = 'zlgj';
SELECT *FROM d_user du WHERE du.d_LoginUserId = 651;

SELECT * FROM d_device_login ddl WHERE ddl.sn  = '1700112234'; 

SELECT * FROM d_gps_config WHERE typeNo = 'email';	
select * from d_vehicle_insurance;;

SELECT dvi.full_insurance_no AS contractNo,
       DATE_FORMAT(dvi.createTime,'%Y-%m-%d %H:%i:%s')  AS successDate,
       dg.groupName  AS merchantName,
       dvi.name AS customerName,
       dvi.mobile AS customerPhone,
       dvi.status AS status,
       DATE_FORMAT(dvi.endTime,'%Y-%m-%d %H:%i:%s') AS endTime,
       DATE_FORMAT(dvi.takeEffectTime,'%Y-%m-%d %H:%i:%s')  AS effectiveDate,
       dvi.standno AS vin,
       dvi.vehicleBrand AS vehicleBrandName,
       dvi.vehicleType AS vehicleSeriesName, 
       dvi.id AS sourceId,
       DATE_FORMAT(dvi.updateTime,'%Y-%m-%d %H:%i:%s') AS updateTime,
       du.userRemark AS updatedBy
FROM d_vehicle_insurance dvi LEFT JOIN	d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId
WHERE dvi.status IN (1,3) AND 
(DATE_FORMAT(dvi.createTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d') 
OR DATE_FORMAT(dvi.updateTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d')
);

SELECT * FROM d_track_alarm_rec dtar  WHERE dtar.sn = '75111051092'; 
SELECT * FROM d_track_info dti WHERE dti.sn = '75111051092';
SELECT * FROM d_track_info dti WHERE dti.source  = 0;
SELECT dtar.* FROM d_track_alarm_rec dtar LEFT JOIN d_track_info dti ON dti.sn =  dtar.sn WHERE dtar.alarmType  = 99;
SELECT * FROM t_track_stujudge_alarm ttsa WHERE ttsa.sn = 1591126165; 

update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+30)*1000
where TRIGGER_NAME = 'syncInsuranceToEquityOrderTrigger';

SELECT *  from `qrtz_cron_triggers` where trigger_name in (
'zLGpsDailyMonitorTrigger'
);

SELECT *  from `qrtz_triggers` where trigger_name in (
'zLGpsDailyMonitorTrigger'
);

select eda.sn as sn, count(1) as offlineTimes from eshield_device_alarm eda where eda.alarm_type = 2  
and eda.sn in ( '14149258475','14149258476','14149258476','1590000008' ) group by eda.sn

select dtar.sn, count(*) as countRec from d_track_alarm_rec dtar 
WHERE dtar.alarmType = 99 AND dtar.sn IN ('1511224229','1610522773','1680521003','2192801101') group by dtar.sn;


SELECT * FROM d_track_alarm_rec;  

select dtar.sn, dtar.alarmType , dtar.lng as lng, dtar.lat as lat, dtar.lasttime as lasttime, dtar.begintime as begintime from d_track_alarm_rec dtar where dtar.delflag = 0 and dtar.sn = '8131206335' and dtar.alarmType = 6;


select dtar.sn, count(*) as countRec from d_track_alarm_rec dtar where dtar.sn in ('1511224229','1610522773','1680521003','2192801101','8131206335' ) and dtar.alarmType = 6 group by dtar.sn;


select eda.sn as sn,eda.alarm_type , count(1) as offlineTimes from eshield_device_alarm eda GROUP BY eda.sn;


select dtar.sn, dtar.lng, dtar.lat, dtar.lasttime, dtar.begintime  from d_track_alarm_rec dtar where dtar.delflag = 0
AND dtar.alarmType = 6;

SELECT * FROM t_track_stujudge_alarm WHERE delflag = 2;
SELECT *FROM d_device_login;


SELECT * FROM t_track_stujudge_alarm WHERE poi_type = '非长停地';
UPDATE t_track_stujudge_alarm SET poi_type = '非常停地' WHERE poi_type = '非长停地';

SELECT * FROM d_track_info dti WHERE dti.isActive  = 0 AND dti.source = 1;
SELECT * FROM d_track_info dti WHERE dti.sn  = '1570717414';
SELECT * FROM d_track_info dti WHERE dti.sn  = '1570921346';
SELECT * FROM d_track_info dti WHERE dti.sn  like '93%';
SELECT * FROM d_track_alarm_rec dtar WHERE dtar.sn = '96541445375';
SELECT * FROM d_track_alarm_rec dtar WHERE dtar.sn = '93107720006';

select ed.id , edc.name
        from eshield_device ed
                 inner join eshield_device_classify edc on ed.classifyId = edc.id
        where ed.id = 130021 limit 0,1;
       
SELECT * FROM d_group dg WHERE dg.groupName LIKE '%平安%'; 

SELECT dti.sn,dti.source 
       FROM d_vehicle dv,
       d_track_info dti,
       d_class dc
       WHERE dti.vehicleId = dv.vehicleId
       AND dc.classid = dv.classId
       AND dv.status = 0
       AND dc.vehicleGroupId IN (200);
      
SELECT * FROM d_track_alarm_rec WHERE alarmType = 15;

SELECT * FROM d_vehicle_workorder dvw WHERE sqbh = 'PA1643883073869320192';
SELECT * FROM t_track_stujudge_alarm ttsa WHERE ttsa.sn = '1500102752' AND alarm_type = 2 AND delflag = 2; 
UPDATE t_track_stujudge_alarm SET poi_type = '非常住地' WHERE poi_type = '非常停地';

       
       
SELECT * FROM d_vehicle_workorder WHERE workOrderId  = 829956;
ALTER TABLE d_vehicle_workorder ADD `addFlag` varchar(32) DEFAULT NULL COMMENT '平安工单加装单标志 1：是 0：否' AFTER tradeEntity;
ALTER TABLE d_vehicle_workorder ADD `threeCodeFlag` tinyint(2) DEFAULT 0 COMMENT '修改三码合一标志位 1：可修改 0：不可修改' AFTER addFlag;
ALTER TABLE d_vehicle_workorder DROP `addFlag`;
ALTER TABLE d_vehicle_workorder DROP `threeCodeFlag`;
SELECT * FROM d_track_info dti WHERE sn LIKE '96%';
select * from d_track_alarm_rec WHERE delflag = 0;
SELECT * FROM d_vehicle_workorder_rep ORDER BY id DESC ;
ALTER TABLE d_vehicle_workorder_rep modify `title` varchar(500) DEFAULT NULL;

SELECT dv.standno as vin, dti.sn, dti.source,dvw.sqbh 
        FROM d_vehicle_workorder dvw
                 LEFT JOIN d_vehicle dv ON dv.workOrderId = dvw.workOrderId
                 LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId
        WHERE  dv.status = 0
          AND dvw.status in (0, 1) AND dvw.sqbh = '219858' ;


select * from d_track_alarm_rec dtar ;
CREATE TABLE d_track_alarm_rec_basic LIKE d_track_alarm_rec;
select * from d_track_alarm_rec_basic;

alter table d_device_freq drop command_id ;
select * from d_device_freq;
alter table d_device_freq add command_id varchar(256)  DEFAULT NULL COMMENT '平安传递过来的命令id' AFTER duration;

SELECT * FROM d_device_freq;

SELECT ddf.battery_level AS batteryLevel, LEFT(ddf.create_time, 19) AS createTime, ddf.freq_type AS freqType,
        LEFT(dv.createtime,19) AS activeTime, ddf.channel AS channel, du.username AS operation,
        ddf.catching_timer AS catchingTimer, ddf.timer AS timer, ddf.week AS week, ddf.week_timer AS weekTimer,
        TIMESTAMPDIFF(MINUTE, ddf.create_time, ddf.update_time) AS diffMinuteTime,
        TIMESTAMPDIFF(DAY, ddf.create_time, ddf.update_time) AS diffDayTime,
        ddf.sn AS sn, dv.standno AS standno, dv.name AS name,
               ddf.`status`        AS freqStatus,
               ddf.duration        AS duration,
               ddf.response_status AS responseStatus
        FROM d_device_freq ddf
        LEFT JOIN d_vehicle dv ON ddf.vehicle_id = dv.vehicleId
        LEFT JOIN d_user du ON du.d_LoginUserId = dv.lastLoginUserId
        WHERE ddf.sn = '2370716049'
        ORDER BY ddf.create_time DESC;
       
SELECT * FROM d_device_freq;     
SELECT * FROM d_track_info dti  WHERE isActive  = 0;

SELECT * FROM d_track_alarm_rec dtar WHERE sn = '1570921451';
SELECT * FROM d_track_alarm_rec WHERE sn = '1570915965';
SELECT * FROM d_track_alarm_rec WHERE sn = '2691212737';

SELECT * FROM t_track_stujudge_alarm ttsa WHERE alarm_type = 3;
SELECT * FROM t_track_stujudge_alarm ttsa WHERE sn = '1570921451';

SELECT * FROM d_group dg ;
SELECT * FROM d_class dc WHERE dc.vehicleGroupId = 200; 
SELECT DISTINCT  dti.sn  FROM d_vehicle dv 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
WHERE dv.classId = 88889355;

SELECT * FROM d_feedback_pa; 
SELECT * FROM d_settle; 



SELECT * FROM d_alarm_process_rec; 

SELECT v.name,v.standno,o.sn,b.vehicleTypeName as carType,o.cityname,o.alarmType,o.begintime as alarmTime,o.lng,o.lat,o.alarmid,v.workOrderId,v.acc,dc.vehicleGroupId ,dpr.status as alarmStatus,t.activeDate activeDate  
FROM  d_track_alarm_rec o 	
INNER JOIN  d_track_info  t ON o.sn=t.sn	
LEFT JOIN d_alarm_process_rec dpr ON dpr.sn = o.sn AND dpr.alarmType = o.alarmType AND dpr.warnStartTime = o.begintime	
INNER JOIN  d_vehicle v  ON t.vehicleId=v.vehicleId
LEFT JOIN d_vehicle_brand_type b ON b.vehicleTypeId=v.vehicleTypeId
LEFT JOIN d_class dc ON v.classId=dc.classId
WHERE v.status=0 and o.delflag=0 and v.classId <> 90;

SELECT o.*,v.* ,t.* ,dl.* FROM d_track_alarm_rec_history o
INNER JOIN d_track_info t ON o.sn = t.sn
INNER  JOIN  d_vehicle v ON  t.vehicleId = v.vehicleId
LEFT JOIN d_device_login dl ON o.sn = dl.sn
WHERE v.status=0  AND v.classId <> 90 AND o.sn = '8130902098';

SELECT * FROM d_track_alarm_rec_history WHERE sn = '8130902098'; 

-- gps.d_track_alarm_rec_history definition

select o.*,v.*,t.*,dl.* from d_track_alarm_rec_history o,d_vehicle v,d_track_info t , d_device_login dl
 where o.sn=t.sn and t.vehicleId=v.vehicleId and dl.sn=o.sn and v.status=0 and v.classId <>90
and o.sn in('8130902098')
order by o.alarmid DESC;

SELECT * FROM d_track_info WHERE sn =  '8130902098';
SELECT * FROM d_vehicle dv WHERE vehicleId = 2066;
SELECT * FROM d_device_login ddl WHERE ddl.sn = '8130902098';

























