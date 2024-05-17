select *
from t_track_stujudge_alarm
where sn = 15185613006;

select tc.full_name as area, tc1.full_name as city, tc2.full_name as province
from t_city tc
         left join t_city tc1 on tc1.id = tc.parent_id
         left join t_city tc2 on tc2.id = tc1.parent_id
where tc.id = 440305;

select *
from t_city
where area_name like '%南山%';

SELECT * FROM d_user WHERE d_LoginUserId = 651;
SELECT * FROM d_user WHERE username = 'zhongyuan123';

SELECT * FROM d_gps_config WHERE typeNo = 'email';	

select dv.idnum, dv.name as ownerName, dv.standno
from d_vehicle dv
         left join d_electric_fence_sns defs on defs.standno = dv.standno
         left join d_electric_fence def on def.id = defs.fenceId
where def.id = 770;

SELECT *FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 2023050613000001;
ALTER TABLE d_feedback_param modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单申请编号';
ALTER TABLE d_vehicle_workorder modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';
ALTER TABLE d_check_active_log modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单号';
ALTER TABLE d_active_screen_url modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';

select *  from d_vehicle dv WHERE dv.vehicleId  = 805932;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId  = 829682;

SELECT *FROM d_class dc WHERE dc.classid = 88889358;
SELECT *FROM d_class dc WHERE dc.classid = 88889355;
SELECT * FROM d_group dg WHERE dg.vehicleGroupId =  14;

select * from `qrtz_cron_triggers` where trigger_name = 'gqWindReportMonitorTrigger';
select * from `qrtz_cron_triggers` where trigger_name = 'deviceWithoutLocationMonitorForYXTrigger';
select * from `qrtz_cron_triggers` where trigger_name = 'gqVehicleOfflineTrigger';

update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+30)*1000
where TRIGGER_NAME = 'jysendBasestationTaskTrigger';

select *
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dti.sn = '96210200001'
limit 1;

SELECT * FROM d_track_info dti WHERE dti.isActive = 0 AND dti.source = 1;

select *
from d_vehicle_workorder
where workOrderId = 829436;

select *
from d_user
where username = 'pingan';

SELECT * FROM d_pingan_push_key_map;

select *
from d_user
where username = 'paxm';

select *
from t_city
where area_name like '%牡丹江%';

select *
from t_city
where parent_id = 231000;

select *
from d_vehicle_workorder
where sqbh = 'PAGLSX202301090001';
select *
from d_vehicle_workorder
where sqbh = 'PAGLSX202301090002';

select *
from d_app_image
where workOrderId = 829477;

select *
from d_app_image
where standno = '1234*********5434';

select distinct workOrderId
from d_app_image
where standno = '1234*********5434'
  and name = '张**';

select orderSource
from d_vehicle_workorder
where sqbh = 'PA1623582922655272960';

update d_vehicle_workorder set orderSource = 1 where sqbh = 'PA1623582922655272960';.

ALTER TABLE d_feedback_param modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单申请编号';
ALTER TABLE d_vehicle_workorder modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';


select *
from d_feedback_param;

select *
from d_user where username = 'xjqpa';

select *
from d_track_info where source = 1 and isActive = 0;

select *
from d_track_info
where isActive = 0
  and source = 1;

select *
from d_location_check_log where sn = '96210200001';

select * from t_track_stujudge_alarm where alarm_type = 3 and delflag = 2;

update t_track_stujudge_alarm set delflag = 1 where alarm_type = 3 and delflag = 2;

SELECT * FROM d_class dc WHERE dc.classid = 88889358;
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 805932;
SELECT * FROM d_track_info dti WHERE dti.userId IN (3109098,3109173);
SELECT * FROM d_group dg WHERE dg.vehicleGroupId = 14; 

select *
from sys_device_install_address_info;

select * from d_feedback_param where sqbh = 'PA1634100330792882176';
select * from d_feedback_param where sqbh = 'PA1634100211041308672';

update sys_device_install_address_info sdiai left join d_feedback_param dfp on dfp.sqbh = sdiai.sqbh
    set dfp.device_info = sdiai.device_info where 1=1;

