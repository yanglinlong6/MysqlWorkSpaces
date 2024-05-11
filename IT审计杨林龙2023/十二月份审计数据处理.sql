# 备份已经跑完的十一月份的数据
CREATE TABLE dj_2021_settle_details_20240113 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20240113 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20240113;

CREATE TABLE dj_device_details_20240113 LIKE dj_device_details;
INSERT INTO dj_device_details_20240113 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20240113;

SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-12'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order a WHERE LEFT(a.finance_time,7) >= '2023-12'  ORDER	BY	id DESC;

-- DELETE  FROM  dj_2023_settlment_order_finance  WHERE LEFT(finance_time,7) >= '2023-12';
-- DELETE  FROM  dj_2023_settlment_order WHERE LEFT(finance_time,7) >= '2023-12';

SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-12-01';
SELECT * FROM dj_2023_settle_details WHERE settle_time >= '2023-12-01';
SELECT * FROM dj_2023_settle_details_return WHERE settle_time >= '2023-12-01';

SELECT sum(cost) FROM  dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT * FROM  dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT sum(cost) FROM  dj_2023_settlment_order WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT * FROM  dj_2022_settlment_order_06plus WHERE cus_name = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_device_details WHERE settle_merchant = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_2021_settle_details WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司' AND `return` = 0 AND LEFT(settle_time,7) =  '2023-07';
SELECT sum(hw_cost)  FROM dj_2021_settle_details WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司'  AND LEFT(settle_time,7) =  '2023-07';
SELECT sum(hw_cost)  FROM dj_2023_settle_details_return WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司'  AND LEFT(settle_time,7) =  '2023-07';

-- UPDATE dj_2023_settlment_order_finance SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
-- UPDATE dj_2023_settlment_order SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-12';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-12';

SELECT * FROM dj_2023_settlment_order WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-08' AND product_type = '硬件';
SELECT * FROM dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-08' AND product_type = '硬件';

SELECT settle_merchant_name, count(1) FROM  dj_system_merchant GROUP BY settle_merchant_name; 


SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
        FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
        WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
        ((active_time < '2023-07-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-07-01 00:00:00') OR
        (active_time >= '2023-07-01 00:00:00' AND active_time < '2023-07-31 23:59:59'))
        GROUP BY dsm.`merchant_id`;
        
SELECT * FROM  dj_2021_settle_details;        
SELECT * FROM  dj_device_details  WHERE settle_merchant LIKE '%广汇%';    


SELECT count(1) FROM  dj_2021_settle_details WHERE settle_merchant = '广汇汽车' AND LEFT(settle_time,4) = '2023' ;   

SELECT count(1) FROM  dj_2021_settle_details WHERE settle_merchant <> '广汇汽车' AND LEFT(settle_time,4) = '2023' ;   

SELECT id ,  FROM dj_2021_settle_details WHERE LEFT(settle_time,4) >= '2023' ;

SELECT 57577/6, 108920/6;

SELECT * FROM dj_device_details;
SELECT * FROM dj_2021_settle_details;

SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2023-08-01' AND cus_name  = '其他';


SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
(case when product_type='硬件' then total else 0 end) as totalx,
(total*(IFNULL(hw_unit_price,0) + IFNULL(pk_unit_price,0)+IFNULL(install_unit_price,0) )) as incomex ,cost AS costx 
 FROM dj_2023_settlment_order 
where  device_type in ('GPS','OBD') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2023-08-01' AND cus_name  = '其他';


SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
#FROM glsx_data.dj_device_details_20230801 d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
(active_time >= '2023-01-01 00:00:00' AND active_time < '2023-06-30 23:59:59'))
GROUP BY dsm.`merchant_id`;

SELECT count(1)
#FROM glsx_data.dj_device_details_20230801 d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-05-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-05-01 00:00:00') OR
(active_time >= '2023-05-01 00:00:00' AND active_time < '2023-05-31 23:59:59'));

SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司-DJ';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '武汉大智行汽车用品有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '济宁鸿昌汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '泰安鸿泰汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司1';
SELECT * FROM  dj_device_details WHERE settle_time >= '2023-08-01';

-- 回退八月份的数据 重新跑数据
CREATE TABLE dj_2021_settle_details_20231016 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20231016 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20231016;

CREATE TABLE dj_device_details_20231016 LIKE dj_device_details;
INSERT INTO dj_device_details_20231016 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20231016;

