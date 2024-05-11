select distinct triggerType
from d_electric_fence_alarm;

select distinct electricFenceType
from d_electric_fence;

SELECT dti.sn,dv.standno,dvw.sqbh ,dc.className ,dg.groupName  
FROM d_vehicle dv 
LEFT JOIN d_track_info dti ON dti.vehicleId =  dv.vehicleId 
LEFT JOIN d_vehicle_workorder dvw ON dvw.workOrderId = dv.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
WHERE dv.status = 0 AND  LEFT(dti.sn,2) IN (96,93);

SELECT *FROM d_track_info dti WHERE LEFT(dti.sn,2) IN (96,93);
SELECT * FROM d_user a WHERE a.d_LoginUserId = 597;
SELECT * FROM d_user a WHERE a.username  = 'zlgj';

select * from d_vehicle_workorder dvw  where sqbh = 'PASY-2023PAZL110211196-ZL-01-230923-001';
UPDATE d_vehicle_workorder SET fix_time = '2023-10-25 00:00:00' WHERE workOrderId = 1032253;
select * from d_vehicle_workorder dvw  where dvw.orderType = 'PAZl' AND orderSource =2 ORDER BY createtime  desc;

select * from d_vehicle_workorder t where sqbh = #{workOrderNo} and status = 0 order by createtime desc limit 1

SELECT * FROM d_check_active_log dcal ;

ALTER TABLE d_check_active_log modify `sqbh` varchar(128) DEFAULT NULL COMMENT '工单号';
ALTER TABLE d_active_screen_url modify `sqbh` varchar(128) DEFAULT NULL COMMENT '申请单号';

select * from d_active_screen_url;
SELECT *FROM d_track_info dti WHERE iccid = '898604C01922C1288053';
SELECT *FROM d_track_info dti WHERE sn = '45301031003';
SELECT *FROM d_track_info dti WHERE iccid = '898604C01922C1288053';
SELECT * FROM d_feedback_param a WHERE  a.order_id = 1011232; 


INSERT INTO d_feedback_param (order_id,sqbh,vin,actual_install_address,actual_install_name,device_info,create_time) VALUES
(1011232,'PA3533069-2023ZLTJ100629672-ZL-01-0616131928381','LEFEDDE19PTP19499','黑龙江省哈尔滨市松北区G202','苏礼','[{"sn":"15210250646","installLocation":"主驾驶保险盒"},{"sn":"1621219780","installLocation":"后排真皮椅座下部"}]',NULL),
(1010582,'PA3526816-2023ZLTJ100627610-ZL-01-0613184111760','LS4ASE2E9PA271374','黑龙江省哈尔滨市松北区世文路','苏礼','[{"sn":"15210250560","installLocation":"机舱保险盒"},{"sn":"1621104983","installLocation":"后备箱盖内部"}]',NULL);

	
SELECT *FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PA3580820-2023PAZL101421650-ZL-01-0706163452456';
select * from d_vehicle_workorder t where sqbh = 'PA3580820-2023PAZL101421650-ZL-01-0706163452456' and status = 0 order by createtime desc limit 1;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LMGMB1S85P1017623';
SELECT *FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LVSH*********8361';
SELECT area ,areaId ,area_id ,address  FROM d_vehicle_workorder dvw WHERE dvw.orderType = 'gh'; 
SELECT *from d_vehicle dv WHERE dv.workOrderId = 1010674;
SELECT *FROM d_vehicle dv WHERE dv.standno = 'LMGMB1S85P1017623';
SELECT *FROM d_track_info dti WHERE dti.userId=3281008;
SELECT *from d_app_image dai WHERE dai.workOrderId = 1016624;

SELECT * FROM d_app_image dai  WHERE dai.workOrderId =LMGMB1S85P1017623; 
SELECT * FROM d_pingan_push_key_map dai  WHERE dai.workorder_id  =1016624; 

SELECT * FROM d_app_image dai  WHERE dai.workOrderId =1011232; 
SELECT * FROM d_app_image dai  WHERE dai.id = 1011232;
SELECT sysdate();
INSERT INTO d_app_image (workOrderId,standno,imageName,url,createTime,name) VALUES
(1011232,'LEFEDDE19PTP19499','三码合一.jpg','https://bhg.didihu.com.cn/group1/M00/07/55/wKgFDWSMIHqARWgXACrGpgiOyO8483.jpg',sysdate() ,'吕**'),
(1011232,'LEFEDDE19PTP19499','人车合影.jpg','https://bhg.didihu.com.cn/group1/M00/07/55/wKgFDWSMIMOALQ-pAANDqBiEM6Q402.jpg',sysdate() ,'吕**'),
(1011232,'LEFEDDE19PTP19499','门店照.jpg','https://bhg.didihu.com.cn/group1/M00/07/55/wKgFDWSMIJSAedVKAAUsOPjc4xo002.jpg',sysdate() ,'吕**'),
(1011232,'LEFEDDE19PTP19499','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/07/55/wKgFDWSMIIyAG2inAAUm_U9h2Os893.jpg',sysdate() ,'吕**'),
(1011232,'LEFEDDE19PTP19499','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/07/55/wKgFDWSMII-AXgdPAAWpbLiprSU048.jpg',sysdate() ,'吕**');


INSERT INTO d_app_image (workOrderId,standno,imageName,url,createTime,name) VALUES
(1010674,'LWLNKMVG3PL046378','三码合一.jpg','https://bhg.didihu.com.cn/group1/M00/07/1F/wKgFDWSJjs6Aa9atAAHWajsqdi0561.jpg',sysdate() ,'高*'),
(1010674,'LWLNKMVG3PL046378','人车合影.jpg','https://bhg.didihu.com.cn/group1/M00/07/1F/wKgFDWSJjtKAZHV-AAJjyQTKfNg647.jpg',sysdate() ,'高*'),
(1010674,'LWLNKMVG3PL046378','门店照.jpg','https://bhg.didihu.com.cn/group1/M00/07/1F/wKgFDWSJjtiAa1nHAANmKN9iKxs573.jpg',sysdate() ,'高*'),
(1010674,'LWLNKMVG3PL046378','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/07/1F/wKgFDWSJjt-ARyHKAAGh3qBvA2c735.jpg',sysdate() ,'高*'),
(1010674,'LWLNKMVG3PL046378','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/07/1F/wKgFDWSJjuOAPgmKAALzoeWJi2U121.jpg',sysdate() ,'高*');

UPDATE d_app_image SET imageName = '三码合一.jpg' WHERE id = '1655789';
UPDATE d_app_image SET imageName = '人车合影.jpg' WHERE id = '1655790';
UPDATE d_app_image SET imageName = '门店照.jpg' WHERE id = '1655791';
UPDATE d_app_image SET imageName = '安装位置照.jpg' WHERE id = '1655792';
UPDATE d_app_image SET imageName = '安装位置照.jpg' WHERE id = '1655793';

SELECT * FROM eshield_alarm ORDER BY	createTime desc;


SELECT * FROM d_class dc WHERE dc.className = '宁波弗浪科技有限公司-四川成都'; 
SELECT * FROM d_class dc WHERE dc.className LIKE  '%绍兴%' 

UPDATE d_vehicle SET classId = 9034;
SELECT * FROM  d_vehicle dv WHERE dv.standno IN (
'LFPHC7CC2M1B24055',
'LFPHC7CC6M1B29260',
'LFPHC7CC9M1B23775',
'LFPHC7CC3M1B25649',
'LFPHC7CC0M1B28766',
'LFPHC7CC9M1B24523',
'LFPHC7CC1M1B28002',
'LFPHC7CC2M1B24301',
'LFPHC7CC2M1B24895',
'LFPHC7CC6M1B23815',
'LFPHC7CC6M1B25273',
'LFPHC7CC5M1B26012',
'LFPHC7CC6M1B26388',
'LFPHC7CC3M1B25635',
'LFPHC7CCXM1B27866',
'LFPHC7CC3M1B25859',
'LFPHC7CC9M1B24070'
); 


UPDATE d_vehicle_workorder SET classId = 9034;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno IN (
'LFPHC7CC2M1B24055',
'LFPHC7CC6M1B29260',
'LFPHC7CC9M1B23775',
'LFPHC7CC3M1B25649',
'LFPHC7CC0M1B28766',
'LFPHC7CC9M1B24523',
'LFPHC7CC1M1B28002',
'LFPHC7CC2M1B24301',
'LFPHC7CC2M1B24895',
'LFPHC7CC6M1B23815',
'LFPHC7CC6M1B25273',
'LFPHC7CC5M1B26012',
'LFPHC7CC6M1B26388',
'LFPHC7CC3M1B25635',
'LFPHC7CCXM1B27866',
'LFPHC7CC3M1B25859',
'LFPHC7CC9M1B24070'
);

SELECT * FROM d_class dc WHERE dc.classid = 8518;
SELECT * FROM d_group dg WHERE dg.vehicleGroupId =402;  

select * from d_vehicle_log;
ALTER TABLE d_vehicle_log modify `operator` varchar(64) DEFAULT '' COMMENT '操作人';

SELECT * FROM d_track_info dti WHERE dti.sn = 15212260500;
SELECT *  FROM d_vehicle dv WHERE dv.vehicleId = 1050012;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 993146;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standnoHash = 'c68d320ebfa2d51f2975fac98afabf8d';


select * from d_device_import_log;
UPDATE d_pingan_push_key_map SET image_name = '人车合影.jpg' WHERE id = '85918';
UPDATE d_pingan_push_key_map SET image_name = '门店照.jpg' WHERE id = '85919';
UPDATE d_pingan_push_key_map SET image_name = '安装位置照.jpg' WHERE id = '85920';
UPDATE d_pingan_push_key_map SET image_name = '安装位置照.jpg' WHERE id = '85921';

select * from d_device_import_log;

select * from d_feedback_param where sqbh ='PASY-2024PAZL110256983-ZL-01-240129-001';
select * from d_feedback_param where device_info is null;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh ='PAGL-3436842-2023ZLTJ100595762-ZL-01-0505103456649';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh ='PAGL-3438753-2023ZLTJ100596244-ZL-01-050514551445';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno ='SALE*********3136' ;
SELECT * FROM d_pingan_push_key_map dppkm WHERE dppkm.workorder_id = 1016624;
SELECT * FROM d_pingan_push_key_map dppkm WHERE dppkm.workorder_id = 1003200;