select dti.sn, dvw.*
from d_vehicle_workorder dvw
left join d_vehicle dv on dv.workOrderId = dvw.workOrderId
left join d_track_info dti  on dti.vehicleId = dv.vehicleId
where dvw.orderType = 'PAZL' and dti.isActive = 1;

SELECT * FROM d_pingan_push_key_map;

SELECT * FROM d_feedback_param WHERE sqbh = 'PAGLSX202304060001';
-- [{"installLocation":"后备箱保险盒","sn":"93210200002"}]

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'glsx_1677044744668';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PAGLSX202304060002';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.orderType = 'PAZl'  ORDER BY createtime desc;

SELECT * FROM d_app_image dai  WHERE dai.workOrderId = 829606;
SELECT * FROM d_app_image dai  WHERE dai.workOrderId = 829607;
SELECT * FROM d_app_image_delete daid WHERE daid.workOrderId = 829606;
SELECT * FROM d_app_image_delete daid WHERE daid.workOrderId = 829607;

SELECT *FROM d_feedback_pa;
DELETE  from `qrtz_cron_triggers` where trigger_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger'
);

DELETE  from `qrtz_triggers` where trigger_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger'
);

DELETE  from `qrtz_job_details` where job_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger'
);

select  ac.* 
from d_user du INNER JOIN d_user_role dr on du.d_LoginUserId = dr.d_LoginUserId 
INNER JOIN d_role r on dr.roleId = r.roleId 
INNER JOIN d_auto_classify_config ac ON 
dr.roleId = ac.roleId where du.d_LoginUserId = 651 and r.autoClassfiyConfig = 0 
ORDER by ac.updatetime DESC;

SELECT dvi.full_insurance_no AS contractNo,
       dvi.createTime  AS successDate,
       dg.groupName  AS merchantName,
       dvi.name AS customerName,
       dvi.mobile AS customerPhone,
       dvi.status AS orderStatus,
       dvi.endTime AS endTime,
       dvi.takeEffectTime  AS effectiveDate,
       dvi.standno AS vin,
--        dvi.vehicleBrand AS vehicleBrandName,
       ifnull(dvg.brandName,dvi.vehicleBrand) AS vehicleBrandName,
--        dvi.vehicleType AS vehicleSeriesName, 
       ifnull(dvbt.vehicleTypeName,dvi.vehicleType) AS vehicleSeriesName, 
       dvi.id AS sourceId,
       dvi.updateTime AS updateTime,
       du.userRemark AS updatedBy,
       group_concat(dti.sn) AS sns
