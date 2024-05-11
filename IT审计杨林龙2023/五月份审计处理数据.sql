-- 备份修改退货标识的数据
CREATE TABLE dj_2021_settle_details_20230704 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230704 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230704;


-- 备份激活的数据 2023706
DROP TABLE dj_2021_settle_details_20230706;
CREATE TABLE dj_2021_settle_details_20230706 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230706 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230706;

-- 备份GPS已经核对完的数据 2023707 (未同步记录仪的修改到内部库)
DROP TABLE dj_2021_settle_details_20230707;
CREATE TABLE dj_2021_settle_details_20230707 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230707 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230707;

-- 重置数据 未修改记录仪硬件价格的 DROP TABLE dj_2021_settle_details; 20230707
CREATE TABLE dj_2021_settle_details LIKE dj_2021_settle_details_20230707;
INSERT INTO dj_2021_settle_details SELECT * FROM dj_2021_settle_details_20230707;
select count(1)  from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230707;

-- 备份五月份GPS和记录仪已经核对完的数据 2023714 (已经同步记录仪的修改到内部库)
DROP TABLE dj_2021_settle_details_20230714;
CREATE TABLE dj_2021_settle_details_20230714 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230714 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230714;

-- 重置五月份GPS和记录仪已经核对完的数据 2023714 (已经同步记录仪的修改到内部库)
DROP TABLE dj_2021_settle_details;
CREATE TABLE dj_2021_settle_details LIKE dj_2021_settle_details_20230714;
INSERT INTO dj_2021_settle_details SELECT * FROM dj_2021_settle_details_20230714;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230714;

-- 备份设备明细 新跑的5月份明细数据 未激活 20230706
CREATE TABLE dj_2021_settle_details_20230626 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20230626 SELECT * FROM dj_2021_settle_details;
select count(1)  from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230626;

-- 重置数据 未激活 DROP TABLE dj_2021_settle_details; 20230706
CREATE TABLE dj_2021_settle_details LIKE dj_2021_settle_details_20230626;
INSERT INTO dj_2021_settle_details SELECT * FROM dj_2021_settle_details_20230626;
select count(1)  from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20230626;

select *  from dj_2021_settle_details order by settle_time desc;
SELECT * FROM dj_2021_settle_details_20230626 order by settle_time desc;

-- 更新无忧卡为其他
UPDATE dj_2023_settlment_order_finance SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
UPDATE dj_2023_settlment_order SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%';
SELECT * FROM dj_2023_settlment_order WHERE cus_name LIKE '%遵义%';
SELECT * FROM dj_2023_settlment_order_finance WHERE cus_name LIKE '%遵义%';
UPDATE dj_2023_settlment_order SET cus_name = '遵义千汇汽车销售服务有限公司' WHERE cus_name = '遵义市千汇汽车销售服务有限公司';
UPDATE dj_2023_settlment_order_finance SET cus_name = '遵义千汇汽车销售服务有限公司' WHERE cus_name = '遵义市千汇汽车销售服务有限公司';
SELECT * FROM dj_system_merchant WHERE merchant_name LIKE '%遵义%';

SELECT count(1) FROM dj_2021_settle_details WHERE id = 0;
-- 106121
SELECT count(1) FROM dj_2023_settle_details ;
-- 22701
SELECT count(1) FROM dj_2023_settle_details_record ;
-- 83420
SELECT 22701+83420;

SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-01-01' AND `return` =0;
SELECT count(1)  FROM dj_2021_settle_details WHERE settle_time >= '2023-01-01' AND `return` =0;
SELECT *  FROM dj_2021_settle_details WHERE `return` =0 ORDER BY settle_time  DESC ;


SELECT *FROM dj_2021_settle_details WHERE device_type = 12501;

SELECT *  FROM  dj_2021_settle_details WHERE sn IN (SELECT sn  FROM dj_2023_settle_details_return)  AND settle_time < '2023-01-01';
-- 420
SELECT *  FROM  dj_2021_settle_details_20230626 dsd  WHERE sn IN (SELECT sn  FROM dj_2023_settle_details_return)  AND settle_time < '2023-01-01';
-- 420+1061
SELECT 420+1061;

