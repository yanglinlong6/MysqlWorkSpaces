SELECT *FROM dj_2021_settle_details_return WHERE settle_merchant  = '福建省联合车尚贸易有限公司';
SELECT *FROM dj_2021_settle_details WHERE settle_merchant  = '零售/电商客户' AND LEFT(settle_time,7)='2022-05' ;
SELECT *FROM dj_2023_settle_details WHERE settle_merchant  = '零售/电商客户' AND LEFT(settle_time,7)='2022-05' ;

select settle_merchant,case when device_type=8 then '追踪器' when device_type=6 then '记录仪' when device_type=12501 then '车充' end,
pk_period,DATE_FORMAT(settle_time, '%Y-%m') as settle_month,COUNT(1) as count,
sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0) ) as amount, channel ,id 
from dj_2021_settle_details_return where  settle_time < '2023-05-01 00:00:00' and device_type = 8 
GROUP BY settle_merchant,device_type,pk_period,DATE_FORMAT(settle_time, '%Y-%m'),channel 
order by settle_merchant,settle_month;

select settle_merchant,case when device_type=8 then '追踪器' when device_type=6 then '记录仪' when device_type=12501 then '车充' end,
pk_period,DATE_FORMAT(settle_time, '%Y-%m') as settle_month,
DATE_FORMAT(active_time,'%Y-%m') as active_month,COUNT(1) as count,
sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0) ) as amount, channel, 
case when `return`=1 then '退货' else '正常' end ,id 
from dj_2021_settle_details where  settle_time < '2023-05-01 00:00:00' and device_type = 8 
GROUP BY settle_merchant,device_type,pk_period,DATE_FORMAT(settle_time, '%Y-%m'),DATE_FORMAT(active_time,'%Y-%m'),channel,`return`
order by settle_merchant,settle_month;

SELECT *FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01' AND hw_cost = 0;
SELECT *FROM dj_2021_settle_details_return WHERE settle_time > '2023-01-01';

SELECT * FROM dj_2021_settle_details WHERE settle_time < '2023-01-01';
SELECT * FROM dj_2021_settle_details WHERE settle_time > '2023-01-01';

SELECT *FROM dj_2023_settle_details_record;
SELECT *FROM dj_2023_settle_details;

SELECT * FROM dj_2023_settle_details;
UPDATE dj_2023_settle_details SET hw_cost = cost WHERE 1= 1;
SELECT * FROM dj_2023_settle_details_record;
UPDATE dj_2023_settle_details_record SET hw_cost = cost WHERE 1= 1;
SELECT * FROM dj_2023_settle_details_return;
UPDATE dj_2023_settle_details_return SET hw_cost = cost WHERE 1= 1;
SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-01-01';
UPDATE dj_2021_settle_details SET hw_cost = cost WHERE settle_time >= '2023-01-01';
SELECT *FROM dj_2021_settle_details_return WHERE settle_time >= '2023-01-01';
UPDATE dj_2021_settle_details_return SET hw_cost = cost WHERE settle_time >= '2023-01-01';

SELECT DISTINCT settle_merchant  FROM dj_2021_settle_details_20230706 WHERE `return` = 1 AND sn IN (SELECT sn FROM dj_2021_settle_details WHERE `return` = 0);
SELECT DISTINCT settle_merchant FROM dj_2021_settle_details_20230706 WHERE `return` = 1 AND sn IN (SELECT sn FROM dj_2021_settle_details_20230704 WHERE `return` = 0);

UPDATE dj_2021_settle_details SET `return` =  1 WHERE id IN (
SELECT id  FROM dj_2021_settle_details_20230703 WHERE `return` = 1 AND sn IN (SELECT sn FROM dj_2021_settle_details_20230704 WHERE `return` = 0)
);



SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 102.6549 and pk_price = 35.3982 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 129.2035 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 136.2832 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 137.1681 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 151.3274 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 154.8673 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 155.7522 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 161.9469 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 168.1416 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 201.7699 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 238.9381 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 259.292  and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;
SELECT count(1) FROM  dj_2021_settle_details WHERE hw_price = 281.4159 and pk_price = 17.6991 AND channel='直销' AND LEFT(settle_time,7) in ('2022-01','2022-02')  AND `device_type` IN (6,12501) and pk_period = 12;