FROM d_vehicle_insurance dvi LEFT JOIN	d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_vehicle_brand dvg ON dvg.brandId = dvi.vehicleBrand  
LEFT JOIN d_vehicle_brand_type dvbt ON dvbt.vehicleTypeId = dvi.vehicleType
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId
WHERE dvi.status IN (1,3) 
AND dvi.standno  = 'LMGMU1G83L1043481'
-- AND (DATE_FORMAT(dvi.createTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d') 
-- OR DATE_FORMAT(dvi.updateTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d')
-- )
GROUP BY dv.vehicleId ;

SELECT * FROM t_track_stujudge_alarm WHERE alarm_type = 3;
SELECT * FROM d_track_alarm_rec WHERE sn = '96541445376';
SELECT * FROM d_track_alarm_rec WHERE sn = '96541445375';
SELECT * FROM d_track_info WHERE sn = '2600330628';
SELECT * FROM d_track_info WHERE sn = '96230819332';
select  * from d_track_info where sn = '1630622847' order by createtime desc  limit 0,1;

SELECT * FROM d_vehicle_insurance dvi WHERE dvi.standno = 'LMGMU1G83L1043481'; 

update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+30)*1000
where TRIGGER_NAME = 'syncInsuranceToEquityOrderTrigger';

SELECT * FROM t_track_stujudge_alarm ttsa WHERE ttsa.sn = '96210200001' AND alarm_type =3 AND delflag = 2;
SELECT * FROM d_track_info dti WHERE sn = '93309190133';
SELECT * FROM t_track_stujudge_alarm t where t.alarm_type = 2 and t.sn in ( '1511025598','1500501214','1500109648','96210200002' ) and t.delflag = 2 order by t.id DESC;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'glsx_1691466553082'; 
SELECT dvi.vehicleId,dvi.*  FROM d_vehicle_insurance dvi WHERE dvi.standno = 'LMGMU1G83L1043481'; 


SELECT * FROM d_vehicle dv WHERE dv.vehicleId in(805152); 
SELECT * FROM d_track_info dti WHERE dti.vehicleId in(805152); 

SELECT * FROM d_track_info dti ORDER BY trackerId DESC ;
-- 2583971 
SELECT count(1) FROM d_track_info;
-- 491120

INSERT INTO d_track_info (deviceType,deviceNo,sn,imsi,iccid,simPhone,isActive,activeDate,checkCode,modelId,userId,createtime,updateTime,d_LoginUserId,issub,vehicleId,partner,validateStatus,validateBy,validateNums,imei,soft_version,deviceId,source,networkCardNubmer,device_tip) VALUES
              ('8','15212270259','15212270259','460049736411356','89860477012171451356','1440773651356','1','2023-03-28 16:10:23','888888',NULL,'3314183','2023-01-09 14:40:17','2023-03-28 16:10:23','498','0','1048228',NULL,NULL,'0',NULL,'V1.0','15212270259','130040','1','1440773651356');

SELECT * FROM eshield_device WHERE id = 130029;        
SELECT * FROM eshield_device_classify WHERE id = 14; 

SELECT * FROM d_track_alarm_rec WHERE alarmType = 15;

SELECT dti.sn,dti.source 
       FROM d_vehicle dv,
       d_track_info dti,
       d_class dc
       WHERE dti.vehicleId = dv.vehicleId
       AND dc.classid = dv.classId
       AND dv.status = 0
       AND dc.vehicleGroupId IN (200);
      
 SELECT *FROM d_group  WHERE groupName = '先锋分组';  

SELECT * FROM d_device_login ddl WHERE sn = '93309190134';
SELECT * FROM d_vehicle dv WHERE dv.standno = 'LSJA16E33DG09579F';
SELECT dvi.insurance_company FROM d_vehicle_insurance dvi WHERE dvi.vehicleId = 805690;	
SELECT * FROM d_track_info dti WHERE dti.sn  = '1570917631'; 
SELECT * FROM t_track_stujudge_alarm ttsa WHERE ttsa.sn  = '96210200001'; 
SELECT * FROM t_track_stujudge_alarm ttsa WHERE ttsa.sn  = '93309190134'; 

SELECT * FROM d_track_info dti WHERE dti.sn  = '93210200002'; 
SELECT * FROM d_track_info dti WHERE dti.sn  = '93309190134'; 


SELECT * FROM t_track_stujudge_alarm tats WHERE poi_type = '非常停地';
UPDATE t_track_stujudge_alarm SET poi_type = '非常住地' WHERE poi_type = '非常停地';

SELECT * FROM d_vehicle_workorder;
ALTER TABLE d_vehicle_workorder ADD `addFlag` varchar(32) DEFAULT NULL COMMENT '平安工单加装单标志 1：是 0：否' AFTER tradeEntity;
ALTER TABLE d_vehicle_workorder ADD `threeCodeFlag` tinyint(2) DEFAULT 0 COMMENT '修改三码合一标志位 1：可修改 0：不可修改' AFTER addFlag;

SELECT * FROM d_device_login ddl WHERE ddl.sn = '96210200001'; 
SELECT * FROM d_vehicle_workorder WHERE workOrderId  = 829956;
-- PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1727242729546715136
-- PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1727242729546715136
-- PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1727242729546715136
SELECT * FROM d_vehicle_workorder_rep ORDER BY id DESC ;
SELECT * FROM d_vehicle_workorder_rep WHERE content LIKE '%泻停封2621%' ;
ALTER TABLE d_vehicle_workorder_rep modify `title` varchar(500) DEFAULT NULL;
SELECT * FROM d_vehicle_workorder dvw WHERE name = '泻停封2621';
SELECT *FROM d_app_image dai WHERE workOrderId = 829969;

update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+10)*1000
where TRIGGER_NAME = 'ghVehicleWorkOrderTrigger';