-- 回退操作
truncate TABLE  dj_2021_settle_details;
INSERT INTO dj_2021_settle_details SELECT * FROM dj_2021_settle_details_20231016;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20231016;

truncate TABLE  dj_device_details;
INSERT INTO dj_device_details SELECT * FROM dj_device_details_20231016;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20231016;

select * from dj_2023_direct_cus_active_20231219;


-- 备份12月份未激活的数据
CREATE TABLE dj_2021_settle_details_20240114 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20240114 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20240114;

CREATE TABLE dj_device_details_20240114 LIKE dj_device_details;
INSERT INTO dj_device_details_20240114 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20240114;

-- 对比 dj_2021_settle_details 表和 dj_device_details 表中的数据
select b.* from dj_device_details_20240114 a LEFT JOIN dj_device_details b ON b.sn = a.sn 
WHERE b.sn IS NULL ;

select LEFT(settle_time,7), count(1) from dj_2021_settle_details a GROUP BY LEFT(a.settle_time,7);
select LEFT(settle_time,7), count(1) from dj_device_details b GROUP BY LEFT(b.settle_time,7);

select * from dj_car_maintain;
select * from dj_car_shop_warning;
select * from ddh_rescue_event;

SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC;

SELECT DATE_FORMAT(trigger_time, '%Y-%m'),COUNT(*) FROM dj_car_shop_warning 
GROUP BY DATE_FORMAT(trigger_time, '%Y-%m') DESC;

SELECT DATE_FORMAT(EVENT_DATE, '%Y-%m'),COUNT(*) FROM ddh_rescue_event 
GROUP BY DATE_FORMAT(EVENT_DATE, '%Y-%m') DESC;

SELECT count(1) FROM  dj_car_maintain WHERE svrtime> '2023-07-01';
SELECT * FROM dj_car_maintain WHERE svrtime >= '2023-07-01'; 
SELECT * FROM dj_car_shop_warning WHERE trigger_time >= '2023-07-01'; 
SELECT * FROM ddh_rescue_event WHERE EVENT_DATE  >= '2023-07-01'; 

SELECT * FROM dj_device_details WHERE settle_time >= '2023-07-01' AND active_time IS NOT NULL ORDER BY active_time; 

-- 核对分摊
# 备份已经跑完的十一月份的数据
CREATE TABLE temp_dj_device_details_20240201 LIKE dj_2021_settle_details;
INSERT INTO temp_dj_device_details_20240201 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from temp_dj_device_details_20240201;
select * from temp_dj_device_details_20240201_settle_install_gps_ft;
select * from temp_dj_device_details_20240201_settle_install_gps_zj;

SELECT
	`id`,
	`sn`,
	`settle_time`,
	`pk_period`,
	SUM(IFNULL(hw_price, 0)+ IFNULL(pk_price, 0)+ IFNULL(install_price, 0)) AS total_price
FROM
	temp_dj_device_details_20240201
WHERE
	`device_type` IN ('8')
	AND settle_time IS NOT NULL
GROUP BY
	settle_merchant,
	LEFT(
		settle_time ,
		7
	),
	pk_period ;

SELECT
	SUM(IFNULL(hw_price, 0)+ IFNULL(pk_price, 0)+ IFNULL(install_price, 0)) AS total_price
FROM
	temp_dj_device_details_20240201
WHERE
	`device_type` IN ('8')
	AND settle_time IS NOT NULL;

SELECT DISTINCT  pk_period FROM temp_dj_device_details_20240201 ;
SELECT * FROM temp_dj_device_details_20240201 WHERE pk_period IS NULL  AND `device_type` IN ('8');

UPDATE temp_dj_device_details_20240201 SET pk_period = 12 WHERE pk_period = 0 OR pk_period IS NULL ;

SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2021_settle_details where settle_time >= '2023-01-01' and device_type in (8) and settle_merchant = '广汇汽车'


 
# 广汇 追踪器的
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本' FROM dj_2023_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车'; 
 
 
SELECT * FROM  dj_2023_settlment_order_finance
WHERE  business_type ='SAAS系统订阅服务—旧版本'
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
AND device_type in ('GPS','OBD');
 
SELECT '广汇汽车' as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost)AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
-- and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司')
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
GROUP BY  substr(finance_time,1,7),sale_type

SELECT * FROM dj_2023_settlment_order_finance WHERE device_type in ('GPS','OBD') and product_type in ('服务') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');
 
SELECT * FROM dj_2023_settlment_order WHERE device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司'); 
 