SELECT * FROM dj_2023_direct_cus_active_20230603 WHERE customer  = '济南新中兴汽车用品有限责任公司'; 

SELECT sum(active_202201)  FROM dj_2023_direct_cus_active_20230603 ;


SELECT * FROM dj_2023_settlment_order WHERE business_type = 'SAAS系统订阅服务—旧版本' AND device_type IN ('记录仪','OBD') AND product_type = '硬件';
SELECT * FROM dj_2023_settlment_order_finance WHERE business_type = 'SAAS系统订阅服务—旧版本' AND device_type IN ('记录仪','OBD') AND product_type = '硬件';

SELECT DISTINCT pk_period FROM dj_2021_settle_details where device_type IN (6,12501) and active_time IS NULL AND `return` = 0;
SELECT DISTINCT pk_period FROM dj_2023_settle_details_record where device_type IN (6,12501) and active_time IS NULL;
SELECT * FROM dj_2023_settle_details_record where device_type IN (6,12501) and active_time IS NOT NULL;
SELECT * FROM dj_2023_settle_details_record WHERE pk_period = 0;

SELECT DISTINCT  install_price  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);

SELECT sum(ifnull(hw_price,0)+ifnull(pk_period,0)+ifnull(install_price,0))  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(hw_price,0))  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(pk_period,0))  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(install_price,0))  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(hw_price,0)+ifnull(pk_period,0)+ifnull(install_price,0))   FROM dj_device_details ddd  WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(hw_price,0))  FROM dj_device_details ddd  WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(pk_period,0))  FROM dj_device_details ddd  WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(install_price,0))  FROM dj_device_details ddd  WHERE `device_type` IN (6,12501);

SELECT sum(ifnull(hw_price,0)+ifnull(pk_period,0)+ifnull(install_price,0))  FROM dj_2021_settle_details
WHERE `device_type` IN (8) AND settle_time < '2023-01-01';

SELECT sum(ifnull(hw_price,0))  FROM dj_2021_settle_details
WHERE  settle_time < '2023-01-01';

SELECT  91391161.6799 -  91391161.7714;

SELECT sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0))  FROM dj_device_details_20230703  WHERE `device_type` IN (6,12501);
SELECT sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0))  FROM dj_2021_settle_details WHERE `device_type` IN (6,12501) AND settle_time < '2023-01-01';


SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)),count(1) num  FROM  dj_2021_settle_details 
WHERE  settle_time < '2023-01-01' AND `device_type` IN (8) GROUP BY LEFT(settle_time,4) ;
SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)),count(1) num  FROM dj_device_details_20230703
WHERE `device_type` IN (8) GROUP BY LEFT(settle_time,4) ;

SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)),count(1) num  FROM  dj_2021_settle_details 
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;
SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)+ifnull(pk_price,0)+ifnull(install_price,0)),count(1) num  FROM dj_device_details
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;

SELECT A.yeartime,A.total_price,A.num ,B.total_price,B.num,(B.total_price -A.total_price) AS gop_price,(B.num -A.num) AS gop_num  FROM
(SELECT LEFT(settle_time,4) AS yeartime,sum(ifnull(hw_price,0)) AS total_price ,count(1) num  FROM  dj_2021_settle_details 
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4)) AS A 
LEFT JOIN
(SELECT LEFT(settle_time,4) AS yeartime ,sum(ifnull(hw_price,0)) AS total_price ,count(1) num  FROM dj_device_details
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4)) AS B ON (B.yeartime = A.yeartime);

SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)),count(1) num  FROM  dj_2021_settle_details 
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;
SELECT LEFT(settle_time,4),sum(ifnull(hw_price,0)),count(1) num  FROM dj_device_details
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;

SELECT LEFT(settle_time,4),sum(ifnull(pk_price,0)),count(1) num  FROM  dj_2021_settle_details 
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;
SELECT LEFT(settle_time,4),sum(ifnull(pk_price,0)),count(1) num  FROM dj_device_details
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;

