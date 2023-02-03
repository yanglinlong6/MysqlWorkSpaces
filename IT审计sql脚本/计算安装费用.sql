select A.cus_name,A.monthx '月份',A.total '财务数量',B.total '商务数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '明细收入', (A.income - b.income) as gapincome FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,
SUM(install_unit_price) as income,SUM(cost)
FROM dj_2022_settlment_order_finance_06plus
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and date_format(finance_time,'%Y-%m') = '2022-08' and total > 0
GROUP BY cus_name, substr(finance_time,1,7)
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case when install_price is NULL then 0 else install_price end) ) as income
 from dj_2021_settle_details where date_format(settle_time,'%Y-%m') = '2022-08' and device_type = 8
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx);
HAVING gap > 1.0;
gap <> 0;

SELECT *
FROM dj_2022_settlment_order_06plus
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and date_format(finance_time,'%Y-%m') = '2022-08' and cus_name = '茂鑫实业投资集团有限公司'

select sum(install_price)
from dj_2021_settle_details where date_format(settle_time,'%Y-%m') = '2022-08'  and device_type = 8 and settle_merchant  = '茂鑫实业投资集团有限公司';

select *
from dj_2022_settlment_order_finance_06plus where device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and date_format(finance_time,'%Y-%m') = '2022-08' and cus_name = '茂鑫实业投资集团有限公司';


select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '明细收入', (A.income - b.income) as gapincome FROM
(
SELECT  cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='安装' then total else 0 end) as total,
       SUM(install_unit_price) as income,
       SUM(cost)
FROM dj_2022_settlment_order_finance_06plus
where  device_type in ('GPS','OBD') and product_type in ('安装') and finance_time = '2022-12-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name not in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司')
GROUP BY  substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case when install_price is NULL then 0 else install_price end) ) as income
 from dj_2021_settle_details where settle_time > '2022-01-01' and device_type in (8) and settle_merchant != '广汇汽车'
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON  a.monthx = B.monthx ;
HAVING  gap >  0
and total > 0

select sum(install_price),date_format(settle_time,'%Y-%m')
from dj_2021_settle_details where device_type in (8) and DATE_FORMAT(settle_time,'%Y-%m') = '2022-07';

select SUM( (case when install_unit_price is NULL then 0 else install_unit_price end)*total) as income
from dj_2022_settlment_order_06plus where device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and date_format(finance_time,'%Y-%m') = '2022-08';



select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome FROM
(
SELECT cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='安装' then total else 0 end) as total,SUM(income) as income,SUM(cost) FROM dj_2022_settlment_order_finance_new
where  device_type in ('GPS','OBD') and product_type in ('安装') and finance_time >= '2022-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name not in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
GROUP BY  cus_name,substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
SUM(case WHEN install_price is NULL then 0 else install_price end) as income
 from dj_2021_settle_details where settle_time >= '2022-01-01' and device_type in (8) and settle_merchant != '广汇汽车'
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING gapincome > 1.0;




select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome FROM
(
SELECT cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='安装' then total else 0 end) as total,SUM(income) as income,SUM(cost) FROM dj_2022_settlment_order_finance_new
where  device_type in ('GPS','OBD') and product_type in ('安装') and DATE_FORMAT(finance_time,'%Y-%m') = '2022-12' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name not in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
GROUP BY  cus_name,substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
SUM(case WHEN install_price is NULL then 0 else install_price end) as income
 from dj_2021_settle_details where DATE_FORMAT(settle_time,'%Y-%m') = '2022-12' and device_type in (8) and settle_merchant != '广汇汽车'
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx);


select * from dj_2021_settle_details  where DATE_FORMAT(settle_time,'%Y-%m') = '2022-12' and device_type in (8) and settle_merchant = '庞大精配网（天津）网络科技有限公司';