SELECT *  from `qrtz_cron_triggers` where trigger_name = 'ghVehicleWorkOrderTrigger';
SELECT *  from `qrtz_triggers` where trigger_name = 'ghVehicleWorkOrderTrigger';
SELECT *  from `qrtz_job_details` where job_name = 'ghVehicleWorkOrderTrigger';


SELECT  * FROM  d_vehicle_workorder dvw WHERE sqbh  = 'PASY-2023PAZL112408546-ZL-03-231124-002';
SELECT * FROM d_vehicle dv WHERE dv.workOrderId  = 829978;
SELECT * FROM d_track_info dti WHERE dti.vehicleId = 292764;

SELECT dv.standno , dti.sn , dti.source , dvw.sqbh  FROM 
d_vehicle_workorder dvw 
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
WHERE  dv.status = 0 AND dvw.status <> 2 AND dvw.sqbh  = 'PASY-2023PAZL112408546-ZL-03-231124-002';

CREATE TABLE d_track_alarm_rec_basic LIKE d_track_alarm_rec;
select * from d_track_alarm_rec_basic;

select
        *
        from d_track_alarm_rec_basic dtarb
        where
            dtarb.sn IN ('15212240560')
            AND alarmType = 1 
        order by dtarb.begintime desc limit 1;
       
select * from d_track_info dti WHERE sn = '93210200002';      
select * from d_track_info dti WHERE sn = '15212240560';      

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
        LEFT JOIN d_user du ON du.d_LoginUserId = ddf.operation_id
--         WHERE ddf.sn = '93210200002'
        ORDER BY ddf.create_time DESC;
       
SELECT * FROM  d_device_freq WHERE sn = '93210200002';   
SELECT *FROM d_user du WHERE du.d_LoginUserId = 3518;

SELECT * FROM d_track_info dti WHERE dti.sn = '2192801101'; 

SELECT * FROM d_vehicle_workorder dvw WHERE standno = 'LDP61B962MG873959'; 
SELECT * FROM t_track_stujudge_alarm ttsa WHERE sn = '1570921451';
SELECT * FROM d_alarm_second_data dase WHERE dase.sn = '1570921451';
SELECT * FROM t_track_stujudge_alarm ttsa WHERE poi_type IS NOT NULL;
SELECT * FROM d_track_alarm_rec dtar WHERE  sn = '1570921451';

SELECT * FROM d_track_alarm_rec dtar WHERE dtar.sn = '93306280602';
SELECT * FROM d_vehicle dv ;
SELECT dv.standno ,ttsa.sn,alarmNo,alarm_type ,geo_code,alarm_address ,begintime ,lasttime, poi_type  FROM t_track_stujudge_alarm ttsa 
LEFT JOIN d_track_info dti ON dti.sn = ttsa.sn 
LEFT JOIN d_vehicle dv ON dv.userId = dti.userId
WHERE dv.standno IS NOT NULL AND ttsa.poi_type IS NOT NULL 
LIMIT 100;

SELECT * FROM d_track_info WHERE sn IN ('76311307703','76311304655','76311307758');  
SELECT * FROM eshield_device WHERE id = 130940;
SELECT * FROM eshield_device WHERE id = 130943;

UPDATE d_track_info SET deviceId = 130069 WHERE sn IN ('76311307703','76311304655','76311307758');  

SELECT dvw.workOrderId,  count(dvw.workOrderId) num 
FROM d_vehicle_workorder dvw  
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514)
AND dv.status = 0
GROUP BY dvw.workOrderId HAVING num > 1;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 110152;

