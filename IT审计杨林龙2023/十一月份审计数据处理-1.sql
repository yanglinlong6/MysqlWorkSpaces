# 备份已经跑完的七月份的数据
CREATE TABLE dj_2021_settle_details_20231016 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20231016 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20231016;

CREATE TABLE dj_device_details_20231016 LIKE dj_device_details;
INSERT INTO dj_device_details_20231016 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20231016;

SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-08'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order a WHERE LEFT(a.finance_time,7) >= '2023-08'  ORDER	BY	id DESC;

-- DELETE  FROM  dj_2023_settlment_order_finance  WHERE LEFT(finance_time,7) >= '2023-08';
-- DELETE  FROM  dj_2023_settlment_order WHERE LEFT(finance_time,7) >= '2023-08';

SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-08-01';
SELECT * FROM dj_2023_settle_details WHERE settle_time >= '2023-08-01';
SELECT * FROM dj_2023_settle_details_return WHERE settle_time >= '2023-08-01';

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
select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-08';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-08';

SELECT * FROM dj_2023_settlment_order WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-08' AND product_type = '硬件';
SELECT * FROM dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-08' AND product_type = '硬件';

SELECT settle_merchant_name, count(1) FROM  dj_system_merchant GROUP BY settle_merchant_name; 


SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
        FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
        WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
        ((active_time < '2023-07-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-07-01 00:00:00') OR
        (active_time >= '2023-07-01 00:00:00' AND active_time < '2023-07-31 23:59:59'))
        GROUP BY dsm.`merchant_id`
        
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

SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司-DJ';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '武汉大智行汽车用品有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '济宁鸿昌汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '泰安鸿泰汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司1';
SELECT * FROM  dj_device_details WHERE settle_time >= '2023-08-01';