SELECT *  FROM  dj_2021_settle_details dsd  WHERE sn NOT IN (SELECT sn FROM dj_2023_settle_details_return)  AND settle_time > '2023-01-01';
SELECT count(1)  FROM  dj_2021_settle_details dsd  WHERE sn IN (SELECT sn FROM dj_2023_settle_details_return)  AND settle_time < '2023-01-01' AND `return` = 1;
-- UPDATE dj_2021_settle_details dsd SET `return` = 0 WHERE sn NOT IN (SELECT sn FROM dj_2023_settle_details_return)  AND settle_time > '2023-01-01';
-- 92366
SELECT *  FROM  dj_2021_settle_details dsd  WHERE settle_time > '2023-01-01';
-- 92386
SELECT 92386- 92366;
SELECT count(1) from  dj_2021_settle_details_20230626 a WHERE a.settle_time < '2023-01-01' AND a.`return` = 0;
-- 1578460
SELECT count(1) from  dj_2021_settle_details a WHERE a.settle_time < '2023-01-01' AND a.`return` = 0;
-- 1578460
SELECT 1578880- 1577419;
-- 1461

select * from dj_2023_settlment_order WHERE cus_name = '云南众锐汽车服务有限公司';
SELECT count(1) FROM dj_2023_settle_details_return;
SELECT count(1) from  dj_2023_settle_details;
SELECT count(1) from  dj_2023_settle_details_record;
SELECT 22701+83420;

SELECT count(1)  FROM  dj_2021_settle_details_20230603 WHERE settle_time < '2023-01-01' AND `return` = 1; # 7253
SELECT count(1)  FROM  dj_2021_settle_details WHERE settle_time < '2023-01-01' AND `return` = 1; #8005

SELECT *  FROM dj_2021_settle_details;
SELECT 6825 - 7245; # 752
SELECT sum(cost) FROM dj_2023_settle_details;
SELECT sum(cost) FROM dj_2023_settle_details_record;
SELECT sum(cost) FROM dj_2023_settle_details_return;
SELECT 1361122.3425+8909545.0902;
SELECT sum(cost) from dj_2021_settle_details WHERE settle_time >= '2023-01-01';
SELECT sum(cost) from dj_2023_settlment_order a WHERE a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND total > 0;
SELECT * from dj_2023_settlment_order a WHERE a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND device_type in ('记录仪','车充','GPS','OBD') AND total < 0;
SELECT sum(ifnull(match_total,0)) from dj_2023_settlment_order a WHERE a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND device_type in ('记录仪','车充','GPS','OBD') AND total> 0;
-- 106121
-- -17516
-- 10270667.4327
-- 10272372.949999927
-- 10272372.949999934
SELECT sum(cost) from dj_2023_settlment_order_finance a WHERE a.business_type ='SAAS系统订阅服务—旧版本' AND a.product_type in ('硬件') AND total > 0;

1361122.3425
8909545.0902
10270667.4327
10166096.209999928
10166096.20999993

SELECT * FROM  dj_2023_settlment_order WHERE cus_name  ='四川众联兴通汽车服务有限公司';
SELECT * FROM  dj_2023_settlment_order_finance WHERE cus_name  ='济南新中兴汽车用品有限责任公司';
SELECT * FROM  dj_2023_settle_details WHERE settle_merchant = '联通租赁集团有限公司';
SELECT * FROM  dj_2023_settle_details_record;
SELECT * FROM  dj_2023_settle_details_return WHERE settle_merchant = '福建省联合车尚贸易有限公司';

SELECT id,finance_time,cus_name,product_code,total,hw_unit_price_tax,hw_unit_price,pk_unit_price_tax,
pk_unit_price,install_unit_price_tax,install_unit_price,product_name,pk_term,pk_name,cost,match_total,
sale_type from dj_2023_settlment_order where sale_type = '直销' and device_type in ('GPS','OBD') and product_type = '硬件' 
and business_type in ('SAAS系统订阅服务—旧版本', '智慧门店SAAS服务') 
and product_name<>'销售折扣' and status <> 0 and total < 0 order by finance_time DESC;

