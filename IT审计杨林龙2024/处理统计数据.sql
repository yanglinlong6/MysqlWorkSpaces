-- 业务线：智慧门店
-- 门店名称：商户名称
-- 开始合作时间：首单激活时间/首单结算时间
-- 订单数量：设备数量
-- 订单金额：硬件+服务+安装
-- 2022只统计2022年的

SELECT '智慧门店' AS '业务线',
settle_merchant AS '门店名称',
LEAST(ifnull(min(active_time),'2022-12-31 11:59:59'),ifnull(min(settle_time),'2022-12-31 11:59:59')) AS '开始合作时间', 
count(1) AS '订单数量',
sum(ifnull(install_price,0) +ifnull(pk_price,0) +ifnull(hw_price,0)) AS '订单金额'
FROM dj_device_details ddd 
WHERE LEFT(settle_time,4)='2022' GROUP BY settle_merchant ORDER BY settle_time ; 

SELECT '智慧门店' AS '业务线',
settle_merchant AS '门店名称',
LEAST(ifnull(min(active_time),'2022-12-31 11:59:59'),ifnull(min(settle_time),'2022-12-31 11:59:59')) AS '开始合作时间', 
count(1) AS '订单数量',
sum(ifnull(install_price,0) +ifnull(pk_price,0) +ifnull(hw_price,0)) AS '订单金额'
FROM dj_device_details ddd 
WHERE LEFT(settle_time,4)='2022' AND settle_merchant = '杭州天一汽车有限公司' GROUP BY settle_merchant ORDER BY settle_time ; 

SELECT * FROM dj_device_details WHERE settle_merchant = '广州远晟汽车服务有限公司' 
AND LEFT(settle_time,4)='2022'  ORDER BY settle_time ;

SELECT min(active_time),min(settle_time),LEAST(min(active_time),min(settle_time))  
FROM dj_device_details WHERE LEFT(settle_time,4)='2022' 
AND settle_merchant = '杭州天一汽车有限公司';

SELECT active_time,settle_time FROM dj_device_details WHERE LEFT(settle_time,4)='2022' 
AND settle_merchant = '上海泓合科技服务有限公司';

SELECT LEAST('2023-01-01 10:00:00', '2023-01-02 09:00:00') AS min_time;

