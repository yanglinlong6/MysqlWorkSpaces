
# 追踪器
select A.cus_name,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '明细收入', (A.income - b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and business_type ='SAAS系统订阅服务—旧版本' and finance_time >= '2023-01-01' and total > 0
GROUP BY cus_name, substr(finance_time,1,7)
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2023_settle_details where settle_time >= '2023-01-01' and device_type = 8
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING gap <> 0;
gap <> 0;
abs(gapincome) >1.0

# 记录仪车充
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('记录仪','车充') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
GROUP BY cus_name, substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2023_settle_details_record where settle_time >= '2023-01-01' and  device_type in (6, 12501)
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING gap <> 0 ;

gap <> 0
AND abs(gapincome) >1.0
 

gap <> 0;

#记录仪车充 退货明细检查
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total + B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income + b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('记录仪','车充') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total < 0 and business_type ='SAAS系统订阅服务—旧版本'
GROUP BY cus_name, substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2023_settle_details_return where settle_time >= '2023-01-01' and device_type in (6, 12501)
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING gap <> 0;
gap > 0
AND abs(gapincome) >1.0



#追踪器 退货明细检查
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total + B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income + b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT TRIM(cus_name) as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total < 0 and business_type ='SAAS系统订阅服务—旧版本'
GROUP BY cus_name, substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2023_settle_details_return where settle_time >= '2023-01-01' and device_type in (8)
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING  gap <> 0;
abs(gapincome) >1.0





#核对广汇 追踪器
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT '广汇汽车' as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost)AS costx FROM dj_2023_settlment_order_finance
where  device_type in ('GPS','OBD') and product_type in ('硬件','服务','安装') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
-- and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司')
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
GROUP BY  substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2021_settle_details where settle_time >= '2023-01-01' and device_type in (8) and settle_merchant = '广汇汽车'
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING  gapco <>  0 ;
abs(gapincome) >1.0


#核对广汇 记录仪和车充
select A.cus_name,A.sale_type,A.monthx '月份',A.total '财务数量',B.total '明细数量',(A.total - B.total) as gap,A.income as '财务收入',
 b.income as '商务收入', (A.income - b.income) as gapincome,A.costx AS '财务成本',B.costx AS '明细成本',(A.costx - b.costx) as gapcost FROM
(
SELECT '广汇汽车' as cus_name, substr(finance_time,1,7) as monthx, sale_type,
SUM(case when product_type='硬件' then total else 0 end) as total,SUM(income) as income,SUM(cost) AS costx  FROM dj_2023_settlment_order_finance
where  device_type in ('记录仪','车充') and product_type in ('硬件','服务') and finance_time >= '2023-01-01' and total > 0 and business_type ='SAAS系统订阅服务—旧版本'
and cus_name in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司')
GROUP BY  substr(finance_time,1,7),sale_type
) as A
LEFT JOIN
(
SELECT settle_merchant as cus_name,DATE_FORMAT(settle_time,'%Y-%m') as monthx,COUNT(1) as total,
(SUM(case WHEN pk_price is NULL then 0 else pk_price end)+
SUM(case when hw_price is NULL then 0 else hw_price end)+
SUM(case when install_price is NULL then 0 else install_price end) ) as income,
sum(cost) AS costx 
 from dj_2023_settle_details_record where settle_time >= '2023-01-01' and device_type in (6,12501) and settle_merchant = '广汇汽车'
GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')
)
as B ON (B.cus_name = A.cus_name AND a.monthx = B.monthx) HAVING  gap <>  0 ;
abs(gapincome) >1.0
HAVING  gap is null  0 


SELECT * FROM dj_2022_settlment_order_finance_06plus where finance_time >= '2022-07-01'

('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司')



# 追踪器的
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本' FROM dj_2023_settle_details where device_type =8 
AND settle_time >= '2023-12-01';



# 记录仪&车充
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号',
case when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本'  FROM dj_2023_settle_details_record
where settle_time >= '2023-12-01';



#退货
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
case when device_type = 8 then 'GPS' when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', 0-pk_price as '套餐价格', 
0-hw_price as '硬件价格', 0-install_price as '安装价格', active_time as '激活时间',cost AS '单位成本'  FROM dj_2023_settle_details_return
WHERE settle_time >= '2023-12-01';


SELECT device_type,COUNT(1) FROM dj_2021_settle_details where settle_time >= '2022-03-01' GROUP BY device_type;



SELECT is_virtual,COUNT(1) from dj_2022_settle_details_record where DATE_FORMAT(settle_time,'%Y-%m') = '2022-12' GROUP BY is_virtual




'''
insert into dj_2021_settle_details (`channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return`)
SELECT `channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return` from 
dj_2022_settle_details where settle_time >= '2022-03-01';
'''


SELECT settle_merchant,DATE_FORMAT(settle_time,'%Y-%m'),COUNT(1) FROM dj_2021_settle_details where device_type = 8 and active_time is null GROUP BY settle_merchant,DATE_FORMAT(settle_time,'%Y-%m')


SELECT * from dj_2023_settlment_order_finance where cus_name = '恒信汽车集团股份有限公司' and device_type in ('记录仪', '车充') AND LEFT(finance_time,7) = '2023-01';
SELECT * from dj_2023_settlment_order_finance where cus_name = '恒信汽车集团股份有限公司' and device_type in ('记录仪', '车充') AND LEFT(finance_time,7) = '2023-02';

SELECT count(1)  FROM dj_2021_settle_details WHERE LEFT(settle_time,7) = '2023-01' AND settle_merchant = '恒信汽车集团股份有限公司' AND `return` = 1 AND device_type in ('记录仪', '车充') ;
SELECT *  FROM dj_2021_settle_details WHERE settle_merchant = '河北酷嘉汽车服务有限公司' AND `return` =0;