SELECT id,finance_time,cus_name,product_code,total,hw_unit_price_tax,hw_unit_price,pk_unit_price_tax,
pk_unit_price,install_unit_price_tax,install_unit_price,product_name,pk_term,pk_name,cost,match_total,
sale_type from dj_2023_settlment_order where sale_type = '渠道' and device_type in ('GPS','OBD') and product_type = '硬件' 
and business_type in ('SAAS系统订阅服务—旧版本', '智慧门店SAAS服务') 
and product_name<>'销售折扣' and status <> 0 and total < 0 order by finance_time DESC;

SELECT id,finance_time,cus_name,product_code,total,hw_unit_price_tax,hw_unit_price,pk_unit_price_tax,
pk_unit_price,install_unit_price_tax,install_unit_price,product_name,pk_term,pk_name,cost,match_total,
sale_type,device_type from dj_2023_settlment_order where device_type = '直销' and product_type = '硬件'  and product_name<>'销售折扣'
and business_type in ('SAAS系统订阅服务—旧版本', '智慧门店SAAS服务') 
and status <> 0 and total < 0 order by finance_time DESC;

SELECT id,finance_time,cus_name,product_code,total,hw_unit_price_tax,hw_unit_price,pk_unit_price_tax,
pk_unit_price,install_unit_price_tax,install_unit_price,product_name,pk_term,pk_name,cost,match_total,
sale_type,device_type from dj_2023_settlment_order where device_type = '渠道' and product_type = '硬件'  and product_name<>'销售折扣'
and business_type in ('SAAS系统订阅服务—旧版本', '智慧门店SAAS服务') 
and status <> 0 and total < 0 order by finance_time DESC;

SELECT sum(total)  FROM dj_2023_settlment_order where  product_type = '硬件' AND device_type <> '其他' and business_type in ('SAAS系统订阅服务—旧版本', '智慧门店SAAS服务') AND total < 0 AND id <> 325;

select * from dj_2023_settle_details WHERE id = 0;
select * from dj_2021_settle_details WHERE id = 0 AND settle_time > '2023-01-01';
SELECT * FROM dj_2021_settle_details WHERE sn = 'GC120SHAK20901708';
SELECT * FROM  dj_2021_settle_details WHERE settle_merchant = '成都车亿科技有限公司' AND settle_time > '2023-01-01' AND device_type = 8 ;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-04-01 00:00:00' and settle_merchant = '成都车亿科技有限公司' order by delivery_time limit 30;

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
case when device_type = 8 then 'GPS' when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', 0-pk_price as '套餐价格', 
0-hw_price as '硬件价格', 0-install_price as '安装价格', active_time as '激活时间',cost AS '单位成本'  FROM dj_2023_settle_details_return WHERE 
settle_merchant IN (
'广东盛世创客汽车科技有限公司', 
'广州盟锐科技发展有限公司', 
'遵义千汇汽车销售服务有限公司', 
'云南众锐汽车服务有限公司' 
);

SELECT * FROM dj_2023_settle_details_return WHERE `return` = 1 AND settle_merchant IN (
'广东盛世创客汽车科技有限公司', 
'广州盟锐科技发展有限公司', 
'遵义千汇汽车销售服务有限公司', 
'云南众锐汽车服务有限公司' 
);

SELECT * FROM  dj_2022_settlment_order_06plus WHERE cus_name  = '遵义千汇汽车销售服务有限公司';
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-02-01 00:00:00' and settle_merchant = '广东盛世创客汽车科技有限公司' order by delivery_time limit 12;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-02-01 00:00:00' and settle_merchant = '广州盟锐科技发展有限公司' order by delivery_time limit 11;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-02-01 00:00:00' and settle_merchant = '遵义千汇汽车销售服务有限公司' order by delivery_time limit 19;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-02-01 00:00:00' and settle_merchant = '云南众锐汽车服务有限公司' order by delivery_time limit 8;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-03-01 00:00:00' and settle_merchant = '云南众锐汽车服务有限公司' order by delivery_time limit 12;

SELECT * FROM dj_2023_direct_cus_active_20230603 WHERE customer IN (
'联通租赁集团有限公司'
)

