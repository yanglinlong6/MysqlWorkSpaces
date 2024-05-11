select * from dj_2022_settlment_order WHERE finance_time BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 00:00:00' ;

select sum(total*(hw_unit_price+pk_unit_price+install_unit_price))
from dj_2022_settlment_order WHERE finance_time BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 00:00:00' ;

SELECT sum(income) FROM  dj_2022_settlment_order WHERE finance_time BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 00:00:00';



SELECT * FROM dj_device_details;
SELECT count(1)  FROM dj_device_details WHERE active_time IS NULL ;

SELECT sum(ifnull(pk_price,0) + ifnull(hw_price,0) + ifnull(install_price,0)) ,LEFT(settle_time,4),device_type FROM dj_device_details GROUP BY LEFT(settle_time,4),device_type;
SELECT sum(ifnull(pk_price,0) + ifnull(hw_price,0) + ifnull(install_price,0)) ,LEFT(settle_time,4),device_type FROM dj_device_details_return GROUP BY LEFT(settle_time,4),device_type;


SELECT sum(install_price) FROM glsx_data.dj_device_details WHERE device_type = 6;

SELECT count(1)  FROM dj_device_details WHERE settle_merchant = '遵义市千汇汽车销售服务有限公司';
SELECT count(1)  FROM dj_device_details WHERE settle_merchant = '遵义千汇汽车销售服务有限公司';


SELECT * FROM dj_device_details_return ;

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
case when device_type = 8 then 'GPS' when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', 0-pk_price as '套餐价格', 
0-hw_price as '硬件价格', 0-install_price as '安装价格', active_time as '激活时间'  FROM dj_device_details_return;

# 追踪器的
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间'  FROM dj_device_details where device_type =8 AND active_time IS NULL ;


# 记录仪&车充
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号',
case when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间'  FROM dj_device_details WHERE device_type IN (6,12501)and active_time IS NULL ;


SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
#FROM glsx_data.dj_device_details_20230801 d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
FROM glsx_data.dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
(active_time >= '2023-01-01 00:00:00' AND active_time < '2023-06-30 23:59:59'))
GROUP BY dsm.`merchant_id`;

SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司-DJ';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '武汉大智行汽车用品有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '济宁鸿昌汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '泰安鸿泰汽车销售服务有限公司';
SELECT *FROM dj_system_merchant dsm WHERE dsm.merchant_name = '太原远方通贸易有限公司1';

SELECT * FROM dj_device_details a WHERE a.active_merchant IN ('太原远方通贸易有限公司-DJ','武汉大智行汽车用品有限公司','济宁鸿昌汽车销售服务有限公司'
                                                              '泰安鸿泰汽车销售服务有限公司','太原远方通贸易有限公司1');



