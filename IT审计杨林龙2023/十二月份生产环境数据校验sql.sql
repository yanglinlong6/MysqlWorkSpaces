SELECT COUNT(DISTINCT merchant_id)
        FROM (
                SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
                FROM glsx_data.dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
                WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
                ((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
                (active_time >= '2023-01-01 00:00:00' AND active_time < '2023-12-31 23:59:59'))
                GROUP BY dsm.`merchant_id`
                UNION ALL
                SELECT aabt.merchant_id,aabt.merchant_name,aabt.createTime FROM (
                        SELECT eo.merchant_id,eom.merchant_name,eom.create_time AS createTime
                        FROM equity_order eo,`equity_order_merchant` eom
                        WHERE eo.merchant_id=eom.merchant_id AND DATE_ADD(success_date,INTERVAL 12 MONTH)>'2023-01-01 00:00:00'
                        GROUP BY eo.merchant_id
                        UNION ALL
                        SELECT eo.merchant_id,eom.merchant_name,eom.create_time AS createTime
                        FROM `equity_order_20230106` eo,`equity_order_merchant_20230106` eom
                        WHERE eo.merchant_id=eom.merchant_id AND success_date>'2023-01-01 00:00:00'
                        GROUP BY eo.merchant_id
                        #UNION ALL
                        #SELECT eo.merchant_id,eom.merchant_name,eom.create_time AS createTime
                        #FROM `equity_order_20230712` eo,`equity_order_merchant_20230712` eom
                        #WHERE eo.merchant_id=eom.merchant_id AND eo.success_date>'2023-07-01 00:00:00' AND eo.source IN ('dj-insure','dj-scrm','dj_insure','gh-scrm')
                        #        AND eo.merchant_id NOT IN (44205762,44205577,44184843,44205761,44202909,44206440)
                        #GROUP BY eo.merchant_id
                ) aabt 
                GROUP BY aabt.merchant_id        ) a
WHERE a.merchant_id IN (
        SELECT DISTINCT merchant_id
        FROM (
                SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
                #FROM glsx_data.dj_device_details_20230801 d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
                FROM glsx_data.dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
                WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
                ((active_time < '2022-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-01-01 00:00:00') OR
                (active_time >= '2022-01-01 00:00:00' AND active_time < '2022-12-31 23:59:59'))
                GROUP BY dsm.`merchant_id`
                UNION ALL
                SELECT aabt.merchant_id,aabt.merchant_name,aabt.createTime FROM (
                        SELECT eo.merchant_id,eom.merchant_name,eom.create_time AS createTime
                        FROM equity_order eo,`equity_order_merchant` eom
                        WHERE eo.merchant_id=eom.merchant_id AND DATE_ADD(success_date,INTERVAL 12 MONTH)>'2022-01-01 00:00:00'
                        GROUP BY eo.merchant_id
                ) aabt 
                GROUP BY aabt.merchant_id
        ) a
);


-- 同步安装成本的修改
SELECT a.install_cost ,b.install_cost FROM dj_2021_settle_details a LEFT JOIN 
dj_device_details b ON b.sn = a.sn WHERE a.install_cost IS NOT NULL 
AND a.device_type =8 AND a.settle_time >= '2023-01-01' and a.settle_merchant = '广汇汽车';

UPDATE dj_2021_settle_details a LEFT JOIN 
dj_device_details b ON b.sn = a.sn id 
SET b.install_cost = a.install_cost 
WHERE a.install_cost IS NOT NULL 
AND a.device_type =8 AND a.settle_time >= '2023-01-01' and a.settle_merchant = '广汇汽车';


select a.*,b.保养线索条数,c.碰撞线索条数,d.到店线索条数										
from 										
(select date_format(settle_time, "20%y-%m") as 结算时间 ,count(distinct sn) as 服务订阅设备数  #settle_merchant,										
from dj_device_details										
where settle_time between "2023-01-01 00:00:00" and "2023-12-31 23:59:59"										
and pk_price is not null										
group by date_format(settle_time, "20%y-%m"))a 										
left join 										
(select date_format(created_date , "20%y-%m") as 结算时间,count(id) as 保养线索条数										
from dj_car_maintain										
where created_date  between "2023-01-01 00:00:00" and "2023-12-31 23:59:59"										
group by date_format(created_date , "20%y-%m"))b on a.结算时间=b.结算时间										
left join 										
(select date_format(created_date , "20%y-%m") as 结算时间,count(id) as 碰撞线索条数										
from glsx_data.ddh_rescue_event										
where created_date  between "2023-01-01 00:00:00" and "2023-12-31 23:59:59"										
group by date_format(created_date , "20%y-%m"))c on a.结算时间=c.结算时间										
left join 										
(select date_format(created_date , "20%y-%m") as 结算时间,count(id) as 到店线索条数										
from glsx_data.dj_car_shop_warning										
where created_date  between "2023-01-01 00:00:00" and "2023-12-31 23:59:59"										
group by date_format(created_date , "20%y-%m"))d on a.结算时间=d.结算时间;

SELECT * FROM dj_device_details;
SELECT LEFT(settle_time,4) '年份', 
sum(ifnull(pk_price,0)+ifnull(hw_price,0)+ifnull(install_price,0))  '营收',
sum(ifnull(hw_cost,0)+ifnull(install_cost,0)) '成本',
sum(ifnull(pk_price,0)+ifnull(hw_price,0)+ifnull(install_price,0)) - sum(ifnull(hw_cost,0)+ifnull(install_cost,0)) '纯收入'
FROM dj_device_details GROUP BY LEFT(settle_time,4);


										









































