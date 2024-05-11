# 新建2024年审计相关表
CREATE TABLE dj_2024_settlment_order_finance LIKE dj_2023_settlment_order_finance;
CREATE TABLE dj_2024_settlment_order LIKE dj_2023_settlment_order;
CREATE TABLE dj_2024_settle_details LIKE dj_2023_settle_details;
CREATE TABLE dj_2024_settle_details_record LIKE dj_2023_settle_details_record;
CREATE TABLE dj_2024_settle_details_return LIKE dj_2023_settle_details_return;

SELECT * FROM dj_2024_settle_details;
SELECT * FROM dj_2024_settle_details_record;
SELECT * FROM dj_2024_settle_details_return;


SELECT * FROM  dj_2024_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2024-01'  ORDER	BY	id DESC;
SELECT * FROM  dj_2024_settlment_order b WHERE LEFT(b.finance_time,7) >= '2024-01'  ORDER	BY	id DESC;

SELECT * FROM dj_2024_settlment_order_finance WHERE product_name LIKE '%无忧卡%';
SELECT * FROM dj_2024_settlment_order WHERE product_name LIKE '%无忧卡%';
SELECT * FROM dj_2024_settlment_order_finance WHERE cus_name = '遵义市千汇汽车销售服务有限公司';
SELECT * FROM dj_2024_settlment_order WHERE cus_name = '遵义市千汇汽车销售服务有限公司';



SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-04'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order b WHERE LEFT(b.finance_time,7) >= '2023-01'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order b WHERE LEFT(b.finance_time,7) >= '2023-01' AND b.id > 274 ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order b WHERE LEFT(b.finance_time,7) >= '2023-01' AND b.id > 578 ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order b WHERE LEFT(b.finance_time,7) >= '2023-04' AND b.id > 3120 ORDER BY	id DESC;
select DISTINCT alloc from dj_2021_delivery_device WHERE sn IN (
SELECT sn FROM dj_2023_settle_details_record dsdr  where settle_time >= '2023-01-01' and settle_time < '2023-12-31' and is_virtual = 0
);


-- 回退脚本
update dj_2021_settle_details set `return` = 0 where sn in (SELECT sn from dj_2023_settle_details_return where settle_time >= '2023-01-01');
SELECT DISTINCT  `return` FROM dj_2021_settle_details  where sn in (SELECT sn from dj_2023_settle_details_return where settle_time >= '2023-01-01');
DELETE from dj_2021_settle_details where settle_time >= '2023-01-01';
SELECT * from dj_2021_settle_details where settle_time >= '2023-01-01';

DELETE from dj_2023_settle_details where settle_time >= '2023-01-01'; 
DELETE from dj_2023_settle_details_record where settle_time >= '2023-01-01' ;
DELETE from  dj_2023_settle_details_return where settle_time >= '2023-01-01' ;
DELETE from dj_2023_settlment_order WHERE finance_time >= '2023-01-01' and finance_time <= '2023-04-30';
DELETE from dj_2023_settlment_order_finance WHERE finance_time >= '2023-01-01' and finance_time <= '2023-04-30';
update dj_2023_settlment_order set match_total=NULL,`status`=0 where finance_time >= '2023-01-01'  and finance_time <= '2023-04-30';

truncate TABLE  dj_2023_settle_details;
-- SELECT * FROM dj_2023_settlment_order_finance;
truncate TABLE  dj_2023_settle_details_record;
truncate TABLE  dj_2023_settle_details_return;
truncate TABLE  dj_2023_settlment_order;
truncate TABLE  dj_2023_settlment_order_finance;

SELECT * FROM dj_2023_settlment_order WHERE product_type = '硬件' AND device_type = '其他';
SELECT * FROM dj_2023_settlment_order_finance WHERE product_type = '硬件' AND device_type = '其他';
SELECT * FROM dj_2023_settlment_order_finance WHERE product_type = '硬件' AND device_type = '记录仪' AND total = 400;
SELECT device_type,count(1) num  FROM dj_2023_settlment_order GROUP	BY	device_type;
SELECT device_type,count(1) num  FROM dj_2023_settle_details_record GROUP	BY	device_type;

SELECT * FROM dj_2023_settlment_order a WHERE  a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND a.status = 0 ;