SELECT * from d_app_image dai WHERE dai.workOrderId = 1000050;
SELECT * from d_app_image_delete daid WHERE daid.workOrderId = 999864;
SELECT * from d_app_image_delete daid WHERE daid.workOrderId = 1000050;
select *  from d_vehicle dv WHERE dv.standno = 'SALE*********3136';
select *  from d_vehicle dv WHERE dv.workOrderId =1000050;
SELECT *FROM d_app_image dai WHERE dai.business_id = 'APP-405c75ed97c943fb9a1a6cc5e71faec3.jpg';

select * from d_class dc WHERE dc.classid =8864;
select * from d_group dg WHERE dg.vehicleGroupId = 241;
select * from d_user du WHERE du.username = 'hebjpesc';

select  t.roleId,t.user_role_id, t.d_LoginUserId
    from d_user_role t ,d_role r  where t.roleId = r.roleId and r.status =0  and t.d_LoginUserId=4885;
select * from d_role_vehicle_group t where t.roleId=4354;
select * from d_vehicle dv WHERE dv.vehicleId  = 1052390;

SELECT * from d_vehicle_workorder dvw2 WHERE dvw2.workOrderId =998204;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PASY-2024PAZL110265404-ZL-01-240318-001'; 
SELECT * FROM d_app_image dai WHERE dai.workOrderId = 1012269;

UPDATE d_vehicle_workorder SET source = 1, no_source = 1 WHERE workOrderId = 1016624;

SELECT * from  t_track_stujudge_alarm t where t.alarm_type = 3 and t.delFlag = 2 order by t.id DESC;
SELECT * from  t_track_stujudge_alarm t where t.alarm_type = 4 and t.delFlag = 2 order by t.id DESC;

SELECT sysdate(); 

SELECT * FROM d_feedback_param WHERE order_id = 1071651 order by create_time desc;
UPDATE d_feedback_param SET 
INSERT INTO d_feedback_param (order_id,sqbh,vin,actual_install_address,actual_install_name,device_info,create_time) VALUES
	 (1071651,'PASY-2024PAZL110265404-ZL-01-240318-001','LXUX4C453R4051668','内蒙古自治区锡林郭勒盟锡林浩特市G16丹锡高速','乌兰察布市','[{"installLocation":"主驾驶保险盒","sn":"96312220354"},{"installLocation":"副驾驶保险盒","sn":"93312020553"}]',sysdate());


INSERT INTO d_app_image (workOrderId,standno,imageName,url,createTime,updateTime,remark,name) VALUES
	 (1012269,'LSGUL83L4LA079978','三码合一.jpg','https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTgOAOnW1AAV136LNtIA973.jpg',sysdate(),sysdate(),NULL,'石**'),
	 (1012269,'LSGUL83L4LA079978','人车合影.jpg','https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTg-ATYILAAagdyqVs60542.jpg',sysdate(),sysdate(),NULL,'石**'),
	 (1012269,'LSGUL83L4LA079978','门店照.jpg','https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRThSAbouiAAdn7i5SHZ8554.jpg',sysdate(),sysdate(),NULL,'石**'),
	 (1012269,'LSGUL83L4LA079978','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTieAYtQTAAZOeGtm3Gw314.jpg',sysdate(),sysdate(),NULL,'石**');

三码合一	https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTgOAOnW1AAV136LNtIA973.jpg
人车合影	https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTg-ATYILAAagdyqVs60542.jpg
门店照	https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRThSAbouiAAdn7i5SHZ8554.jpg
安装位置照	https://bhg.didihu.com.cn/group1/M00/07/CF/wKgFDWSRTieAYtQTAAZOeGtm3Gw314.jpg

update d_feedback_param set device_info = '[]' where device_info is null;

update sys_device_install_address_info sdiai left join d_feedback_param dfp on dfp.sqbh = sdiai.sqbh
    set dfp.device_info = sdiai.device_info where 1=1;

update d_feedback_param dfp left join sys_device_install_address_info sdiai on dfp.sqbh = sdiai.sqbh
    set dfp.device_info = sdiai.device_info where 1=1;

select *
from d_feedback_pa where status = 8;

SELECT * FROM d_track_alarm_rec_0331;
SELECT count(1)  FROM d_track_alarm_rec WHERE delflag = 0;


SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LVSHNCAHONH671156';

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PAGL-3436842-2023ZLTJ100595762-ZL-01-0505103456649';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PAGL-3438753-2023ZLTJ100596244-ZL-01-050514551445';
UPDATE d_vehicle_workorder SET sendStatus = 1 WHERE workOrderId = 1000017;
select * from d_vehicle_workorder dvw WHERE dvw.status = 0;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = '1102757433';

SELECT * FROM d_vehicle dv WHERE workOrderId  = 747155;

select * from d_feedback_pa;
ALTER TABLE d_feedback_pa modify `status` tinyint(2) DEFAULT NULL COMMENT '1:录入工单 2:工单改约 3:工单异常 4:申请关单 5:拒绝关单 6:更新工单 7:取消工单 8:编辑照片 9:工单激活反馈 10:重推 11:获取设备可复用天数 12:复核失败推送 13:中台核验失败推送';

SELECT * FROM d_track_info dti WHERE userId = '2606089';

SELECT * FROM d_feedback_param dfp WHERE dfp.order_id = 992068;

SELECT * FROM d_track_info dti WHERE dti.sn = '1670802939'; 

SELECT *FROM d_vehicle dv WHERE dv.userId  = 1088856;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno  = 'LVHGJ6624H6026643';

 
SELECT * FROM d_pingan_push_key_map;
SELECT dap.* FROM  d_app_image dap LEFT JOIN d_vehicle_workorder dvw ON dvw.workOrderId = dap.workOrderId  
WHERE dvw.orderType = 'PAZL' AND dap.business_id IS NOT NULL ;

INSERT INTO d_pingan_push_key_map (workorder_id	,image_name	,old_business_id,new_business_id,create_time)
SELECT dap.workOrderId ,dap.imageName ,dap.business_id ,dap.business_id ,sysdate()  
FROM  d_app_image dap 
LEFT JOIN d_vehicle_workorder dvw ON dvw.workOrderId = dap.workOrderId  
WHERE dvw.orderType = 'PAZL' AND dap.business_id IS NOT NULL ;

SELECT *FROM d_app_image_delete daid WHERE daid.workOrderId = 999864;
SELECT *FROM d_app_image dai WHERE dai.workOrderId = 1000050;
SELECT *FROM d_app_image dai WHERE dai.business_id = 'APP-c1923a6617ec4f3db93ae02f4d9a5a79.jpg';

SELECT * FROM d_vehicle_workorder WHERE sqbh = 'PASY-2023PAZL110152170-ZL-01-230509-001';
SELECT *FROM d_user tu WHERE tu.d_LoginUserId = 3164;

SELECT *  FROM d_vehicle_workorder WHERE sqbh like '%TBX%';

SELECT *FROM d_app_image dai WHERE workOrderId = 993505;

SELECT * FROM d_pingan_push_key_map WHERE workorder_id =993505 ;

ALTER TABLE d_vehicle_workorder modify `sqbh` varchar(64) DEFAULT NULL COMMENT '申请单号';

SELECT count(1) FROM d_vehicle_workorder;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'WBALS2103J0Z29373';

SELECT *  FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PASY-2023PAZL110155610-ZL-01-230517-001';
SELECT *  FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = '1106364000';
UPDATE d_vehicle_workorder SET sqbh = '1106369114',status = 1,classId = 8556,activeTime = '2023-05-15 19:46:28',activeMan = 4564 WHERE sqbh  = '1106364000';
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1002659;
-- SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1002917;
SELECT * FROM d_vehicle_insurance dvi WHERE dvi.standno  = '1GYS4DKJ5HR325318';

SELECT * FROM d_track_info dti WHERE dti.sn = 15212050976; 
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 1056564;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 1000050; 

SELECT * FROM d_track_info dti WHERE dti.sn = 1621228997; 
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 1056646; 
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 1000038;

SELECT * FROM d_app_image dai WHERE dai.workOrderId =  1000038;
SELECT count(*) FROM d_vehicle_workorder dvw WHERE orderType = 'PAZL';

select * from `qrtz_cron_triggers` where trigger_name = 'gqWindReportMonitorTrigger';
select * from `qrtz_cron_triggers` where trigger_name = 'deviceWithoutLocationMonitorForYXTrigger';
select * from `qrtz_cron_triggers` where trigger_name = 'gqVehicleOfflineTrigger';


select * from d_track_info dti WHERE dti.isActive = 0 AND dti.sn IN (
'1621116453',
'1621128263'
);

select * from d_track_info dti WHERE  dti.sn IN (
'21409208744'
);

select * from d_track_info dti WHERE  dti.iccid  IN (
'89860484012080692602',
'89860484012080850949'
);

SELECT * FROM d_track_info dti WHERE dti.imei IN (
'17205280461',
'17201050358'
);	

SELECT *FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LMGMB1S85P1017623';



{"appendSqlWithCondition":" and temp.vehicleId = t.vehicleId ",
"appendSqlWithTable":" ,( SELECT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid LEFT JOIN d_group dgroup ON dclass.vehicleGroupId = dgroup.vehicleGroupId WHERE dgroup.vehicleGroupId IN ( 1,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,33,34,35,36,37,38,39,40,41,43,44,46,47,48,49,50,51,52,53,54,55,56,57,59,60,61,62,63,64,66,67,68,69,70,72,73,74,75,77,78,80,81,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,125,127,128,129,130,131,132,133,134,135,136,138,140,142,143,144,145,146,147,148,149,150,151,152,153,154,157,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,204,205,206,207,208,209,210,211,212,213,214,215,216,217,220,221,222,224,226,227,228,229,230,232,233,234,235,236,237,238,239,240,241,242,243,244,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,291,292,293,294,295,296,297,298,299,300,301,303,304,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,347,348,502 )  UNION  SELECT DISTINCT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid WHERE dclass.classid IN (32 )   ) temp  ",
"isUse":0,"offlineTime":259200,"sourceType":0,"status":4,"validateStatus":0,"workOrderNo":"PAGL-3372882-2023ZLTJ100571492-ZL-01-0404131257303"}


