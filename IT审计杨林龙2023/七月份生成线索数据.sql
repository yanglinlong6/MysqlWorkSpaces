SELECT * FROM device_mapping;

-- 备份数据
-- DROP TABLE device_mapping_20230724;
CREATE TABLE device_mapping_20230724 LIKE device_mapping;
INSERT INTO device_mapping_20230724 SELECT * FROM device_mapping;
select count(1) from device_mapping;
select count(1) from device_mapping_20230724;

-- DROP TABLE dj_car_maintain_20230724;
CREATE TABLE dj_car_maintain_20230724 LIKE dj_car_maintain;
INSERT INTO dj_car_maintain_20230724 SELECT * FROM dj_car_maintain;
select count(1) from dj_car_maintain;
select count(1) from dj_car_maintain_20230724;

-- DROP TABLE dj_car_shop_warning_20230724;
CREATE TABLE dj_car_shop_warning_20230724 LIKE dj_car_shop_warning;
INSERT INTO dj_car_shop_warning_20230724 SELECT * FROM dj_car_shop_warning;
select count(1) from dj_car_shop_warning;
select count(1) from dj_car_shop_warning_20230724;

-- DROP TABLE ddh_rescue_event_20230724;
CREATE TABLE ddh_rescue_event_20230724 LIKE ddh_rescue_event;
INSERT INTO ddh_rescue_event_20230724 SELECT * FROM ddh_rescue_event;
select count(1) from ddh_rescue_event;
select count(1) from ddh_rescue_event_20230724;

-- DROP TABLE dj_basic_device_info;
CREATE TABLE dj_basic_device_info_20230726 LIKE dj_basic_device_info;
INSERT INTO dj_basic_device_info_20230726 SELECT * FROM dj_basic_device_info;
select count(1) from dj_basic_device_info;
select count(1) from dj_basic_device_info_20230726;


-- 还原数据
-- DROP TABLE device_mapping;
CREATE TABLE device_mapping LIKE device_mapping_20230724;
INSERT INTO device_mapping SELECT * FROM device_mapping_20230724;
select count(1) from device_mapping;
select count(1) from device_mapping_20230724;

-- DROP TABLE dj_car_maintain;
CREATE TABLE dj_car_maintain LIKE dj_car_maintain_20230724;
INSERT INTO dj_car_maintain SELECT * FROM dj_car_maintain_20230724;
select count(1) from dj_car_maintain;
select count(1) from dj_car_maintain_20230724;

-- DROP TABLE dj_car_shop_warning;
CREATE TABLE dj_car_shop_warning LIKE dj_car_shop_warning_20230724;
INSERT INTO dj_car_shop_warning SELECT * FROM dj_car_shop_warning_20230724;
select count(1) from dj_car_shop_warning;
select count(1) from dj_car_shop_warning_20230724;

-- DROP TABLE ddh_rescue_event;
CREATE TABLE ddh_rescue_event LIKE ddh_rescue_event_20230724;
INSERT INTO ddh_rescue_event SELECT * FROM ddh_rescue_event_20230724;
select count(1) from ddh_rescue_event;
select count(1) from ddh_rescue_event_20230724;


SELECT * FROM device_mapping WHERE fakeSn = '64201180638'; 
SELECT * FROM dj_devices;
SELECT * FROM t_pap_first_active_pos_info;

SELECT * FROM dj_car_maintain; 

-- 收入
SELECT A.yeartime,A.total_price,A.num ,B.total_price,B.num,(B.total_price -A.total_price) AS gop_price,(B.num -A.num) AS gop_num  FROM
(SELECT LEFT(settle_time,7) AS yeartime,sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)) AS total_price ,count(1) num  FROM  dj_2021_settle_details 
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,7)) AS A 
LEFT JOIN
(SELECT LEFT(settle_time,7) AS yeartime ,sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)) AS total_price ,count(1) num  FROM dj_device_details
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,7)) AS B ON (B.yeartime = A.yeartime) HAVING abs(gop_price) > 0;

-- 成本
SELECT A.yeartime,A.total_price,A.num ,B.total_price,B.num,(B.total_price -A.total_price) AS gop_price,(B.num -A.num) AS gop_num  FROM
(SELECT LEFT(settle_time,4) AS yeartime,sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0)) AS total_price ,count(1) num  FROM  dj_2021_settle_details 
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,4)) AS A 
LEFT JOIN
(SELECT LEFT(settle_time,4) AS yeartime ,sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0)) AS total_price ,count(1) num  FROM dj_device_details
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,4)) AS B ON (B.yeartime = A.yeartime) HAVING abs(gop_price) > 0;