SELECT * FROM dj_2023_settlment_order WHERE device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司') AND pk_unit_price IS NOT NULL AND pk_unit_price <> 0;  
 
 
# 广汇 追踪器的
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本' FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车';  
 
 
SELECT LEFT(settle_time,10), count(1)  FROM  dj_2021_settle_details 
WHERE device_type = 8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车'
GROUP BY LEFT(settle_time,10) ;

-- glsx_biz_data.dj_2021_settle_details definition

CREATE TABLE `dj_2023_installation_fee_backfill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `business_date`  varchar(64) DEFAULT NULL COMMENT '业务日期 yyyy-mm',
  `unit_price`  float(12,4) DEFAULT '0.0000' COMMENT '不含税单价',
  `num`  int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='安装费用回填表';

SELECT * FROM dj_2023_installation_fee_backfill;
SELECT sum(num) FROM dj_2023_installation_fee_backfill;
INSERT INTO dj_2023_installation_fee_backfill (`business_date`,`unit_price`,`num`)
VALUES
('2023-01',17.70,328),
('2023-01',44.25,709),
('2023-02',17.70,159),
('2023-02',44.25,436),
('2023-03',17.70,112),
('2023-03',44.25,432),
('2023-04',17.70,128),
('2023-04',44.25,391),
('2023-05',17.70,174),
('2023-05',44.25,303),
('2023-06',17.70,166),
('2023-06',44.25,335),
('2023-07',17.70,156),
('2023-07',44.25,307),
('2023-08',17.70,82),
('2023-08',44.25,337),
('2023-09',17.70,74),
('2023-09',44.25,330),
('2023-10',17.70,37),
('2023-10',44.25,332),
('2023-11',17.70,65),
('2023-11',44.25,292),
('2023-12',17.70,34),
('2023-12',44.25,201);


-- 备份12月份已经激活的数据
CREATE TABLE dj_2021_settle_details_20240204 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20240204 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20240204;

CREATE TABLE dj_device_details_20240204 LIKE dj_device_details;
INSERT INTO dj_device_details_20240204 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20240204;

-- 还原已经激活的数据
-- DROP TABLE dj_2021_settle_details;
CREATE TABLE dj_2021_settle_details LIKE dj_2021_settle_details_20240204;
INSERT INTO dj_2021_settle_details SELECT * FROM dj_2021_settle_details_20240204;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20240204;

-- DROP TABLE dj_device_details;
CREATE TABLE dj_device_details LIKE dj_device_details_20240204;
INSERT INTO dj_device_details SELECT * FROM dj_device_details_20240204;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20240204;

# 广汇 追踪器的
SELECT *  FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' AND  install_price IS NOT NULL AND install_price <> 0;  

SELECT id ,install_cost , install_price ,settle_time ,sn ,settle_merchant,device_type FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车'; 

SELECT *  FROM dj_device_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' AND  install_price IS NOT NULL AND install_price <> 0;  

SELECT *  FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' 
AND  install_cost IS NOT NULL AND install_cost <> 0;  

 SELECT id , install_cost ,install_price ,settle_time ,sn ,settle_merchant,device_type FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' 
and (install_cost is null or install_cost = 0)

 SELECT id , install_cost ,install_price ,settle_time ,sn ,settle_merchant,device_type FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' 
and (install_cost is NOT null or install_cost <> 0)

SELECT id , install_cost ,install_price ,settle_time ,sn ,settle_merchant,device_type FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' and left(settle_time,7) = '2023-07'
and (install_cost is null or install_cost = 0) 

SELECT id , install_cost ,install_price ,settle_time ,sn ,settle_merchant,device_type FROM dj_2021_settle_details
where device_type =8 AND settle_time >= '2023-01-01' and settle_merchant = '广汇汽车' and left(settle_time,7) = '2023-12'
and (install_cost is null or install_cost = 0) limit 34;

-- 同步安装成本的修改
SELECT a.install_cost ,b.install_cost FROM dj_2021_settle_details a LEFT JOIN 
dj_device_details b ON b.sn = a.sn WHERE a.install_cost IS NOT NULL 
AND a.device_type =8 AND a.settle_time >= '2023-01-01' and a.settle_merchant = '广汇汽车';

UPDATE dj_2021_settle_details a LEFT JOIN 
dj_device_details b ON b.sn = a.sn  
SET b.install_cost = a.install_cost 
WHERE a.install_cost IS NOT NULL 
AND a.device_type =8 AND a.settle_time >= '2023-01-01' and a.settle_merchant = '广汇汽车';

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


