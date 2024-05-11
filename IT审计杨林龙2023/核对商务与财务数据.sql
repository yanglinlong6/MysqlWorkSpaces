--('GPS','OBD') ('记录仪','车充')
--dj_2022_settlment_order_finance_06plus

select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '商务数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='智慧门店SAAS服务'
GROUP BY cus_name, substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT cus_name,monthx,SUM(tmp.totalx) as total,sum(tmp.incomex) as income from
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
(case when product_type='硬件' then total else 0 end) as totalx,
(total*(hw_unit_price+pk_unit_price+install_unit_price)) as incomex
 FROM dj_2023_settlment_order 
where  device_type in ('GPS','OBD') and product_type in ('硬件') and business_type ='智慧门店SAAS服务'
) tmp
GROUP BY tmp.cus_name, tmp.monthx,sale_type
)  
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING gap = 0 and abs(gapincome) >1.0;



#('GPS','OBD')  ('记录仪','车充')
-- GPS
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '商务数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome ,A.costx '财务成本',B.costx '商务成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-12-01'
GROUP BY cus_name, DATE_FORMAT(finance_time, '%Y-%m'),sale_type
) as A
LEFT JOIN
(
SELECT cus_name,monthx,SUM(tmp.totalx) as total,sum(tmp.incomex) as income,sum(costx) AS costx  from
(
SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
(case when product_type='硬件' then total else 0 end) as totalx,
(total*(IFNULL(hw_unit_price,0) + IFNULL(pk_unit_price,0)+IFNULL(install_unit_price,0) )) as incomex ,cost AS costx 
 FROM dj_2023_settlment_order 
where  device_type in ('GPS','OBD') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-12-01'
) tmp
GROUP BY tmp.cus_name, tmp.monthx,sale_type
)  
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING abs(gapincome) > 1.0;


-- 记录仪
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '商务数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome, A.costx '财务成本',B.costx '商务成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('记录仪','车充') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-12-01'
GROUP BY cus_name, DATE_FORMAT(finance_time, '%Y-%m'),sale_type
) as A
LEFT JOIN
(
SELECT cus_name,monthx,SUM(tmp.totalx) as total,sum(tmp.incomex) as income,sum(costx) AS costx from
(
SELECT TRIM(cus_name) as cus_name, DATE_FORMAT(finance_time, '%Y-%m') as monthx, sale_type,
(case when product_type='硬件' then total else 0 end) as totalx,
(total*(IFNULL(hw_unit_price,0) + IFNULL(pk_unit_price,0)+IFNULL(install_unit_price,0) )) as incomex,cost AS costx
 FROM dj_2023_settlment_order 
where  device_type in ('记录仪','车充') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-12-01'
) tmp
GROUP BY tmp.cus_name, tmp.monthx,sale_type
)  
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING abs(gapincome) > 1.0;




SELECT *  FROM dj_2023_settlment_order_finance
where  device_type in ('记录仪','车充') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本'
AND cus_name = '上海轩泽汽车用品有限公司' AND LEFT(finance_time,7) = '2023-06' ;

SELECT *  FROM dj_2023_settlment_order 
where  device_type in ('记录仪','车充') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本'
AND cus_name = '上海轩泽汽车用品有限公司' AND LEFT(finance_time,7) = '2023-06';

SELECT * from dj_2022_settlment_order_06plus where sale_type = '直销' and device_type in ('GPS','OBD') and product_type = '硬件' and product_name<>'销售折扣' and status <> 1 and total < 0 order by finance_time desc

SELECT * FROM dj_2022_settlment_order_06plus where  total < 0  and device_type in ('GPS','OBD','记录仪','车充') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-09-01'
and product_name <>'销售折扣'

'六盘水天驰汽车有限公司'
select id,sn,delivery_order,delivery_time,settle_merchant from dj_2021_settle_details where   settle_merchant = '六盘水天驰汽车有限公司' 

and delivery_time < '2022-12-31 00:00:00' order by delivery_time desc limit 8

 
SELECT * from dj_2022_settle_details_return where settle_time > '2022-09-01'



SELECT * FROM dj_2022_settlment_order_06plus where product_name = '销售折扣';

SELECT * FROM dj_2021_delivery_device WHERE customer_name <> '' and update_time >= '2023-01-12';

SELECT * FROM dj_2021_delivery_device limit 100

SELECT * from dj_2022_settlment_order_06plus where cus_name = '恒信汽车集团股份有限公司' and total < 0

SELECT * FROM dj_2022_settlment_order_06plus where  `status` <> 1 and device_type in ('GPS','OBD','记录仪','车充') and product_type in ('硬件') and business_type ='SAAS系统订阅服务—旧版本' and finance_time>= '2022-09-01'


SELECT device_type,COUNT(1) from dj_2021_settle_details where settle_merchant = '安徽优盾信息科技有限公司' GROUP BY device_type