SELECT t.trackerId as id,w.shopName as shopName, w.shopContacts, w.contactsPhone, w.sqbh as workOrderNo, v.name as name,v.standno as standNo,
        t.sn as sn,date_format(v.buyDate,'%Y-%m-%d %T')  as activeDate,u.userRemark as operator,l.lastRtTrack as lastRtTrack,
        l.lastGprsTime as lastGprsTime,l.speed as speed,
        t.source as source,(CASE t.source WHEN 1 THEN '有线' WHEN 0 THEN '无线' ELSE '' END) AS sourceType,
        vd.car_remark as carRemarkType,vd.car_used_type as carUsedType,vd.car_used as carUsed,
        (SELECT temp.status  FROM d_device_freq temp  where temp.vehicle_id = v.vehicleId  and temp.sn = t.sn  order by temp.create_time desc  limit 1) AS freqStatus,
        v.vehicleId,
        dvr.vehicle_icon as vehicleIcon,
        dvr.user_remark as userRemark
        from d_track_info t
        LEFT OUTER JOIN  d_vehicle v ON  v.vehicleId=t.vehicleId
        LEFT OUTER JOIN d_vehicle_remark dvr on dvr.vehicle_id = v.vehicleId
        LEFT OUTER JOIN d_vehicle_workorder w ON v.workOrderId=w.workOrderId
        LEFT OUTER JOIN d_class c ON v.classId=c.classid
        LEFT OUTER JOIN d_user u ON v.lastLoginUserId=u.d_LoginUserId
        LEFT OUTER JOIN d_device_login l ON t.sn=l.sn
        LEFT OUTER JOIN d_vehicle_detail vd ON vd.standno=v.standno
         ,( SELECT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid 
         LEFT JOIN d_group dgroup ON dclass.vehicleGroupId = dgroup.vehicleGroupId 
         WHERE dgroup.vehicleGroupId IN ( 1,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,33,34,35,36,37,38,39,40,41,43,44,46,47,48,49,50,51,52,53,54,55,56,57,59,60,61,62,63,64,66,67,68,69,70,72,73,74,75,77,78,80,81,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,125,127,128,129,130,131,132,133,134,135,136,138,140,142,143,144,145,146,147,148,149,150,151,152,153,154,157,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,204,205,206,207,208,209,210,211,212,213,214,215,216,217,220,221,222,224,226,227,228,229,230,232,233,234,235,236,237,238,239,240,241,242,243,244,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,291,292,293,294,295,296,297,298,299,300,301,303,304,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,347,348,502 ,402)  
         UNION  SELECT DISTINCT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid WHERE dclass.classid IN (32 )   ) temp
        WHERE t.isActive=1 and t.vehicleId is not null and v.status = 0
        and temp.vehicleId = t.vehicleId
        and w.sqbh like 'PAGL-3372882-2023ZLTJ100571492-ZL-01-0404131257303'
        order by temp.vehicleId DESC;
       
SELECT * FROM d_class dc WHERE dc.className LIKE  '%中豫融资%';  
SELECT * FROM d_class dc WHERE dc.classid = 8681;  
SELECT * FROM d_vehicle dv WHERE dv.classId = 8593;
SELECT * FROM d_vehicle dv WHERE dv.standno  = 'LHGTG2827M8073499';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PAGL-3425429-2023ZLTJ100591570-ZL-01-0428140052539';
SELECT * FROM d_group dg WHERE dg.vehicleGroupId = 457;
SELECT * FROM d_group dg ;
SELECT * FROM d_class dc WHERE dc.classid = 8688; 
SELECT * FROM d_vehicle dv WHERE dv.classId = 8688;

SELECT * FROM d_user du WHERE du.d_LoginUserId = 4494;
SELECT *FROM d_vehicle dv WHERE dv.standno = 'SALWA2KF8GA651328';
SELECT *FROM d_vehicle_workorder dvw WHERE dvw.standno  = 'LE4WG7HB3LL639555';
SELECT * FROM d_vehicle_insurance dvi WHERE dvi.standno = 'LSVDH2BM1JN135981'; 
       
-- UPDATE d_vehicle_workorder SET sqbh  = '1106413806' WHERE sqbh = '1106407809';
SELECT *  FROM d_vehicle_workorder dvw  WHERE dvw.sqbh = '1106571034';
SELECT *  FROM d_vehicle_workorder dvw  WHERE dvw.sqbh = '1106413806';

SELECT * FROM d_track_info dti WHERE dti.userId  IN ('3381977','3372402'); 

SELECT DISTINCT sqbh  FROM d_vehicle_workorder dvw WHERE orderType = 'pazl';

UPDATE d_vehicle_workorder SET name = '邹华涛' WHERE workOrderId = 1003355;
UPDATE d_vehicle SET name = '邹华涛' WHERE vehicleId = 1060071;
UPDATE d_vehicle SET name = '王伟' WHERE vehicleId = 1003355;
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 1003355;

SELECT * FROM  d_role_insurance;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.orderType = 'gh';

SELECT DISTINCT  creditPeriod  FROM d_vehicle_workorder dvw WHERE dvw.orderType = 'pazl' GROUP BY dvw.creditPeriod ;

SELECT dvw.creditPeriod,count(1) AS num  
FROM d_vehicle_workorder dvw 
left JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
WHERE dvw.orderType = 'gh'  GROUP BY dvw.creditPeriod ;

SELECT dvw.creditPeriod FROM d_vehicle_workorder dvw GROUP BY dvw.creditPeriod ;

SELECT a.workOrderId
FROM `d_vehicle` a,
     `d_class` b
WHERE a.`classId` = b.`classid`
  AND b.`vehicleGroupId` IN (253, 327, 328, 329, 331, 115)
  AND a.`status` = 0
order by a.vehicleId desc;

SELECT creditPeriod  FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 904102;

SELECT LEFT(dvw.activeTime,7) ,count(dti.sn) AS num  
FROM d_vehicle_workorder dvw 
left JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
WHERE dvw.orderType NOT IN ('gh','pazl') AND LEFT(dvw.activeTime,7) >= '2022-11' AND LEFT(dvw.activeTime,7) <= '2023-04'
GROUP BY LEFT(dvw.activeTime,7) ;

SELECT *FROM d_feedback_pa;

SELECT * from `qrtz_cron_triggers` where trigger_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2',
'waitAssignNoticePushTrigger',
'overdueNoticePushTrigger'
);

SELECT * from `qrtz_triggers` where trigger_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2'
);

SELECT * from `qrtz_job_details` where job_name in (
'gqWindReportMonitorTrigger',
'deviceWithoutLocationMonitorForYXTrigger',
'effectiveTestDriveReportMonitorTrigger',
'jysendBasestationTaskTrigger',
'gqVehicleOfflineTrigger',
'fiveDaysWithoutLocationTrigger2'
);

SELECT * from `qrtz_cron_triggers` where trigger_name in (
'deviceSeparateAlarmTrigger',
'outProvinceBasisTrigger',
'outProvinceAlarmTrigger',
'waitAssignNoticePushTrigger',
'overdueNoticePushTrigger'
);

SELECT * from `qrtz_triggers` where trigger_name in (
'deviceSeparateAlarmTrigger',
'outProvinceBasisTrigger',
'outProvinceAlarmTrigger',
'waitAssignNoticePushTrigger',
'overdueNoticePushTrigger'
);

SELECT * from `qrtz_job_details` where job_name in (
'deviceSeparateAlarmTrigger',
'outProvinceBasisTrigger',
'outProvinceAlarmTrigger',
'waitAssignNoticePushTrigger',
'overdueNoticePushTrigger'
);

delete from `qrtz_cron_triggers` where trigger_name = 'waitAssignNoticePushTrigger';
delete from `qrtz_triggers` where trigger_name = 'waitAssignNoticePushTrigger';
delete from `qrtz_job_details` where job_name = 'waitAssignNoticePushTrigger';

delete from `qrtz_cron_triggers` where trigger_name = 'overdueNoticePushTrigger';
delete from `qrtz_triggers` where trigger_name = 'overdueNoticePushTrigger';
delete from `qrtz_job_details` where job_name = 'overdueNoticePushTrigger';

 
UPDATE qrtz_cron_triggers SET `CRON_EXPRESSION` = '21 10 1 * * ?' WHERE	 TRIGGER_NAME = 'deviceSeparateAlarmTrigger';
UPDATE qrtz_cron_triggers SET `CRON_EXPRESSION` = '22 40 1 * * ?' WHERE	 TRIGGER_NAME = 'outProvinceBasisTrigger';
UPDATE qrtz_cron_triggers SET `CRON_EXPRESSION` = '45 33 3 * * ?' WHERE	 TRIGGER_NAME = 'outProvinceAlarmTrigger';

update qrtz_triggers set NEXT_FIRE_TIME = 1689354621000 where TRIGGER_NAME = 'deviceSeparateAlarmTrigger';
update qrtz_triggers set NEXT_FIRE_TIME = 1689356422000 where TRIGGER_NAME = 'outProvinceBasisTrigger';
update qrtz_triggers set NEXT_FIRE_TIME = 1689363225000 where TRIGGER_NAME = 'outProvinceAlarmTrigger';


SELECT *FROM eshield_device_alarm;
SELECT *FROM eshield_device_out_province_basis;
SELECT *FROM eshield_device_alarm_rule;
SELECT *FROM eshield_device_alarm;
select * from t_track_stujudge_alarm WHERE alarm_type = 3 AND delflag =1 AND poi_type IS not NULL  ;

SELECT *FROM d_vehicle_workorder dvw 
where dvw.orderType = 'GQ' and dvw.province is not null and dvw.province != '' 
and dvw.city is not null and dvw.city != '' and dvw.classId is not null and dvw.status = 1 
group by dvw.classId ;

SELECT dv.* FROM d_vehicle_workorder dvw LEFT JOIN  d_vehicle dv ON dv.workOrderId = dvw.workOrderId 
WHERE dvw.orderType = 'GQ' and dvw.province is not null and dvw.province != '' 
and dvw.city is not null and dvw.city != '' and dvw.classId is not null and dvw.status = 1 ;

SELECT LEFT(a.create_time,10), count(1) AS num FROM eshield_device_out_province_basis a
LEFT JOIN d_vehicle_workorder dvw ON dvw.standno = a.standno 
LEFT JOIN  d_vehicle dv ON dv.workOrderId = dvw.workOrderId 
WHERE dvw.orderType = 'GQ' and dvw.province is not null and dvw.province != '' 
and dvw.city is not null and dvw.city != '' and dvw.classId is not null and dvw.status = 1
GROUP BY LEFT(a.create_time,10); 