SELECT sum(total)  FROM dj_2023_settlment_order a WHERE  a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND a.status = 1 ;

SELECT COUNT(1) as total  from dj_2023_settle_details where settle_time >= '2023-01-01' and device_type = 8;
SELECT COUNT(1) as total  from dj_2023_settle_details_record where settle_time >= '2023-01-01' and device_type in (6,12501);

UPDATE dj_2023_settlment_order_finance SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
UPDATE dj_2023_settlment_order SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';

select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%';


SELECT * FROM dj_2023_settlment_order WHERE cus_name LIKE '%遵义%';
SELECT * FROM dj_2023_settlment_order_finance WHERE cus_name LIKE '%遵义%';

SELECT *FROM dj_system_merchant WHERE merchant_name LIKE '%遵义%';


insert into dj_device_details (channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost) 
SELECT channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost from dj_2021_settle_details where settle_time >= '2023-08-01 00:00:00';

-- DELETE FROM	dj_device_details WHERE settle_time >= '2023-08-01 00:00:00';

SELECT * FROM dj_device_details WHERE settle_time >= '2023-08-01 00:00:00' AND  active_time IS NULL ;
-- DELETE FROM dj_device_details WHERE settle_time >= '2023-01-01 00:00:00';
SELECT * FROM dj_2023_settle_details;
SELECT * FROM dj_2023_settle_details_record;

SELECT LEFT(settle_time,7), count(1)  FROM dj_2021_settle_details WHERE active_time IS NULL  GROUP BY LEFT(settle_time,7);
SELECT LEFT(settle_time,7), count(1)  FROM dj_device_details WHERE active_time IS NULL GROUP BY LEFT(settle_time,7) ;

SELECT * FROM dj_2021_settle_details WHERE sn IN (
SELECT sn FROM dj_device_details WHERE active_time IS NULL) ;

SELECT * FROM dj_device_details WHERE active_time IS NULL AND sn IN (
SELECT sn FROM dj_2021_settle_details WHERE active_time IS NOT NULL) ;

SELECT * FROM  dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn 
WHERE a.active_time IS NULL AND	b.active_time IS NOT NULL ; 

-- 更新激活设备 
UPDATE dj_device_details a LEFT JOIN dj_2021_settle_details b ON b.sn = a.sn SET a.active_time = b.active_time 
WHERE a.active_time IS NULL AND	b.active_time IS NOT NULL ; 

-- DROP TABLE dj_device_details;
CREATE TABLE dj_device_details_20230703 LIKE  dj_device_details;
INSERT INTO dj_device_details_20230703 SELECT * FROM dj_device_details;
-- SELECT * FROM  dj_device_details;

-- DROP TABLE dj_device_details_return;
CREATE TABLE dj_device_details_return_20230703 LIKE  dj_device_details_return;
INSERT INTO dj_device_details_return_20230703 SELECT * FROM dj_device_details_return;
-- SELECT * FROM  dj_device_details_return_20230703;

SELECT a.channel,a.settle_merchant ,LEFT(a.settle_time,7),count(1) AS num  
from dj_2021_settle_details a where a.settle_time >= '2023-01-01' GROUP BY a.channel ,a.settle_merchant ,LEFT(a.settle_time,7) ;

SELECT count(1) FROM dj_2021_settle_details;
SELECT sn,count(1) AS num FROM dj_device_details GROUP BY sn HAVING  num > 1;
SELECT sn,count(1) AS num FROM dj_2021_settle_details GROUP BY sn HAVING  num > 1;
SELECT sn,count(1) AS num FROM dj_2021_settle_details where settle_time < '2023-01-01' GROUP BY sn HAVING  num > 1;
SELECT * FROM dj_2021_settle_details WHERE sn = '1921101001';
SELECT * FROM dj_2021_settle_details WHERE id = 0;

SELECT DISTINCT  sn FROM dj_2021_settle_details a where a.settle_time >= '2023-01-01'  AND a.sn IN (
SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details GROUP BY	sn HAVING  num > 1) temp
);

SELECT DISTINCT  sn FROM dj_2023_settle_details_return a where a.settle_time >= '2023-01-01' AND a.is_virtual = 0 AND a.sn IN (
SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details GROUP BY	sn HAVING  num > 1) temp
);