SELECT * FROM dj_device_details_return WHERE settle_time > '2023-01-01';
SELECT * FROM dj_device_details_return_20230703 WHERE settle_time > '2023-01-01';


insert into dj_device_details_return (channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost) 
SELECT channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost from dj_2023_settle_details_return  where settle_time >= '2023-01-01';

SELECT * FROM dj_device_details_return WHERE settle_time >= '2023-01-01';

SELECT * FROM  dj_device_details_return;

SELECT * FROM dj_2021_settle_details_return dsdr WHERE settle_time >= '2023-01-01';

SELECT count(1)  FROM dj_device_details;



-- 收入
SELECT A.yeartime,A.total_price,A.num ,B.total_price,B.num,(B.total_price -A.total_price) AS gop_price,(B.num -A.num) AS gop_num  FROM
(SELECT LEFT(settle_time,7) AS yeartime,sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)) AS total_price ,count(1) num  FROM  dj_2021_settle_details_return 
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,7)) AS A 
LEFT JOIN
(SELECT LEFT(settle_time,7) AS yeartime ,sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)) AS total_price ,count(1) num  FROM dj_device_details_return
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,7)) AS B ON (B.yeartime = A.yeartime) HAVING abs(gop_price) > 0;

-- 成本
SELECT A.yeartime,A.total_price,A.num ,B.total_price,B.num,(B.total_price -A.total_price) AS gop_price,(B.num -A.num) AS gop_num  FROM
(SELECT LEFT(settle_time,4) AS yeartime,sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0)) AS total_price ,count(1) num  FROM  dj_2021_settle_details_return 
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,4)) AS A 
LEFT JOIN
(SELECT LEFT(settle_time,4) AS yeartime ,sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0)) AS total_price ,count(1) num  FROM dj_device_details_return
 WHERE `device_type` IN (8,6,12501) GROUP BY LEFT(settle_time,4)) AS B ON (B.yeartime = A.yeartime) HAVING abs(gop_price) > 0;


SELECT count(1) FROM device_mapping; 
SELECT count(1) FROM device_mapping_20230724; 
-- 保养线索数据
SELECT count(1) FROM dj_car_maintain;
SELECT count(1) FROM dj_car_maintain_20230724;

-- 到店线索数据
SELECT count(1) FROM dj_car_shop_warning;
SELECT count(1) FROM dj_car_shop_warning_20230724;

-- 碰撞线索数据
SELECT count(1) FROM ddh_rescue_event;
SELECT count(1) FROM ddh_rescue_event_20230724;

SELECT max(svrtime) FROM  dj_car_maintain;
SELECT max(collision_time) FROM  dj_car_collision_20230724;
SELECT * FROM  dj_car_shop_warning;
SELECT * FROM  ddh_rescue_event;


SELECT max(svrtime) FROM  dj_car_maintain;
SELECT max(trigger_time) FROM  dj_car_shop_warning;
SELECT max(EVENT_DATE) FROM  ddh_rescue_event;

SELECT count(1) FROM  dj_car_maintain;
SELECT count(1) FROM  dj_car_shop_warning;
SELECT count(1) FROM  ddh_rescue_event;

SELECT count(1) FROM dj_car_maintain WHERE svrtime < '2023-01-01';
SELECT count(1) FROM dj_car_shop_warning WHERE trigger_time < '2023-01-01';
SELECT * FROM dj_car_shop_warning WHERE trigger_time < '2023-01-01';

-- 处理多余数据
DELETE FROM dj_car_maintain WHERE svrtime >= '2023-01-01'; 
DELETE FROM dj_car_shop_warning WHERE trigger_time >= '2023-01-01'; 
DELETE FROM ddh_rescue_event WHERE EVENT_DATE  >= '2023-01-01'; 


SELECT count(DISTINCT active_merchant) as num from dj_2021_settle_details where active_merchant <> '' and
        ((DATE_FORMAT(active_time, '%Y-%m') = '2020-01' and DATE_FORMAT(DATE_ADD(active_time,INTERVAL pk_period MONTH),'%Y-%m') > '2020-01') or
        DATE_FORMAT(active_time, '%Y-%m') = '2020-01');
       
select * from dj_devices;   
select count(1) from dj_devices;  

select fakeSn,realSn,merchant_id,merchant_name,activeTime from device_mapping;   

SELECT * FROM dj_2021_settle_details dsd WHERE settle_time < '2023-01-01';
       