SELECT * FROM dj_2021_settle_details_return WHERE settle_time >= '2022-01-01' AND settle_time < '2023-01-01';
SELECT * FROM dj_2021_settle_details_return WHERE settle_time >= '2023-01-01';
SELECT * FROM dj_2023_settle_details_return ;
SELECT * FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01';
SELECT * FROM dj_2022_settle_details_return WHERE settle_time >= '2022-01-01' AND settle_time < '2023-01-01';
SELECT * FROM dj_2022_settle_details_return WHERE settle_time >= '2022-01-01' AND settle_time < '2023-01-01' AND sn NOT IN (
SELECT sn FROM dj_2021_settle_details_return WHERE settle_time >= '2022-01-01' AND settle_time < '2023-01-01'
);

SELECT * FROM dj_device_details_return a WHERE a.sn = 1800425120;
SELECT * FROM dj_device_details WHERE sn = 1800425120;
SELECT * FROM dj_2021_settle_details WHERE sn IN (
SELECT sn FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01' AND sn NOT IN (SELECT sn FROM dj_device_details_return)
);

SELECT * FROM dj_device_details WHERE sn IN (
SELECT sn FROM dj_device_details_return WHERE sn NOT IN (SELECT sn FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01')
);

SELECT sn ,count(1) num from dj_2022_settle_details_return GROUP BY sn HAVING num > 1;
SELECT * FROM dj_2022_settle_details_return where sn IN (352538107574652,352538107574710);
SELECT * FROM dj_device_details_return where sn IN (352538107574652,352538107574710);
SELECT * FROM dj_2021_settle_details_return where sn IN (352538107574652,352538107574710);

SELECT * FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01' AND sn NOT IN (SELECT sn FROM dj_device_details_return);
SELECT * FROM dj_device_details_return WHERE sn NOT IN (SELECT sn FROM dj_2021_settle_details_return WHERE settle_time < '2023-01-01');

SELECT * FROM dj_device_details ddd where sn IN ('352538107574652','352538107574710');
SELECT * FROM dj_2021_settle_details ddd where sn IN ('352538107574652','352538107574710');

WHERE sn NOT IN (SELECT sn FROM dj_2021_settle_details_return);
SELECT * FROM dj_2023_settle_details_return WHERE sn NOT IN (SELECT sn FROM dj_2021_settle_details_return);

-- DELETE  FROM dj_2021_settle_details_return WHERE settle_time >= '2023-01-01' ;
INSERT INTO dj_2021_settle_details_return (channel,sn,is_virtual,iccid,device_type,material_code,delivery_order,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,pk_price_tax,hw_price,hw_price_tax,install_price,install_price_tax,cost,flag,`return`,hw_cost,install_cost) 
SELECT channel,sn,is_virtual,iccid,device_type,material_code,delivery_order,delivery_time,delivery_merchant,active_time,active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,pk_price_tax,hw_price,hw_price_tax,install_price,install_price_tax,cost,flag,`return`,hw_cost,install_cost 
FROM dj_2023_settle_details_return;

SELECT max(settle_time)  FROM dj_2021_settle_details dsd  WHERE pk_period  = 60;

select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-07-01 00:00:00' and settle_merchant = '其他' order by delivery_time limit 5;
select id,delivery_time,settle_time from dj_2021_settle_details where device_type = 8  and active_time is null and `return`=0 and delivery_time < '2023-07-01 00:00:00' and settle_merchant = '四川汇鹏兴成汽车服务有限公司' order by delivery_time limit 467;
SELECT * FROM  dj_2023_direct_cus_active_20230603 WHERE customer  IN ('其他','四川汇鹏兴成汽车服务有限公司');

SELECT count(1) FROM  dj_2021_settle_details_20230626 a WHERE a.settle_merchant  IN ('其他') AND a.active_time IS NULL AND a.device_type = 8 AND `return` = 0;
SELECT count(1) FROM  dj_2021_settle_details_20230626 a WHERE a.settle_merchant  IN ('四川汇鹏兴成汽车服务有限公司') AND a.active_time IS NULL AND a.device_type = 8 AND `return` = 0;
SELECT * FROM  dj_2021_settle_details a WHERE a.settle_merchant  IN ('四川汇鹏兴成汽车服务有限公司') AND a.active_time IS NULL AND a.device_type = 8 AND `return` = 0;

SELECT * FROM  dj_2023_settle_details_return a WHERE a.settle_merchant IN ('遵义千汇汽车销售服务有限公司') AND a.device_type = 8 AND `return` = 1;

# 追踪器的
SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间' 
FROM dj_device_details where device_type =8 and active_time IS NULL AND sn NOT IN (
SELECT sn FROM dj_2021_settle_details_return
);

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间' 
FROM dj_2021_settle_details where device_type =8 and active_time IS NULL AND sn NOT IN (
SELECT sn FROM dj_2021_settle_details_return
);

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号', 
'GPS' as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间' 
FROM dj_2021_settle_details where device_type =8 and active_time IS NULL AND `return` = 0;

SELECT channel as '渠道', settle_merchant as '结算客户',sn as '设备号',
case when device_type = 6 then '记录仪' when device_type = 12501 then '车充' end as '设备类型',
settle_time as '结算时间', pk_price as '套餐价格', 
hw_price as '硬件价格', install_price as '安装价格', active_time as '激活时间',cost AS '单位成本'  
FROM dj_2021_settle_details where device_type IN (6,12501) and active_time IS NULL AND `return` = 0;

SELECT * FROM dj_2021_settle_details WHERE `return` = 1 AND  AND sn NOT IN (
SELECT sn FROM dj_device_details_return
);

SELECT * FROM dj_device_details_20230703 WHERE sn = 64204130510;
SELECT * FROM dj_2023_settle_details_return WHERE sn = 64204130510;
SELECT count(1)  FROM dj_2021_settle_details_return_return WHERE  settle_time < '2023-01-01';
SELECT * FROM  dj_device_details_return;
SELECT * FROM  dj_2021_settle_details WHERE `return` = 1 AND settle_time < '2023-01-01';
SELECT 7245 - 6546;

SELECT * FROM dj_2021_settle_details WHERE `return` = 1 AND settle_time < '2023-01-01' AND sn NOT IN (
SELECT sn FROM  dj_device_details_return
);

SELECT * FROM dj_2021_settle_details WHERE `return` = 1 AND sn NOT IN (SELECT sn FROM dj_2021_settle_details_return);

SELECT sum(total) FROM dj_2022_settlment_order_06plus WHERE business_type = 'SAAS系统订阅服务—旧版本' AND product_type = '硬件' AND total < 0; 

SELECT * from dj_2022_settlment_order_06plus WHERE cus_name IN ('广州盟锐科技发展有限公司') AND total < 0;
SELECT * from dj_2023_settlment_order WHERE cus_name IN ('四川汇鹏兴成汽车服务有限公司') AND total < 0;
'成都易博鑫科技有限公司',
'广州盟锐科技发展有限公司',
'广东盛世创客汽车科技有限公司',
'遵义千汇汽车销售服务有限公司',
'福建省联合车尚贸易有限公司',
'四川汇鹏兴成汽车服务有限公司'

SELECT * FROM dj_2021_settle_details_return WHERE  settle_merchant = '广州盟锐科技发展有限公司' AND settle_time < '2023-01-01';

SELECT * FROM dj_2021_settle_details  WHERE `return` = 1 AND sn NOT IN (SELECT sn FROM dj_2021_settle_details_return);
SELECT * FROM dj_2021_settle_details_return  WHERE sn NOT IN (SELECT sn FROM dj_2021_settle_details WHERE `return` = 1 );
SELECT * FROM dj_device_details_20230703  WHERE  sn IN (SELECT sn FROM dj_device_details_return);
SELECT count(1)  FROM dj_2021_settle_details  WHERE `return` = 1 ;
SELECT count(1) FROM dj_2021_settle_details_return ;

-- update dj_2021_settle_details set `return` = 0 where sn in (SELECT sn FROM dj_2021_settle_details  WHERE `return` = 1 AND sn NOT IN (SELECT sn FROM dj_2021_settle_details_return));


SELECT * FROM  dj_2023_settlment_order WHERE cus_name  ='四川众联兴通汽车服务有限公司' AND business_type = 'SAAS系统订阅服务—旧版本' AND device_type IN ('GPS');
SELECT * FROM dj_2021_settle_details WHERE settle_merchant  = '济南新中兴汽车用品有限责任公司' 
AND settle_time >= '2023-01-01' AND device_type =8 AND `return` = 0;

SELECT * FROM dj_2021_settle_details WHERE settle_merchant  = '济南新中兴汽车用品有限责任公司' 
 AND device_type =8 AND `return` = 0 and active_time IS NULL ;