SELECT  dvw.workOrderId,dvw.classId,dvw.name,dvw.standno,dvw.userTel,dvw.userSex,dvw.brandid,dvw.shopContacts,dvw.contactsPhone,dvw.fix_time,dvw.status,dvw.lastLoginUserId,dvw.activeTime,
dvw.activeMan,dvw.sendStatus,dvw.area,dvw.shopName,dvw.color,dvw.carType,dvw.isDvd,dvw.creditPeriod,dvw.rent,dvw.address,dvw.`cycle`,dvw.ishandsel,dvw.branch,
dvw.sqbh,dvw.createtime,dvw.idnum,dvw.noticeUser,dvw.`engine`,
dvw.displacement,dvw.remark,dvw.importdate,dvw.description,dvw.carTypeName,dvw.createUserId,dvw.productType,dvw.province,dvw.city,dvw.orderType,dvw.creditLimit,dvw.installMethod,
dvw.pa,dvw.shop_addr,dvw.fix_area,dvw.fix_phone,dvw.source,dvw.no_source,dvw.record,dvw.areaId,dvw.dispatchEmail
FROM d_vehicle_workorder dvw  
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514)
AND dv.status = 0;

SELECT * FROM d_vehicle dv WHERE  dv.workOrderId IN (151467,180040,245785); 
SELECT * FROM d_track_info dti WHERE dti.sn = '2370716024'; 
SELECT * FROM eshield_device ed WHERE ed.id = 130029; 

select ti.trackerId as trackerId,ti.imei as imei,ti.sn as sn,ti.imsi as imsi,ti.checkCode as checkCode,ti.validateStatus as validateStatus,
          d.name as deviceHardwareName,d.classifyName as classNames, d.contractor as contractor,
          ti.soft_version as versionNumber, ti.iccid as iccid,ti.simPhone as simPhone,
          ti.networkCardNubmer as networkCardNubmer, ti.isActive as isActive,ti.activeDate as activeDate,
          ti.createTime as createTime,du.username as operator,ti.validateNums as validateNums from d_track_info ti
        INNER JOIN eshield_device d on ti.deviceId = d.id
        INNER JOIN d_user du ON ti.d_LoginUserId = du.d_LoginUserId
        where 1=1 AND ti.sn like '%2370716024%';

SELECT * FROM d_track_info WHERE  isActive = 0 AND source = 0;

SELECT * FROM d_track_alarm_rec_history; 
SELECT DISTINCT  fund  FROM d_vehicle_workorder dvw ; 

SELECT * FROM  d_track_info dti WHERE sn = '15211280320';
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 805996;
SELECT * FROM d_class dc WHERE classid = 88888968; 
SELECT * FROM d_user du WHERE d_LoginUserId = 3519; 


SELECT dti.sn
        FROM d_vehicle dv,
        d_track_info dti,
        d_class dc
        WHERE dti.vehicleId = dv.vehicleId
        AND dc.classid = dv.classId
        AND dv.status = 0
        AND dc.vehicleGroupId IN (79);

SELECT * FROM d_user_role dur WHERE dur.d_LoginUserId = 3519;       
SELECT * FROM  d_role_vehicle_group drvg WHERE drvg.roleId = 2983;

SELECT drvg.d_rvg_id,drvg.`type`,drvg.typeVal,drvg.roleId FROM d_user_role dur
LEFT JOIN d_role_vehicle_group drvg ON drvg.roleId = dur.roleId
LEFT JOIN d_role dr ON dr.roleId = dur.roleId
WHERE dr.status = 0 AND dur.d_LoginUserId = 3519;

SELECT dti.sn
        FROM d_vehicle dv,
        d_track_info dti,
        d_class dc
        WHERE dti.vehicleId = dv.vehicleId
        AND dc.classid = dv.classId
        AND dv.status = 0
        AND dc.vehicleGroupId IN (79);	 

SELECT drvg.d_rvg_id, drvg.`type`, drvg.typeVal, drvg.roleId
        FROM d_user_role dur
                 LEFT JOIN d_role_vehicle_group drvg ON drvg.roleId = dur.roleId
                 LEFT JOIN d_role dr ON dr.roleId = dur.roleId
        WHERE dr.status = 0
          AND dur.d_LoginUserId = '3519';
         
SELECT dti.sn
        FROM d_vehicle dv,
             d_track_info dti
        WHERE dti.vehicleId = dv.vehicleId
          AND dv.status = 0
          AND dv.classid IN (88889360,88889291); 
SELECT * FROM d_track_info dti WHERE dti.sn = '15211280320';   
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 805996;
SELECT * FROM d_class dc WHERE dc.classid = 88888968;
SELECT * FROM d_group dg WHERE dg.vehicleGroupId =  79;