SELECT * FROM dj_2021_settle_details WHERE id = 150676;
SELECT * FROM dj_2021_settle_details WHERE sn = '8200819218';
SELECT * FROM dj_system_merchant WHERE merchant_name = '天津市亿嘉信息技术有限公司'; 
SELECT *FROM dj_basic_device_info WHERE LEFT(active_time,4)=2022  ;
SELECT * FROM dj_basic_device_info WHERE sn IN (SELECT sn FROM dj_2021_settle_details);
INSERT INTO dj_basic_device_info (sn,device_type,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period)
SELECT sn,device_type,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period
FROM dj_2021_settle_details WHERE settle_time >= '2023-01-01';

SELECT * FROM dj_basic_device_info; 
SELECT * FROM dj_2021_settle_details;
SELECT * FROM dj_car_collision;


SELECT * FROM dj_system_merchant dsm WHERE dsm.merchant_name = '上海谊商务咨询有限公司'; 
SELECT *FROM dj_system_merchant WHERE merchant_name LIKE '%遵义%';
SELECT * FROM dj_2021_settle_details WHERE settle_merchant = '上海谊商务咨询有限公司'; 
SELECT * FROM dj_2023_settlment_order WHERE cus_name = '上海谊商务咨询有限公司';


-- DROP TABLE glsx_sync_log;
CREATE TABLE glsx_sync_log_20230728 LIKE glsx_sync_log;
INSERT INTO glsx_sync_log_20230728 SELECT * FROM glsx_sync_log;
select * from glsx_sync_log;
select * from glsx_sync_log_20230728;

SELECT * FROM glsx_sync_log;	
SELECT * FROM glsx_sync_log_bak;	

-- DROP TABLE dj_car_maintain_20230728;
CREATE TABLE dj_car_maintain_20230728 LIKE dj_car_maintain;
INSERT INTO dj_car_maintain_20230728 SELECT * FROM dj_car_maintain;
select count(1) from dj_car_maintain;
select count(1) from dj_car_maintain_20230728;

-- DROP TABLE dj_car_shop_warning_20230728;
CREATE TABLE dj_car_shop_warning_20230728 LIKE dj_car_shop_warning;
INSERT INTO dj_car_shop_warning_20230728 SELECT * FROM dj_car_shop_warning;
select count(1) from dj_car_shop_warning;
select count(1) from dj_car_shop_warning_20230728;

-- 处理多余数据
DELETE FROM dj_car_maintain WHERE svrtime >= '2023-01-01'; 
DELETE FROM dj_car_shop_warning WHERE trigger_time >= '2023-01-01'; 
-- DELETE FROM ddh_rescue_event WHERE EVENT_DATE  >= '2023-01-01'; 

SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC ;

SELECT DATE_FORMAT(trigger_time, '%Y-%m'),COUNT(*) FROM dj_car_shop_warning 
GROUP BY DATE_FORMAT(trigger_time, '%Y-%m') DESC;

SELECT DATE_FORMAT(EVENT_DATE, '%Y-%m'),COUNT(*) FROM ddh_rescue_event 
GROUP BY DATE_FORMAT(EVENT_DATE, '%Y-%m') DESC;

SELECT * FROM dj_system_merchant dsm WHERE dsm.merchant_name = '乌鲁木齐庞大腾众汽车销售有限公司'; 


-- DROP TABLE dj_device_details_20230801;
CREATE TABLE dj_device_details_20230801 LIKE dj_device_details;
INSERT INTO dj_device_details_20230801 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20230801;
SELECT count(1) FROM dj_2021_settle_details;


-- 备份本地库的表 将生产的激活时间同步到本地库
-- DROP TABLE dj_2021_settle_details_20230801;
CREATE TABLE dj_2021_settle_details_20230801 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230801 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230801;


SELECT a.sn ,a.active_time ,b.sn ,b.active_time ,a.device_type ,TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) AS diff 
FROM dj_device_details a LEFT JOIN dj_2021_settle_details_20230801 b ON b.sn = a.sn 
WHERE TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) > 0 ;-- AND a.device_type NOT IN (8)


SELECT a.sn ,a.active_time ,b.sn ,b.active_time ,TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) AS diff 
FROM dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn 
WHERE TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) > 0;



-- UPDATE dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn SET b.active_time  = a.active_time 
-- WHERE TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) > 0;

SELECT a.sn ,a.active_time ,b.sn ,b.active_time ,TIMESTAMPDIFF(DAY ,a.active_time,b.active_time) AS diff 
FROM dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn 
WHERE a.active_time!=b.active_time;

-- UPDATE dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn SET b.active_time  = a.active_time 
   WHERE a.active_time!=b.active_time;



