SELECT LEFT(settle_time,4),sum(ifnull(install_price,0)),count(1) num  FROM  dj_2021_settle_details 
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;
SELECT LEFT(settle_time,4),sum(ifnull(install_price,0)),count(1) num  FROM dj_device_details
WHERE `device_type` IN (6,12501) GROUP BY LEFT(settle_time,4) ;

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

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号',
case when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本' ,case when `return`=1 then '退货' else '正常' END AS '是否退货'
FROM dj_2021_settle_details WHERE `device_type` IN (6,12501);

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号',
case when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本' ,case when `return`=1 then '退货' else '正常' END AS '是否退货'
FROM dj_2021_settle_details_20230707 WHERE `device_type` IN (6,12501);

SELECT * FROM temp_dj_device_details_modify_serins_record_ft; 
SELECT * FROM temp_dj_device_details_modify_serins_record_zj; 
SELECT * FROM temp_dj_device_details_modify_serins; 

-- DROP TABLE temp_dj_device_details_modify_serins;
-- 已微调 (已经核对完)
CREATE TABLE temp_dj_device_details_modify_serins LIKE dj_2021_settle_details;
INSERT INTO temp_dj_device_details_modify_serins SELECT * FROM dj_2021_settle_details;
-- 未微调
CREATE TABLE temp_dj_device_details_modify_serins LIKE dj_2021_settle_details_20230707 ;
INSERT INTO temp_dj_device_details_modify_serins SELECT * FROM dj_2021_settle_details_20230707;

select count(1)  from dj_2021_settle_details;
select count(1) from temp_dj_device_details_modify_serins;

ALTER TABLE temp_dj_device_details_modify_serins ADD COLUMN `fentan_time` datetime DEFAULT NULL COMMENT '分摊时间' AFTER install_cost;
UPDATE temp_dj_device_details_modify_serins SET fentan_time = settle_time WHERE channel <> '渠道';
UPDATE temp_dj_device_details_modify_serins SET fentan_time = active_time WHERE channel = '渠道';
UPDATE temp_dj_device_details_modify_serins SET pk_period = 12 WHERE pk_period = 0 OR pk_period IS NULL;
UPDATE temp_dj_device_details_modify_serins SET pk_price = 0 WHERE pk_price IS NULL;
UPDATE temp_dj_device_details_modify_serins SET active_merchant = '激活客户' WHERE active_merchant IS NULL;
UPDATE temp_dj_device_details_modify_serins SET active_merchant = '激活客户' WHERE active_merchant = '';


SELECT * FROM temp_dj_device_details_modify_serins;
SELECT min(settle_time)  FROM temp_dj_device_details_modify_serins WHERE `device_type` IN (6,12501);


set @yearStart = '2022-01-01';
set @yearEnd = '2023-01-01';
SELECT count(DISTINCT active_merchant) from dj_2021_settle_details where active_merchant <> '' and 
((active_time < @yearStart and DATE_ADD(active_time,INTERVAL pk_period MONTH) > @yearEnd) or 
active_time >= @yearStart and active_time < @yearEnd);


SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
(active_time >= '2023-01-01 00:00:00' AND active_time < '2023-01-31 23:59:59'));

SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-02-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-02-01 00:00:00') OR
(active_time >= '2023-02-01 00:00:00' AND active_time < '2023-02-30 23:59:59'));

SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-03-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-03-01 00:00:00') OR
(active_time >= '2023-03-01 00:00:00' AND active_time < '2023-03-31 23:59:59'));

SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-04-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-04-01 00:00:00') OR
(active_time >= '2023-04-01 00:00:00' AND active_time < '2023-04-30 23:59:59'));

SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-05-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-05-01 00:00:00') OR
(active_time >= '2023-05-01 00:00:00' AND active_time < '2023-05-31 23:59:59'));

SELECT count(1) 
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-06-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-06-01 00:00:00') OR
(active_time >= '2023-06-01 00:00:00' AND active_time < '2023-06-30 23:59:59'));





