select dmt.sn from d_monitor_track dmt where dmt.use_status = 0 and dmt.company_mark =2;
SELECT LEFT(create_time,10),count(1)  FROM eshield_device_alarm Group BY	LEFT(create_time,10);	

SELECT * FROM d_gps_config WHERE typeNo = 'email';

SELECT * FROM d_class dc WHERE dc.classid = 90;

SELECT * FROM d_vehicle_insurance dvi WHERE insuranceNo IS NULL ;
SELECT * FROM d_vehicle_insurance dvi WHERE full_insurance_no IS NULL ;
SELECT * FROM d_vehicle_insurance dvi WHERE endTime IS NULL ;
SELECT * FROM d_vehicle_insurance dvi WHERE status IN (1,2) AND insuranceNo IS NULL ;
SELECT insuranceNo,full_insurance_no FROM d_vehicle_insurance dvi ;
SELECT insuranceNo,full_insurance_no ,vehicleId FROM d_vehicle_insurance dvi WHERE dvi.status IN (1,3);
SELECT * FROM d_vehicle_workorder dvw ; 
SELECT * FROM d_vehicle dv ;

SELECT * FROM  d_vehicle_brand_type;
SELECT * FROM  d_vehicle_brand;
SELECT * FROM  d_user du ;

SELECT dvi.full_insurance_no AS contractNo,
       dvi.createTime  AS successDate,
       dg.groupName  AS merchantName,
       dvi.name AS customerName,
       dvi.mobile AS customerPhone,
       dv.status AS orderStatus,
       dvi.endTime AS endTime,
       dvi.takeEffectTime  AS effectiveDate,
       dvi.standno AS vin,
--        dvi.vehicleBrand AS vehicleBrandName,
       ifnull(dvg.brandName,dvi.vehicleBrand) AS vehicleBrandName,
--        dvi.vehicleType AS vehicleSeriesName, 
       ifnull(dvbt.vehicleTypeName,dvi.vehicleType) AS vehicleSeriesName, 
       dvi.id AS sourceId,
       dvi.updateTime AS updateTime,
       du.userRemark AS updatedBy
FROM d_vehicle_insurance dvi LEFT JOIN	d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_vehicle_brand dvg ON dvg.brandId = dvi.vehicleBrand  
LEFT JOIN d_vehicle_brand_type dvbt ON dvbt.vehicleTypeId = dvi.vehicleType
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId 
WHERE dvi.status IN (1,3) AND 
(DATE_FORMAT(dvi.createTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d') 
OR DATE_FORMAT(dvi.updateTime, '%Y-%m-%d')= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d')
);

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
WHERE dvi.status IN (1,3);

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
AND (DATE_FORMAT(dvi.createTime, '%Y-%m-%d') = DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d') 
OR DATE_FORMAT(dvi.updateTime, '%Y-%m-%d') = DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 DAY), '%Y-%m-%d')
)
GROUP BY dv.vehicleId ;


SELECT dvi.full_insurance_no AS contractNo, 
DATE_FORMAT(dvi.createTime,'%Y-%m-%d %H:%i:%s')  AS successDate, 
dg.groupName  AS merchantName,
dvi.name AS customerName,
dvi.mobile AS customerPhone,
dvi.status AS status,
DATE_FORMAT(dvi.endTime,'%Y-%m-%d %H:%i:%s') AS endTime,
DATE_FORMAT(dvi.takeEffectTime,'%Y-%m-%d %H:%i:%s')  AS effectiveDate,
dvi.standno AS vin,
IFNULL(dvg.brandName,dvi.vehicleBrand) AS vehicleBrandName,
IFNULL(dvbt.vehicleTypeName,dvi.vehicleType) AS vehicleSeriesName,
dvi.id AS sourceId,
DATE_FORMAT(dvi.updateTime,'%Y-%m-%d %H:%i:%s') AS updateTime,
du.userRemark AS updatedBy,
GROUP_CONCAT(dti.sn) AS sns 
FROM d_vehicle_insurance dvi LEFT JOIN d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_vehicle_brand dvg ON dvg.brandId = dvi.vehicleBrand 
LEFT JOIN d_vehicle_brand_type dvbt ON dvbt.vehicleTypeId = dvi.vehicleType 
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId  
WHERE dvi.status IN (1,3) AND 
(DATE_FORMAT(dvi.createTime, '%Y-%m-%d')= '2023-08-21' 
OR DATE_FORMAT(dvi.updateTime, '%Y-%m-%d')= '2023-08-21' 
) GROUP BY dv.vehicleId ;

SELECT  dv.vehicleId,count(1) AS num 
FROM d_vehicle_insurance dvi LEFT JOIN	d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_vehicle_brand dvg ON dvg.brandId = dvi.vehicleBrand  
LEFT JOIN d_vehicle_brand_type dvbt ON dvbt.vehicleTypeId = dvi.vehicleType
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId
WHERE dvi.status IN (1,3) GROUP BY dv.vehicleId HAVING num > 1;

SELECT  dv.vehicleId,dvi.*
FROM d_vehicle_insurance dvi LEFT JOIN	d_vehicle dv ON dv.vehicleId  = dvi.vehicleId 
LEFT JOIN d_track_info dti ON dti.vehicleId = dv.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId 
LEFT JOIN d_vehicle_brand dvg ON dvg.brandId = dvi.vehicleBrand  
LEFT JOIN d_vehicle_brand_type dvbt ON dvbt.vehicleTypeId = dvi.vehicleType
LEFT JOIN d_user du ON du.d_LoginUserId = dv.createUserId
WHERE dvi.status IN (1,3) AND dvi.vehicleId = 588547;

SELECT dti.sn,dc.className 
       FROM d_vehicle dv,
       d_track_info dti,
       d_class dc
       WHERE dti.vehicleId = dv.vehicleId
       AND dc.classid = dv.classId
       AND dv.status = 0
       AND dc.vehicleGroupId IN (402);
       
SELECT * FROM d_track_alarm_rec dtar	;  

SELECT *  from `qrtz_cron_triggers` where trigger_name = 'zLGpsDailyMonitorTrigger';
SELECT *  from `qrtz_triggers` where trigger_name = 'zLGpsDailyMonitorTrigger';
SELECT *  from `qrtz_job_details` where job_name = 'zLGpsDailyMonitorTrigger';


SELECT * FROM  d_vehicle_workorder dvw WHERE dvw.sqbh = 'PASY-2023PAZL110196007-ZL-01-230831-001';
SELECT * FROM d_pingan_push_key_map WHERE workorder_id =1020907 ;
SELECT * FROM d_feedback_param WHERE order_id  =1020907 ;


SELECT dvw.sqbh ,dvw.standno ,dvw.createtime  FROM d_vehicle_workorder dvw 
LEFT JOIN  d_vehicle dv ON dv.workOrderId = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
WHERE dvw.status = 1 AND dv.status = 0
AND dc.vehicleGroupId  = 402 AND dvw.createtime > '2023-05-01';


update qrtz_triggers
set NEXT_FIRE_TIME = (unix_timestamp()+30)*1000
where TRIGGER_NAME = 'zLGpsDailyMonitorTrigger';

SELECT * FROM d_track_info dti WHERE dti.sn IN (	
SELECT dti.sn
       FROM d_vehicle dv,
       d_track_info dti,
       d_class dc
       WHERE dti.vehicleId = dv.vehicleId
       AND dc.classid = dv.classId
       AND dv.status = 0
       AND dc.vehicleGroupId IN (402));

select edc.name
        from eshield_device ed
                 inner join eshield_device_classify edc on ed.classifyId = edc.id
        where ed.id = #{deviceId} limit 0,1;
        
SELECT * FROM eshield_device;        
SELECT * FROM eshield_device_classify;        


SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = 'PASY-2023PAZL110211846-ZL-01-231007-003';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno  = 'LSV2L8CA6LN549399';
SELECT * FROM d_vehicle dv WHERE dv.standno  = 'LSV2L8CA6LN549399';
SELECT * FROM d_vehicle_insurance dvi WHERE dvi.standno  = 'LSV2L8CA6LN549399';
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1033565;
SELECT * FROM d_track_info dti WHERE dti.vehicleId = 1089411;

UPDATE d_vehicle_workorder set sqbh = '1106387479' WHERE workOrderId  = 1004715;
SELECT DISTINCT fix_phone,install_name FROM d_vehicle_workorder dvw WHERE install_name IS NOT NULL OR install_name <> '';

SELECT * FROM d_app_image dai WHERE dai.workOrderId = 1024163;

SELECT * FROM d_pingan_push_key_map WHERE workorder_id =1024163;

SELECT * FROM 

UPDATE d_app_image SET business_id = NULL WHERE id = 129143;
UPDATE d_app_image SET business_id = 'APP-d952cdf4b4a841c9b7adf0ec334bb3f7.jpg' WHERE id = 1728131;

SELECT * FROM d_app_image daj WHERE id = 129143;

SELECT *FROM d_vehicle_workorder_rep WHERE content LIKE '%WP1AG2921DLA61358%';	
UPDATE d_vehicle_workorder_rep SET status = 0 WHERE	id= 5468;



SELECT * FROM t_track_stujudge_alarm WHERE poi_type = '非常停地';  
SELECT * FROM t_track_stujudge_alarm WHERE poi_type = '非长停地';  

SELECT *FROM d_vehicle dv WHERE dv.standno = 'S65XCD-322';
SELECT *FROM d_vehicle_workorder dvw WHERE dvw.standno = 'S65XCD-322';

SELECT * FROM d_track_info dti WHERE dti.sn = '15307080686';
SELECT * FROM d_track_info dti WHERE dti.userId  = 3157659;

UPDATE d_vehicle SET userId = 2816046 WHERE vehicleId = 896614;	
SELECT * FROM d_user du WHERE du.username = 'LTZL';
select * from d_use_log;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LA9BBJBR2LCLM6745'; 
SELECT * FROM d_vehicle dv WHERE dv.standno = 'LA9BBJBR2LCLM6745'; 

UPDATE d_track_info SET isActive = 1 ,activeDate = '2023-08-20 09:06:06', vehicleId = 1083212 WHERE trackerId = 2571606;
select * from t_poi_fence;

SELECT * FROM d_group dg WHERE dg.groupName LIKE '%宁波%'; 

SELECT * FROM d_track_info WHERE isActive = 0 ;

SELECT * FROM d_track_alarm_rec dtar WHERE sn  = '15212080903';

