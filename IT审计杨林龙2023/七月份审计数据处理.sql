# 备份已经跑完的六月份的数据
CREATE TABLE dj_2021_settle_details_20230821 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230821 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230821;

CREATE TABLE dj_device_details_20230821 LIKE dj_device_details;
INSERT INTO dj_device_details_20230821 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20230821;

SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-07'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order a WHERE LEFT(a.finance_time,7) >= '2023-07'  ORDER	BY	id DESC;

-- DELETE  FROM  dj_2023_settlment_order_finance  WHERE LEFT(finance_time,7) >= '2023-07';
-- DELETE  FROM  dj_2023_settlment_order WHERE LEFT(finance_time,7) >= '2023-07';

SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-07-01';

SELECT sum(cost) FROM  dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT * FROM  dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT sum(cost) FROM  dj_2023_settlment_order WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件' AND total > 0;
SELECT * FROM  dj_2022_settlment_order_06plus WHERE cus_name = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_device_details WHERE settle_merchant = '河北酷嘉汽车服务有限公司';
SELECT *  FROM dj_2021_settle_details WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司' AND `return` = 0 AND LEFT(settle_time,7) =  '2023-07';
SELECT sum(hw_cost)  FROM dj_2021_settle_details WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司'  AND LEFT(settle_time,7) =  '2023-07';
SELECT sum(hw_cost)  FROM dj_2023_settle_details_return WHERE settle_merchant = '云南隆创尚通汽车销售服务有限公司'  AND LEFT(settle_time,7) =  '2023-07';

-- UPDATE dj_2023_settlment_order_finance SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
-- UPDATE dj_2023_settlment_order SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-07';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-07';

SELECT * FROM 	dj_2023_settlment_order WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件';
SELECT * FROM  dj_2023_settlment_order_finance WHERE cus_name = '云南隆创尚通汽车销售服务有限公司' AND LEFT(finance_time,7) = '2023-07' AND product_type = '硬件';

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


