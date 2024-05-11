SELECT COUNT(1) FROM dj_device_details_return;
SELECT COUNT(1) FROM dj_device_details_return_20230724;

SELECT * FROM dj_2023_settle_details_return;
SELECT * FROM dj_device_details_return;

-- 合并2023年退货数据到生产退货表
INSERT INTO dj_device_details_return (channel,sn,device_type,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,install_cost)
SELECT channel,sn,device_type,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,install_cost
FROM dj_2023_settle_details_return;

SELECT * FROM dj_system_merchant;
-- DROP TABLE dj_system_merchant_20230725;
-- DROP TABLE dj_system_merchant;
CREATE TABLE dj_system_merchant_20230725 LIKE dj_system_merchant;
INSERT INTO dj_system_merchant_20230725 SELECT * FROM dj_system_merchant;
SELECT COUNT(1) FROM dj_system_merchant;
SELECT COUNT(1) FROM dj_system_merchant_20230725;

SELECT * FROM dj_2023_settlment_order;
SELECT * FROM dj_device_details ddd ;

-- 备份数据
-- DROP TABLE dj_car_maintain;
CREATE TABLE dj_car_maintain_20230727 LIKE dj_car_maintain;
INSERT INTO dj_car_maintain_20230727 SELECT * FROM dj_car_maintain;
select count(1) from dj_car_maintain;
select count(1) from dj_car_maintain_20230727;

-- DROP TABLE dj_car_shop_warning;
CREATE TABLE dj_car_shop_warning_20230727 LIKE dj_car_shop_warning;
INSERT INTO dj_car_shop_warning_20230727 SELECT * FROM dj_car_shop_warning;
select count(1) from dj_car_shop_warning;
select count(1) from dj_car_shop_warning_20230727;

alter table dj_car_shop_warning
drop column plate_number,
drop column name,
drop column mobile,
drop column vehicle_id;

-- DROP TABLE ddh_rescue_event;
CREATE TABLE ddh_rescue_event_20230727 LIKE ddh_rescue_event;
INSERT INTO ddh_rescue_event_20230727 SELECT * FROM ddh_rescue_event;
select count(1) from ddh_rescue_event;
select count(1) from ddh_rescue_event_20230727;

alter table ddh_rescue_event
drop column DEVICE_NAME,
drop column SPEED,
drop column HANDLE_RESULT,
drop column HANDLE_DATE,
drop column REMIND_FLAG,
drop column SYNC_FLAG,
drop column SYNC_DATE,
drop column OUTBOUND_MEMBER_ID,
drop column OUTBOUND_RESULT,
drop column OUTBOUND_RESULT_DATE,
drop column REMARK,
drop column ACCURATE,
drop column is_emphasis_merchant,
drop column is_show,
drop column DEVICE_ID,
drop column model_result;


SELECT count(1) FROM dj_car_collision;
SELECT * FROM dj_car_collision;

SELECT * FROM  dj_car_maintain WHERE svrtime> '2023-01-01';
SELECT count(1) FROM dj_car_maintain WHERE svrtime >= '2023-01-01'; 
SELECT count(1) FROM dj_car_shop_warning WHERE trigger_time >= '2023-01-01'; 
SELECT count(1) FROM ddh_rescue_event WHERE EVENT_DATE  >= '2023-01-01'; 
select merchant_name,settle_merchant_name from dj_system_merchant where settle_merchant_name <>'' AND settle_merchant_name = '上海镕谊商务咨询有限公司';

SELECT * FROM dj_2023_settlment_order_1;
SELECT * FROM dj_device_details_2306_dtt;

select cus_name,finance_time,sale_type,device_type,total,pk_name,pk_term,hw_unit_price,
pk_unit_price,install_unit_price,id from dj_2023_settlment_order_1 where match_status =0 and total > 0
and product_type = '硬件' and device_type in ('记录仪','车充','GPS', 'OBD')
order by finance_time,cus_name,device_type;

SELECT * FROM dj_2023_settlment_order_1 WHERE cus_name = '上海镕谊商务咨询有限公司';
SELECT * FROM dj_2023_settlment_order WHERE business_type = 'SAAS系统订阅服务—旧版本';
-- DELETE FROM dj_2023_settlment_order WHERE business_type <> 'SAAS系统订阅服务—旧版本';

-- 'SAAS系统订阅服务—旧版本'

SELECT * FROM  dj_2023_settlment_order WHERE cus_name = '其他'; 
-- UPDATE  dj_2023_settlment_order SET sale_type ='渠道' WHERE cus_name = '其他'; 

SELECT * FROM dj_2022_settlment_order_1 WHERE cus_name = '其他'; 
SELECT * FROM dj_2023_settlment_order_1 WHERE cus_name = '其他'; 
SELECT * FROM dj_system_merchant dsm WHERE merchant_name = '其他'; 
SELECT * FROM dj_system_merchant dsm WHERE settle_merchant_name = '其他'; 
SELECT * FROM dj_system_merchant_20230725 WHERE merchant_name = '其他'; 
SELECT * FROM dj_system_merchant_20230725 WHERE settle_merchant_name = '其他'; 


SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC;

SELECT DATE_FORMAT(trigger_time, '%Y-%m'),COUNT(*) FROM dj_car_shop_warning 
GROUP BY DATE_FORMAT(trigger_time, '%Y-%m') DESC;

SELECT DATE_FORMAT(EVENT_DATE, '%Y-%m'),COUNT(*) FROM ddh_rescue_event 
GROUP BY DATE_FORMAT(EVENT_DATE, '%Y-%m') DESC;

SELECT * FROM dj_basic_device_info_test_2306;
SELECT * FROM dj_device_details ddd WHERE ddd.settle_merchant = '其他'; 


select distinct a.cus_name
from dj_2023_settlment_order a
left join 
(select distinct merchant_name from  glsx_data.dj_system_merchant) b 
on a.cus_name =b.merchant_name
where b.merchant_name is null
and a.sale_type ='直销';



select distinct a.cus_name
from dj_2023_settlment_order a
left join 
(select distinct settle_merchant_name from dj_system_merchant) b 
on a.cus_name = b.settle_merchant_name
where b.settle_merchant_name is null
and a.sale_type ='直销';

SELECT a.`id`,a.`sn`,a.`active_time`,a.`active_merchant`,a.`pk_period`,a.`pk_price`,
        b.`id`,b.`sn`,b.`active_time`,b.`active_merchant`,b.`pk_period`,b.`pk_price`
FROM `dj_device_details_20230724` a
LEFT JOIN `dj_device_details` b ON b.`sn`=a.`sn`
WHERE a.`active_time`!=b.`active_time` OR a.`pk_period`!=b.`pk_period`;


SELECT a.`id`,a.`sn`,a.`active_time`,a.`active_merchant`,a.`pk_period`,a.`pk_price`,
        b.`id`,b.`sn`,b.`active_time`,b.`active_merchant`,b.`pk_period`,b.`pk_price`
FROM `dj_device_details_20230724` a
LEFT JOIN `dj_device_details_20230801` b ON b.`sn`=a.`sn`
WHERE a.`active_time`!=b.`active_time` OR a.`pk_period`!=b.`pk_period`;

SELECT count(1)
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-06-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-06-01 00:00:00') OR
(active_time >= '2023-06-01 00:00:00' AND active_time < '2023-06-31 23:59:59'));
