SELECT * FROM sys_device_install_address_info WHERE sqbh = 'PASY-2023PAZL110211846-ZL-01-231007-003'; 
SELECT * FROM d_feedback_param WHERE sqbh = 'PALS-2024ZLTJ100820065-ZL-01-240318-001-001'; 
UPDATE d_feedback_param SET vin = 'LNXAEG082PR704854' WHERE	 id IN (41312) ;
UPDATE d_feedback_param SET vin = 'LNXAEG082PR704854' WHERE	 id IN (41312) ;
SELECT * FROM d_vehicle_workorder dvw WHERE sqbh = '1107139703'; 
SELECT * FROM d_vehicle_workorder dvw WHERE standno = 'LVUDB21B0MB362387' AND sqbh = '1107173449'; 
UPDATE d_vehicle_workorder SET sqbh = '1107173449' WHERE workOrderId  = 1061206;
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1033565;
SELECT * FROM d_track_info dti WHERE dti.vehicleId = 1089411;
SELECT * FROM d_track_info dti WHERE dti.sn = '93312020198';

INSERT INTO sys_device_install_address_info (sqbh,device_info,create_time) VALUES
	 ('PASY-2023PAZL110211846-ZL-01-231007-003','[{"sn":"15212060568","installLocation":"主驾驶保险盒"},{"sn":"1621230955","installLocation":"后排真皮椅座下部"}]',sysdate());


INSERT INTO d_feedback_param (order_id,sqbh,vin,actual_install_address,actual_install_name,device_info,create_time) VALUES
	 (1071665,'PALS-2024ZLTJ100820065-ZL-01-240318-001-001','LVGDBC6Y0PG014411','吉林省长春市宽城区市场二路','长春凯旋鑫师傅','[{"installLocation":"主驾驶保险盒","sn":"15212200684"},{"installLocation":"后备箱刹车灯附近","sn":"1630709230"}]',sysdate());


SELECT * FROM d_track_info WHERE isActive = 0 and  sn IN (
'87205090220',
'87305250010',
'87305250016',
'87305250023',
'87305250028',
'87305250015',
'87305250022',
'87208110296',
'87305250011',
'87205090219',
'87305250027',
'87305250030',
'87305250017',
'87305250024',
'87208120284',
'87212210595',
'87212210593',
'87212210570',
'87212210585',
'87212210597',
'87212210576',
'87212210594',
'87212210591',
'87212210592',
'87212210590',
'87212210557',
'87212210587',
'87212210565',
'87212210588',
'87212210598',
'87212210600',
'87212210578',
'87212210567',
'87212210577',
'87212210568',
'87212210569',
'87212210572',
'87212210566',
'87212210549',
'87212210560',
'87212210582',
'87212210580',
'87212210556',
'87212210555',
'87212210554',
'87212210562',
'87212210546',
'87212210571',
'87212210548',
'87212210547',
'87212210573',
'87212210535',
'87212210541',
'87212210540',
'87212210552',
'87212210559',
'87212210558',
'87212210550',
'87212210551',
'87212210561',
'87212210544',
'87212210584',
'87212210543',
'87212210542',
'87212210574',
'87212210545',
'87212210514',
'87212210506',
'87212210530',
'87212210513',
'87212210511',
'87212210505',
'87212210512',
'87212210504',
'87212210518',
'87212210509',
'87212210502',
'87212210503',
'87212210501',
'87212210528',
'87212210510',
'87212210529',
'87212210516',
'87212210538',
'87212210539',
'87212210536',
'87212210537',
'87212210534',
'87212210507',
'87212210523',
'87212210524',
'87212210525',
'87212210521',
'87212210508',
'87212210533',
'87212210532',
'87212210531',
'87212210519',
'87212210526',
'87212210522',
'87212210527',
'87212210517',
'87212210515',
'87212210520',
'17301140091',
'17301140099',
'17301140001',
'17301140084',
'17301140020',
'17301140019',
'17301140040',
'17301140041',
'17301140000',
'17301140073',
'17301140070',
'17301140086',
'17301140027',
'17301140030',
'17301140078',
'17301140002',
'17301140004',
'17301140098',
'17301140088',
'17301140082',
'17301140085',
'17301140075',
'17301140094',
'17301140093',
'17301140080',
'17301140095',
'17301140097',
'17301140090',
'17301140079',
'17301140077',
'17301140076',
'17301140074',
'17301140092',
'17301140072',
'17301140017',
'17301140045',
'17301140089',
'17301140036',
'17301140037',
'17301140049',
'17301140087',
'17301140083',
'17301140025',
'17301140018',
'17301140026',
'17301140034',
'17301140081',
'17301140048',
'17301140031',
'17301140015',
'17301140028',
'17301140014',
'17301140038',
'17301140009',
'17301140023',
'17301140011',
'17301140021',
'17301140013',
'17301140010',
'17301140029',
'17301140024',
'17301140046',
'17301140032',
'17301140005',
'17301140047',
'17301140012',
'17301140042',
'17301140008',
'17301140022',
'17301140043',
'17301140003',
'17301140007',
'17301140044',
'17301140035',
'17301140006',
'17301140016',
'1621218183',
'1621218167',
'1621218182',
'1621218171',
'1621218170',
'1621218169',
'1621218165',
'1621128258',
'1621128249',
'1621128260',
'1621128233',
'1621128232',
'1621218172',
'1621218168',
'1621218184',
'1621105755',
'1621105759',
'1621218097',
'1621218099',
'1621218087',
'1621218091',
'1621218092',
'1621218094',
'1621218095',
'1621128329',
'1621128330',
'1621128327',
'87303100711',
'87303100715',
'87303100705',
'87303100719',
'87303100724',
'87303100710',
'87303100713',
'87303100718',
'87303100717',
'87303100712',
'87209150084',
'87303100708',
'87202200300',
'87303100702',
'87303100714',
'87209150055',
'87209150063',
'87303100707',
'87209150061',
'87209150080',
'96310070028',
'1621225057',
'1630106765',
'1621225022',
'1630106627',
'1630106702',
'1630106809',
'1630106837',
'87202200335',
'1621115734',
'1621115739',
'1621115735',
'1621116460',
'1611222910',
'45304130645',
'45304130646',
'45304130652',
'45304130647',
'45304130648',
'45304130654',
'45304130653',
'1621128084',
'1621128083',
'1621116449',
'1621128079',
'1621116446',
'1621116448',
'1621116444',
'1621128082',
'1621128086',
'1620804398',
'1620925219',
'1620804397',
'1621116439',
'1620830280',
'1620925698',
'1620925694',
'1620925696',
'1620831088',
'1621013236',
'1621128275',
'1621226469',
'1621226466',
'1621226476',
'1621226477',
'1621226478',
'45304130651',
'45212101606',
'1621209530',
'1621209532',
'1620705965',
'1620804949',
'1621209529',
'1630107522',
'1630106895',
'1630107528',
'15205160074',
'15205160073',
'15205160080',
'15205160079',
'15205160072',
'15205160071',
'15205160077',
'15205160076',
'15205160078',
'15205160075',
'15205160088',
'15205160087',
'15205160089',
'15205160086',
'15205160085',
'15205160084',
'15205160083',
'15205160082',
'15205160081',
'15205160090',
'15205160095',
'15205160094',
'15205160093',
'15205160092',
'15205160100',
'15205160099',
'15205160091',
'15205160098',
'15205160097',
'15205160096',
'17307310770',
'17307310773',
'17307310778',
'17307310776',
'17307310765',
'17307310777',
'17307310775',
'17307310780',
'17307310774',
'17307310763',
'17307310771',
'17307310767',
'17307310768',
'17307310766',
'17307310764',
'17307310779',
'17307310772',
'17307310781',
'17307310769',
'1621128463',
'1621128469',
'1621128459',
'1621128458',
'1621128462',
'1621128468',
'1621128467',
'1621128461',
'1621128466',
'1621128460',
'15205160067',
'15205160068',
'15205160066',
'15205160065',
'15212050582',
'15205160070',
'15212050581',
'15205160069',
'15212050580',
'15205160051',
'15301070771',
'15212050597',
'15301070769',
'15212050596',
'15301070770',
'15212050593',
'15205160061',
'15212050595',
'15205160054',
'15205160064',
'15301070774',
'15205160062',
'15212050594',
'15301060206',
'15301070777',
'15301070772',
'15205160055',
'15301070775',
'15301070776',
'15301070773',
'15301060202',
'15301060207',
'15301070782',
'15205160063',
'15205160060',
'15301070780',
'15212050599',
'15212050598',
'15301060203',
'15301060205',
'15301070768',
'15301070797',
'15301060213',
'15212050588',
'15301070767',
'15301070781',
'15301060204',
'15301070798',
'15301060208',
'15301070783',
'15301060214',
'15212050589',
'15212050590',
'15205160058',
'15301070790',
'15301070789',
'15301070785',
'15301070787',
'15301070788',
'15301070784',
'15301070786',
'15301060212',
'15301060211',
'15301060210',
'15301070792',
'15301070791',
'15301070800',
'15301070799',
'15212050592',
'15301070779',
'15212050591',
'15301070778',
'15301070793',
'15301070794',
'15301070795',
'15205160056',
'15205160057',
'15301060216',
'15301060215',
'15301070796',
'15301060209',
'87205150365',
'87205150378',
'87205150364',
'87205150377',
'87205150362',
'87205150376',
'87205150375',
'87205150379',
'87205150369',
'87205150371',
'87205150363',
'87201120965',
'87205150373',
'87205150372',
'87205150366',
'87205150374',
'87205150368',
'87203090175',
'87203090176',
'87203090172',
'87203090174',
'87203090173',
'86106290459',
'86106290471',
'86106290092',
'86106290477',
'86106290138',
'86106290103',
'45211200002',
'93309190133',
'1630107981',
'1630107953',
'15212170027',
'15209030267',
'1621116408',
'1621116412',
'1621116405',
'1621116404',
'17303280732',
'17303280719',
'17303280734',
'17303280725',
'87209150062',
'87209150025',
'87209150017',
'87209150026'
);



UPDATE d_track_info dti LEFT JOIN d_vehicle dv ON dv.vehicleId = dti.vehicleId 
SET dv.status = 1 WHERE dti.sn IN (
'1190909293'
);

SELECT dv.* FROM d_track_info dti LEFT JOIN d_vehicle dv ON dv.vehicleId = dti.vehicleId
WHERE dti.sn IN (
'1190909293'
);