SELECT DISTINCT sn,alloc FROM dj_2021_delivery_device   WHERE  sn IN (
SELECT sn FROM dj_2021_settle_details a where a.settle_time >= '2023-01-01' AND a.is_virtual = 0
);

-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (8) GROUP BY	sn HAVING  num > 1) temp;
-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (6,12501) GROUP BY sn HAVING  num > 1) temp;
-- 
-- UPDATE  dj_2021_settle_details SET sn = REPLACE(sn,'1921','1941') WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (8) GROUP BY	sn HAVING  num > 1) temp
-- );
-- 
-- UPDATE  dj_2023_settle_details SET sn = REPLACE(sn,'1921','1941') WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (8) GROUP BY	sn HAVING  num > 1) temp
-- );
-- 
-- SELECT sn ,REPLACE(sn,'1921','1941') FROM dj_2023_settle_details  WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn, count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (8) GROUP BY sn HAVING  num > 1) temp
-- );
-- 
-- UPDATE  dj_2021_settle_details SET sn = REPLACE(sn,'SH23G22','SH23G24') WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (6,12501) GROUP BY	sn HAVING  num > 1) temp
-- );
-- 
-- UPDATE  dj_2023_settle_details_record SET sn = REPLACE(sn,'SH23G22','SH23G24') WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn,count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (6,12501) GROUP BY	sn HAVING  num > 1) temp
-- );
-- 
-- SELECT sn ,REPLACE(sn,'SH23G22','SH23G24') FROM dj_2023_settle_details_record  WHERE settle_time >= '2023-01-01' AND sn IN (
-- SELECT sn FROM (SELECT sn, count(1) AS num FROM dj_2021_settle_details WHERE device_type IN (6,12501) GROUP BY sn HAVING  num > 1) temp
-- );

SELECT *  FROM  dj_2023_settle_details_record b WHERE LEFT(sn,7) = 'SH23G24'; 
SELECT *  FROM  dj_2023_settle_details a WHERE LEFT(sn,4) = '1941'; 

SELECT * FROM  dj_2021_settle_details WHERE LEFT(sn,7) = 'SH23G24';
SELECT * FROM  dj_2023_settle_details a WHERE LEFT(sn,4) = '1941'; 

SELECT * FROM  dj_device_details WHERE sn = 17303280399;

SELECT * FROM  dj_2023_settle_details_record WHERE sn = 'SH23G2412150001';
SELECT * FROM  dj_2021_settle_details WHERE sn = 'SH23G2412150001';
SELECT * FROM  dj_2021_settle_details WHERE is_virtual = 0;

SELECT * FROM  dj_2021_delivery_device WHERE sn = '17303280399';
SELECT * FROM  dj_2021_delivery_device_record WHERE sn = 'SH23G2412150001';
SELECT * FROM  dj_2021_delivery_device WHERE update_time >= '2023-01-01';
SELECT * FROM  dj_2021_delivery_device_record WHERE update_time >= '2023-01-01';
SELECT * FROM  dj_2021_settlemer_relation;

select customer,active_202101,active_202102,active_202103,active_202104,active_202105,active_202106,
active_202107,active_202108,active_202109,active_202110,active_202111,active_202112 from dj_2022_direct_cus_active_0212;

-- SELECT * FROM  dj_2021_settle_details;

CREATE TABLE dj_2023_direct_cus_active_20230603 LIKE dj_2022_direct_cus_active_0212;
-- truncate TABLE  dj_2023_direct_cus_active_20230603;
SELECT * FROM dj_2023_direct_cus_active_20230603;
-- DROP TABLE dj_2023_direct_cus_active_20230603;

CREATE TABLE `dj_2023_direct_cus_active_20230603` (
  `customer` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202112` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202201` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202201` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202201` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202202` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202202` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202202` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202203` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202203` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202203` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202204` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202204` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202204` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202205` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202205` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202205` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202206` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202206` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202206` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202207` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202207` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202207` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202208` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202208` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202208` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202209` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202209` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202209` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202210` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202210` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202210` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202211` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202211` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202211` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `settle_202212` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unactive_202212` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `active_202212` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AM` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AN` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

SELECT DISTINCT settle_merchant  FROM dj_2021_settle_details WHERE settle_merchant LIKE  '%贵州车%';

SELECT * FROM dj_device_details; 	