SELECT * FROM d_device_login ddl WHERE ddl.sn = '15306210768'; 
SELECT * FROM d_track_info dti  WHERE dti.sn = '96307050160';

DELETE FROM d_track_info WHERE trackerId = 2822260;



SELECT dti.sn
        FROM d_vehicle dv,
        d_track_info dti,
        d_class dc
        WHERE dti.vehicleId = dv.vehicleId
        AND dc.classid = dv.classId
        AND dv.status = 0
        AND dc.vehicleGroupId IN (367)
        and dti.sn IN ('1510922309');
       
       
SELECT	* FROM d_htfz_order WHERE orderNo = '1106713633';	 
UPDATE d_htfz_order SET oStatus = 12 WHERE id = 24078;

SELECT * FROM d_vehicle dv WHERE dv.standno = 'LSVN04BR5HN273410';
SELECT dvi.insurance_company,dvi.insuranceNo  FROM d_vehicle_insurance dvi WHERE dvi.vehicleId = 1091134;	

SELECT du.username AS '登录名',
       du.userRemark AS '用户名',
       dug.groupName AS '所属用户组',
       du.userPhone AS '联系电话',
       GROUP_CONCAT(dr.roleName) AS '角色',
       du.createtime AS '账户创建时间'
FROM d_user du LEFT JOIN d_user_group dug ON dug.d_groupid = du.d_groupid
LEFT JOIN d_user_role dur ON dur.d_LoginUserId = du.d_LoginUserId
LEFT JOIN d_role dr ON dur.roleId = dr.roleId
WHERE dug.groupName = '汇通'
GROUP BY du.d_LoginUserId;

SELECT * FROM d_user_group;
SELECT * FROM d_group dg WHERE groupName LIKE '%汇通%';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.orderType  = 'PAZL';

SELECT *FROM  t_track_stujudge_alarm ttsa WHERE poi_type = '非常停地';
SELECT *FROM  t_track_stujudge_alarm ttsa WHERE ttsa.delflag = 2 AND alarm_type IN (2,3) ORDER BY id DESC;

SELECT * FROM d_vehicle_workorder WHERE orderSource IS NOT NULL ;

SELECT * FROM d_role dr WHERE dr.roleName  = '平安项目';
SELECT * FROM d_user_role dur WHERE dur.roleId = 4018;
SELECT * FROM d_user du WHERE du.d_LoginUserId = 4537;


SELECT * FROM d_vehicle_insurance dvi WHERE standno = 'LFV2B20L0N4082698';
SELECT * FROM d_vehicle dv WHERE dv.standno = 'LFV5*********9006';	
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LGBH52E08JY742618';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PA3948323-2023PAZL101527213-ZL-01-1224090329875';
UPDATE d_vehicle_workorder SET sendStatus = 1 WHERE workOrderId = 1044295;
UPDATE d_vehicle_workorder SET status = 0 WHERE workOrderId = 1045432;
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1045432;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1724765194346958848';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PA3992441-2024PAZL101539559-ZL-01-0108122800284';
UPDATE d_vehicle_workorder SET source = 1 , no_source = 0  WHERE	workOrderId = 1050428;

SELECT * FROM d_class dc WHERE dc.classid = 8688;	

SELECT * FROM d_track_info dti WHERE dti.userId in (3400315,3400578);
DELETE FROM d_vehicle WHERE vehicleId = 1094401;
UPDATE d_vehicle SET status = 1 WHERE vehicleId = 1094402;
UPDATE d_track_info SET isActive = 0 , activeDate = NULL,vehicleId = NULL WHERE userId in (3400315,3400578);
SELECT * FROM d_vehicle_workorder_rep ORDER BY id DESC;

SELECT * FROM d_track_alarm_rec dtar  WHERE dtar.sn = '15212240859' AND delflag = 0; 	
SELECT * FROM d_track_info dti WHERE dti.sn in('17201050358'); 

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh LIKE  '%3934474-2023ZLTJ100754704-ZL-01-1218113142353%';
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.standno = 'LJXCU2BB2KTP67086';

UPDATE d_vehicle_workorder SET sqbh = '1107033396' WHERE workOrderId = 1043907;

select tc.full_name  as area,
               tc1.full_name as city,
               tc2.full_name as province
        from t_city tc
                 left join t_city tc1 on tc1.id = tc.parent_id
                 left join t_city tc2 on tc2.id = tc1.parent_id
        where tc.id = 130131;
       
SELECT * FROM d_vehicle dv WHERE dv.standno = 'LGBH52E08JY742618';
SELECT * FROM d_track_info dti WHERE dti.vehicleId = 1093085;
SELECT * FROM d_device_login ddl WHERE ddl.sn = 45212100445;

SELECT * FROM  d_user du WHERE du.username = 'dhnxhf';

select  t.roleId,t.user_role_id, t.d_LoginUserId
from d_user_role t ,d_role r  where t.roleId = r.roleId and r.status =0  and t.d_LoginUserId=455;
select * from d_role_vehicle_group t where t.roleId=16;
SELECT * FROM d_vehicle WHERE vehicleId =  49173;
 
SELECT DISTINCT  dvl.vehicleId FROM d_vehicle dvl WHERE dvl.vehicleId in (49173);

SELECT
	COUNT(dti.trackerId) activeNumber,
	count( CASE WHEN TO_DAYS(dti.ActiveDate) = TO_DAYS(NOW())THEN 1 ELSE NULL END )activeNumForToday
FROM
	d_track_info dti
LEFT JOIN d_device_login ddl ON
	dti.sn = ddl.sn
WHERE
	dti.isActive = 1
	AND dti.vehicleId IS NOT NULL
	AND temp.vehicleId = dti.vehicleId;

SELECT
	count(0) AS bindDeviceNumber,
	DATE_FORMAT(dti.createtime, '%Y-%m-%d') AS bindDate
FROM
	d_vehicle dti
WHERE
	1 = 1
	AND temp.vehicleId = dti.vehicleId
	AND date_sub(curdate(), INTERVAL 30 DAY) <= date(dti.createtime)
	AND dti.validateStatus = 1
GROUP BY
	DATE_FORMAT(dti.createtime, '%Y-%m-%d')
	
 SELECT count(0) AS bindDeviceNumber,
    DATE_FORMAT(dti.createtime,'%Y-%m-%d') as bindDate
    FROM d_vehicle dti
    ${appendSqlWithTable}
    WHERE 1 = 1
    <if test="appendSqlWithCondition != null">
        ${appendSqlWithCondition}
    </if>
    <if test="appendSqlWithOrTable != null">
        ${appendSqlWithOrTable}
    </if>
    ${appendSqlByTimeRange}
    AND dti.validateStatus=1 GROUP BY DATE_FORMAT(dti.createtime,'%Y-%m-%d');
   
SELECT * FROM d_htfz_order;   

SELECT * FROM d_electric_fence_alarm defa ;

select * from d_device_freq WHERE freq_type = 2;

select  deviceId,sn,soc,createtime,updatetime,alarmtime from d_device_power where sn = '2900429218' order by createtime desc limit 0,1


select * from d_vehicle_workorder dvw WHERE dvw.sqbh  = '1107091411';
select * from d_track_info dti WHERE dti.sn = '96312110064';

select * from d_track_alarm_rec_basic ;
select * from eshield_device_alarm_rule ;

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh  = 'PA4023807-2024ZLTJ100781914-ZL-01-011818021879';

SELECT * FROM d_device_freq;
SELECT * FROM t_track_stujudge_alarm ttsa ; 

SELECT * FROM d_user du WHERE d_LoginUserId = 4537;

SELECT * FROM d_track_info dti WHERE dti.sn = '93312010944';
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 1112358; 
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId =1058219;

SELECT * FROM d_app_image WHERE workOrderId = 1058098;  

SELECT count(1)  FROM d_vehicle_workorder dvw ;

SELECT * FROM eshield_alarm;

select esh.alarmId as alarmId, dv.vehicleId as vehicleId,dv.name as name,dv.standno as standno,dw.sqbh as sqbh,esh.deviceNoes as deviceNoes
        ,eai.status as isAttention,date_format(eai.createTime,'%Y-%m-%d %H:%i:%s') as ignoreTime,
        date_format(esh.alarmTime,'%Y-%m-%d %H:%i:%s') as alarmTime,
        esh.alarmLevel as alarmLevel,esh.alarmExplain as alarmExplain,esh.alarmSuggest as alarmSuggest,
        date_format(dw.activeTime,'%Y-%m-%d %H:%i:%s') as activeTime,
        dw.shopName as shopName,
        esh.status as status
        from d_vehicle dv INNER JOIN d_vehicle_workorder dw on dv.workOrderId = dw.workOrderId
            INNER JOIN eshield_alarm esh on dv.vehicleId = esh.vehicleId
            left JOIN eshield_attention_ignore eai on dv.vehicleId = eai.vehicleId
            INNER JOIN d_class c on c.classId = dv.classid
            inner join  d_group g on g.vehicleGroupId = c.vehicleGroupId
        ${appendSqlWithTable}
        where dv.status = 0
        order by esh.alarmLevel ASC;
       
SELECT * FROM d_user du WHERE userRemark  = '研发-王欣伟';   
select  t.roleId,t.user_role_id, t.d_LoginUserId
from d_user_role t ,d_role r  where t.roleId = r.roleId and r.status =0  and t.d_LoginUserId=3205;
select * from d_role_vehicle_group t where t.roleId IN (6,481,517);
SELECT * FROM d_role dr WHERE dr.roleId IN (6,481,517);
SELECT * FROM d_class dc WHERE dc.classid = 32;

dv.vehicleId in ( SELECT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid LEFT JOIN d_group dgroup ON dclass.vehicleGroupId = dgroup.vehicleGroupId WHERE dgroup.vehicleGroupId IN ( " + StringUtils.join(array, ",") + " ));
 SELECT  DISTINCT dvl.vehicleId FROM d_vehicle dvl LEFT JOIN d_class dclass ON  dvl.classId = dclass.classid WHERE dclass.classid IN (32); 

SELECT * FROM d_track_alarm_rec WHERE alarmType = 15;

SELECT * FROM d_track_alarm_rec WHERE delflag = 0;

SELECT * FROM d_track_alarm_rec WHERE sn = '15212230392';

SELECT * FROM d_vehicle_workorder dvw WHERE standno = 'LDP61B965MG869680'; 

SELECT * FROM d_class dc WHERE dc.classid = 3638;	

SELECT * FROM d_user du WHERE du.userRemark = '郑彩霞'; 
SELECT * FROM d_user du WHERE du.userRemark = '何晓露'; 

select * from d_role_insurance ri,d_user_role ur 
where ri.roleId = ur.roleId AND ri.`insurance_company` IS NOT NULL 
and ur.d_LoginUserId in ('4812','4897');

SELECT * FROM d_class WHERE classid = '3638';

SELECT * FROM d_user du WHERE du.username = 'xaqc';
SELECT * FROM d_class dc WHERE	dc.className = '广东银盘担保售后回租-广州SPF';
SELECT * FROM d_vehicle dv WHERE dv.classId = 3793;

select  t.roleId,t.user_role_id, t.d_LoginUserId
from d_user_role t ,d_role r  where t.roleId = r.roleId and r.status =0  and t.d_LoginUserId=5119;

SELECT DISTINCT `type`  FROM d_role_vehicle_group;
select * from d_role_vehicle_group t where t.roleId=4593;
-- 3753,6043,3850,6286,6283,5369,5311
UPDATE d_role_vehicle_group SET typeVal = '2398,3595,3596,3597,3598,3599,3600,3629,3630,3631,3632,3633,3634,3635,3636,3640,3655,3656,3657,3658,3659,3665,3666,3667,3692,3711,3749,3750,3751,3752,3753,3755,3756,3757,3758,3785,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3809,3812,3813,3814,3815,3816,3817,3818,3841,3844,3845,3846,3847,3848,3849,3850,3851,3863,3864,3865,3866,3869,3870,3871,3872,3873,3874,3879,3888,3889,3910,3918,3919,3939,3940,3944,3965,3969,3976,3977,3987,4009,4010,4011,4012,4014,4018,4028,4029,4030,4031,4032,4033,4034,4035,4038,4040,4041,4042,4047,4048,4049,4054,4936,4941,4943,4951,4955,4986,4988,4999,5010,5014,5039,5117,5119,5120,5123,5133,5198,5216,5311,5316,5339,5345,5346,5369,5373,5374,5379,5387,5395,5402,5408,5413,5429,5433,5472,5518,5519,5520,5521,5522,5544,5928,5945,5946,5949,5956,5959,5996,6010,6043,6044,6056,6066,6088,6121,6129,6208,6209,6210,6215,6233,6249,6252,6254,6257,6283,6286,6309,6324,6327,6328,6330,6363,6374,6378,6383,6428,6489,6519,6523,6555,6589,6590,6654,6748,6772,6773,6862,7018,7019,7935,7937,8119,8285,8296,8307,8314,8329,8349,8430,8431,8432,8508,8533,8556,8576,8583,8588,8596,8599,8604,8725,8729,8730,8743,8865,8870,8872,8919,8964,8979,8980'
WHERE d_rvg_id = 29048;

SELECT * FROM d_group dg ;
SELECT * FROM d_class dc;
SELECT * FROM d_user du ;
SELECT * FROM d_user_role dur ;
SELECT * FROM d_role dr;
SELECT * FROM d_vehicle dv ;
SELECT * FROM d_vehicle_workorder dvw ; 
SELECT * FROM d_track_info dti ;
SELECT * FROM d_vehicle_insurance dvi ;

SELECT * FROM d_track_alarm_rec dtar ;
SELECT * FROM t_track_stujudge_alarm ttsa ;

SELECT CONCAT(LEFT(dv.standno, 4), '*********',RIGHT(dv.standno, 4)) AS standno,ttsa.sn,alarmNo,alarm_type ,geo_code,CONCAT(LEFT(ttsa.alarm_address, 4), '*********',RIGHT(ttsa.alarm_address, 4)) AS alarm_address ,begintime ,lasttime, poi_type  FROM t_track_stujudge_alarm ttsa 
LEFT JOIN d_track_info dti ON dti.sn = ttsa.sn 
LEFT JOIN d_vehicle dv ON dv.userId = dti.userId
WHERE dv.standno IS NOT NULL AND ttsa.poi_type IS NOT NULL 
LIMIT 100;

SELECT REPLACE(dv.standno, '****') AS standno FROM d_vehicle dv;
-- LSGU L83L5LA22 4851
SELECT CONCAT(LEFT(dv.standno, 4), '*********',RIGHT(dv.standno, 4)) AS masked_column
FROM d_vehicle dv;

SELECT dc.* 
FROM d_group dg 
LEFT JOIN d_class dc ON dc.vehicleGroupId = dg.vehicleGroupId
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514)

# 工单数据表
SELECT dvw.workOrderId,dvw.classId,dvw.name,dvw.standno,dvw.userTel,dvw.userSex,dvw.brandid,dvw.shopContacts,dvw.contactsPhone,dvw.fix_time,dvw.status,dvw.lastLoginUserId,dvw.activeTime,
dvw.activeMan,dvw.sendStatus,dvw.area,dvw.shopName,dvw.color,dvw.carType,dvw.isDvd,dvw.creditPeriod,dvw.rent,dvw.address,dvw.`cycle`,dvw.ishandsel,dvw.branch,
dvw.sqbh,dvw.createtime,dvw.idnum,dvw.noticeUser,dvw.`engine`,
dvw.displacement,dvw.remark,dvw.importdate,dvw.description,dvw.carTypeName,dvw.createUserId,dvw.productType,dvw.province,dvw.city,dvw.orderType,dvw.creditLimit,dvw.installMethod,
dvw.pa,dvw.shop_addr,dvw.fix_area,dvw.fix_phone,dvw.source,dvw.no_source,dvw.record,dvw.areaId,dvw.dispatchEmail
FROM d_vehicle_workorder dvw  
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514);
# 车辆数据表
SELECT dv.vehicleId,dv.idnum,dv.classId,dv.vehicleTypeId,dv.displacement,dv.buyDate,dv.mileage,dv.name,dv.standno,dv.noticuser,dv.userSex,dv.userTel,
dv.shopcontactor,dv.shopPhone,dv.lastLoginUserId,dv.createtime,dv.updatetime,dv.userId,dv.isSubUserId,dv.workOrderId,dv.endtime,dv.isuse,dv.`engine`,
dv.remark,dv.description,dv.status,dv.fix_time,dv.validateStatus,dv.acc,dv.validateInfo,dv.createUserId,dv.activeUserId
FROM d_vehicle dv
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514); 
# 保单数据表
SELECT dvi.id,dvi.workOrderNo,dvi.name,dvi.standno,dvi.insuranceType,dvi.insurance,dvi.customerType,dvi.IDCard,dvi.mobile,dvi.telephone,dvi.address,dvi.vehicleBrand,
dvi.vehicleType,dvi.invoicePrice,dvi.vehicleRecDate,dvi.plateNumber,dvi.engineNumber,dvi.compensationName,dvi.specialTag,dvi.carStyle,dvi.loanAmount,dvi.remark,
dvi.createTime,dvi.updateTime,dvi.`password`,dvi.source,dvi.sn,dvi.insuranceNo,dvi.installDate,dvi.installPoint,dvi.installPerson,dvi.buyType,dvi.takeEffectTime,
dvi.status,dvi.vehicleId,dvi.vehicleColor,dvi.insurance_company,dvi.full_insurance_no,dvi.specialContent,dvi.spid,dvi.vehicle_brand_type_name,dvi.successTime,
dvi.endTime,dvi.channel_source,dvi.vehicle_usage,dvi.wy_service_price
FROM d_vehicle_insurance dvi
LEFT JOIN d_vehicle_workorder dvw ON  dvw.sqbh =  dvi.workOrderNo 
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514);
# 设备数据表
SELECT dti.trackerId,dti.deviceType,dti.deviceNo,dti.sn,dti.imsi,dti.iccid,dti.simPhone,dti.isActive,dti.activeDate,dti.checkCode,dti.modelId,dti.userId,dti.createtime,
dti.updateTime,dti.d_LoginUserId,dti.issub,dti.vehicleId,dti.partner,dti.validateStatus,dti.validateNums,dti.soft_version,dti.imei,dti.deviceId,dti.source,dti.networkCardNubmer
FROM d_track_info dti 
LEFT JOIN d_vehicle dv ON dv.vehicleId = dti.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514); 
# 分组数据表
SELECT vehicleGroupId,groupName,remark,contactsName,contactsPhone,createtime 
FROM d_group WHERE vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514); 
# 分类数据表
SELECT dc.classid,dc.className,dc.remark,dc.contactsName,dc.contactsPhone,dc.createtime,dc.vehicleGroupId
FROM d_class dc 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514); 
# 设备类型表
SELECT id,name,remark,classify_status,parentId,updateTime
FROM eshield_device_classify;

SELECT id,name,classifyId,classifyName,contractor,source,status,createUserId,createTime,updateTime,descs 
FROM eshield_device;

# 车型 车库
SELECT vehicleTypeId,vehicleTypeName,vehicleBrandId
FROM d_vehicle_brand_type;

# 用户表
SELECT username,userPwd,userRemark,userPhone,userStatus,createtime,d_LoginUserId,d_groupid
FROM d_user;

# 操作日志表
SELECT id,workOrderId,serviceName,installerName,installerPhone,primaryDevicePosition,subDevice1Position,subDevice2Position,
createTime,updateTime,synChannel
FROM d_check_app_active_log;

-- SELECT * FROM d_vehicle;	
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 697824 ORDER BY createtime desc;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId <= 697824 ORDER BY workOrderId desc;

SELECT * FROM d_vehicle dv WHERE dv.vehicleId <= 773199 ORDER BY vehicleId desc;	
SELECT count(1) FROM d_vehicle dv WHERE dv.vehicleId <= 773199 ORDER BY vehicleId desc;	

SELECT dv.* 
FROM d_vehicle dv
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514,66)
AND dv.vehicleId <= 773199 ORDER BY vehicleId desc; 

SELECT count(DISTINCT dv.vehicleId) 
FROM d_vehicle dv
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514,66)
AND dv.vehicleId <= 773199 ORDER BY vehicleId desc; 

SELECT * FROM d_class dc WHERE dc.classid = 90; 
SELECT * FROM d_group dg WHERE dg.vehicleGroupId = 14;
SELECT * FROM d_group dg WHERE dg.groupName = 'APP广汇默认分组';
SELECT * FROM d_vehicle dv WHERE dv.vehicleId = 772923;	

SELECT * FROM d_track_info dti WHERE dti.trackerId <= 1771502 ORDER BY dti.trackerId DESC ;
SELECT count(DISTINCT dti.trackerId)
FROM d_track_info dti 
LEFT JOIN d_vehicle dv ON dv.vehicleId = dti.vehicleId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514)
AND dti.trackerId <= 1771502 ORDER BY dti.trackerId DESC; 

SELECT DISTINCT dvi.id,dvi.workOrderNo,dvi.name,dvi.standno,dvi.insuranceType,dvi.insurance,dvi.customerType,dvi.IDCard,dvi.mobile,dvi.telephone,dvi.address,dvi.vehicleBrand,
dvi.vehicleType,dvi.invoicePrice,dvi.vehicleRecDate,dvi.plateNumber,dvi.engineNumber,dvi.compensationName,dvi.specialTag,dvi.carStyle,dvi.loanAmount,dvi.remark,
dvi.createTime,dvi.updateTime,dvi.`password`,dvi.source,dvi.sn,dvi.insuranceNo,dvi.installDate,dvi.installPoint,dvi.installPerson,dvi.buyType,dvi.takeEffectTime,
dvi.status,dvi.vehicleId,dvi.vehicleColor,dvi.insurance_company,dvi.full_insurance_no,dvi.specialContent,dvi.spid,dvi.vehicle_brand_type_name,dvi.successTime,
dvi.endTime,dvi.channel_source,dvi.vehicle_usage,dvi.wy_service_price
FROM d_vehicle_insurance dvi
LEFT JOIN d_vehicle_workorder dvw ON  dvw.sqbh =  dvi.workOrderNo 
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514);

SELECT DISTINCT dv.vehicleId,dv.idnum,dv.classId,dv.vehicleTypeId,dv.displacement,dv.buyDate,dv.mileage,dv.name,dv.standno,dv.noticuser,dv.userSex,dv.userTel,
dv.shopcontactor,dv.shopPhone,dv.lastLoginUserId,dv.createtime,dv.updatetime,dv.userId,dv.isSubUserId,dv.workOrderId,dv.endtime,dv.isuse,dv.`engine`,
dv.remark,dv.description,dv.status,dv.fix_time,dv.validateStatus,dv.acc,dv.validateInfo,dv.createUserId,dv.activeUserId
FROM d_vehicle dv
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514); 

SELECT * FROM  d_vehicle dv WHERE dv.vehicleId = 1133637;
SELECT * FROM d_vehicle_workorder dvw WHERE dvw.workOrderId = 1080353;


SELECT DISTINCT dvw.workOrderId,dvw.classId,dvw.name,dvw.standno,dvw.userTel,dvw.userSex,dvw.brandid,dvw.shopContacts,dvw.contactsPhone,dvw.fix_time,dvw.status,dvw.lastLoginUserId,dvw.activeTime,
dvw.activeMan,dvw.sendStatus,dvw.area,dvw.shopName,dvw.color,dvw.carType,dvw.isDvd,dvw.creditPeriod,dvw.rent,dvw.address,dvw.`cycle`,dvw.ishandsel,dvw.branch,
dvw.sqbh,dvw.createtime,dvw.idnum,dvw.noticeUser,dvw.`engine`,
dvw.displacement,dvw.remark,dvw.importdate,dvw.description,dvw.carTypeName,dvw.createUserId,dvw.productType,dvw.province,dvw.city,dvw.orderType,dvw.creditLimit,dvw.installMethod,
dvw.pa,dvw.shop_addr,dvw.fix_area,dvw.fix_phone,dvw.source,dvw.no_source,dvw.record,dvw.areaId,dvw.dispatchEmail
FROM d_vehicle_workorder dvw  
LEFT JOIN d_vehicle dv ON dv.workOrderId  = dvw.workOrderId 
LEFT JOIN d_class dc ON dc.classid = dv.classId 
LEFT JOIN d_group dg ON dg.vehicleGroupId = dc.vehicleGroupId  
WHERE dg.vehicleGroupId IN (5,6,7,8,10,11,12,13,15,16,17,18,20,21,22,23,24,25,26,27,28,29,30,31,38,53,63,75,206,304,514) AND dv.status = 0
AND dvw.workOrderId = 1080353;

SELECT DISTINCT fund,orderType  FROM d_vehicle_workorder dvw WHERE orderType = 'GH';
SELECT DISTINCT orderType FROM d_vehicle_workorder dvw;

SELECT * FROM d_function; 	
SELECT * FROM d_role_function;
SELECT * FROM d_vehicle_workorder dvw  WHERE orderType = 'PAZL';
SELECT * FROM d_vehicle_workorder dvw  WHERE orderType = 'ZL';

SELECT * FROM d_device_login ddl WHERE sn = '87201120233';
-- SELECT * FROM d_vehicle dv WHERE 
SELECT * FROM d_track_info WHERE sn = '87201120233';

SELECT * FROM d_vehicle_workorder dvw WHERE	dvw.sqbh = 'PALS-2024ZLTJ100843068-ZL-01-240429-001-001'; 
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1084926;	
SELECT * FROM d_track_info dti WHERE dti.vehicleId = 1137877;
SELECT * FROM d_feedback_param dfp WHERE dfp.order_id = 1084926;

UPDATE d_vehicle_workorder SET standno = 'LFV5A24G4F3074415' WHERE workOrderId  = 1084926;
UPDATE d_vehicle SET standno = 'LFV5A24G4F3074415' WHERE vehicleId = 1137877;

INSERT INTO d_feedback_param (order_id,sqbh,vin,actual_install_address,actual_install_name,device_info,create_time) VALUES
(1084926,'PALS-2024ZLTJ100843068-ZL-01-240429-001-001','LFV5A24G4F3074415','辽宁省大连市甘井子区龙安路','大连甘井子后盐车市邱跃峰','[{"sn":"74311300185","installLocation":"后备箱刹车灯附近"}]',NULL);

三码合一	https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV-WAORbNABYnmFwrxeI492.jpg
人车合影	https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV-qAGjwGAAD9XKtwFmc800.jpg
门店照	https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvWDSAJ1lYAAJCW_NL0Zk864.jpg
安装位置照	https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV_SAWxXPAAHB2GAZego879.jpg

SELECT * FROM d_app_image dai WHERE dai.workOrderId = 1084918;
INSERT INTO d_app_image (workOrderId,standno,imageName,url,createTime,name) VALUES
(1084926,'LFV5A24G4F3074415','三码合一.jpg','https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV-WAORbNABYnmFwrxeI492.jpg',sysdate() ,'李**'),
(1084926,'LFV5A24G4F3074415','人车合影.jpg','https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV-qAGjwGAAD9XKtwFmc800.jpg',sysdate() ,'李**'),
(1084926,'LFV5A24G4F3074415','门店照.jpg','https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvWDSAJ1lYAAJCW_NL0Zk864.jpg',sysdate() ,'李**'),
(1084926,'LFV5A24G4F3074415','安装位置照.jpg','https://bhg.didihu.com.cn/group1/M00/30/79/wKgFDWYvV_SAWxXPAAHB2GAZego879.jpg',sysdate() ,'李**');

SELECT * FROM d_vehicle_workorder dvw WHERE dvw.sqbh = '1107338027';
SELECT * FROM d_vehicle dv WHERE dv.workOrderId = 1084864;
SELECT * FROM d_vehicle dv WHERE dv.standno = 'LB37752Z2JL587066';
SELECT * FROM d_track_info dti WHERE dti.vehicleId =  1137873;
SELECT * FROM d_track_info dti WHERE dti.userId IN (3515256,3515246);

UPDATE d_track_info SET isActive = 1 , activeDate = sysdate() , vehicleId = 1137873 WHERE trackerId IN (2929193,2929203);

SELECT DISTINCT a.`sn`,a.`simPhone`,a.`iccid`,a.`imsi`,a.`activeDate`,a.`isActive` 
FROM `d_track_info` a LEFT JOIN `d_vehicle` b ON b.`vehicleId`=a.`vehicleId` 
LEFT JOIN `d_class` c ON c.`classid`=b.`classId` 
LEFT JOIN `d_group` d ON d.`vehicleGroupId`=c.`vehicleGroupId` 
AND (d.`vehicleGroupId`!=78 AND d.`vehicleGroupId`!=267) WHERE a.vehicleId = 1137873 AND LEFT(a.`sn`,2)!='66' AND d.`vehicleGroupId`>=0;

SELECT * FROM  d_vehicle_workorder WHERE sqbh IN (
'PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1784927644635238400',
'PATBX-3388008-2023PAZL101375867-ZL-01-0417104716438-1784927588309929984'
);

SELECT * FROM d_track_info; 
SELECT count(1)  FROM  d_vehicle_workorder; 
SELECT count(1)  FROM  d_vehicle;
SELECT count(1)  FROM  d_track_info dti WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_vehicle_workorder dvw WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_settle WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_alarm_process_result WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_class WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_group WHERE LEFT(createtime,7)>= '2024-05';
SELECT count(1)  FROM  d_user WHERE LEFT(createtime,7)>= '2024-05';

 SELECT
	roleinsura0_.id AS id67_0_,
	userrole1_.user_role_id AS user1_65_1_,
	roleinsura0_.classid AS classid67_0_,
	roleinsura0_.device_combine AS device3_67_0_,
	roleinsura0_.group_attach AS group4_67_0_,
	roleinsura0_.groupid AS groupid67_0_,
	roleinsura0_.insurance_company AS insurance6_67_0_,
	roleinsura0_.insurance_period AS insurance7_67_0_,
	roleinsura0_.needInstall AS needInst8_67_0_,
	roleinsura0_.permission AS permission67_0_,
	roleinsura0_.permissionByFail AS permiss10_67_0_,
	roleinsura0_.roleid AS roleid67_0_,
	roleinsura0_.sendSms AS sendSms67_0_,
	roleinsura0_.special_permission AS special13_67_0_,
	roleinsura0_.toc AS toc67_0_,
	userrole1_.roleId AS roleId65_1_,
	userrole1_.d_LoginUserId AS d3_65_1_
FROM
	d_role_insurance roleinsura0_
CROSS JOIN d_user_role userrole1_
WHERE
	userrole1_.roleId = roleinsura0_.roleid
	AND userrole1_.d_LoginUserId = 4493;

SELECT * FROM d_track_alarm_rec_history; 












































