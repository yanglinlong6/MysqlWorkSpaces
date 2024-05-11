# 备份已经跑完的九月份的数据
CREATE TABLE dj_2021_settle_details_20231218 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20231218 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20231218;

# 备份已经跑完的十一月份的数据
CREATE TABLE dj_2021_settle_details_20231219 LIKE dj_2021_settle_details;
INSERT INTO dj_2021_settle_details_20231219 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;
select count(1) from dj_2021_settle_details_20231219;

CREATE TABLE dj_device_details_20231016 LIKE dj_device_details;
INSERT INTO dj_device_details_20231016 SELECT * FROM dj_device_details;
select count(1) from dj_device_details;
select count(1) from dj_device_details_20231016;

SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-10'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order a WHERE LEFT(a.finance_time,7) >= '2023-10'  ORDER	BY	id DESC;

-- DELETE  FROM  dj_2023_settlment_order_finance  WHERE LEFT(finance_time,7) >= '2023-08';
-- DELETE  FROM  dj_2023_settlment_order WHERE LEFT(finance_time,7) >= '2023-08';

SELECT * FROM dj_2021_settle_details WHERE settle_time >= '2023-10-01';
SELECT * FROM dj_2023_settle_details WHERE settle_time >= '2023-10-01';
SELECT * FROM dj_2023_settle_details_return WHERE settle_time >= '2023-10-01';

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


SELECT * FROM dj_2022_direct_cus_active; 
SELECT * FROM dj_2023_direct_cus_active_20230603; 
SELECT * FROM dj_2023_direct_cus_active_20231219; 
truncate TABLE  dj_2022_direct_cus_active;
CREATE TABLE dj_2023_direct_cus_active_20231219 LIKE dj_2023_direct_cus_active_20230603 ;
INSERT INTO dj_2023_direct_cus_active_20231219 SELECT * FROM dj_2023_direct_cus_active_20230603;
SELECT *FROM dj_2021_settle_details dsm WHERE dsm.settle_merchant = '铜仁德恒汽车销售服务有限公司' AND device_type = 8 AND active_time is NULL ;


SELECT count(1) FROM dj_2021_settle_details WHERE LEFT(settle_time,7) = '2023-07' AND device_type = 8 AND channel = '渠道'; 

select settle_merchant,case when device_type=8 then '追踪器' when device_type=6 then '记录仪' when device_type=12501 then '车充' end,
pk_period,DATE_FORMAT(settle_time, '%Y-%m') as settle_month,
DATE_FORMAT(active_time,'%Y-%m') as active_month,COUNT(1) as count,
sum(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as amount, channel,
case when `return`=1 then '退货' else '正常' end ,id 
from dj_2021_settle_details where  settle_time < '2023-12-01 00:00:00' and device_type = 8 AND LEFT(settle_time,7) = '2023-07'
GROUP BY settle_merchant,device_type,pk_period,DATE_FORMAT(settle_time, '%Y-%m'),DATE_FORMAT(active_time,'%Y-%m'),channel,`return` 
order by settle_merchant,settle_month;


SELECT settle_merchant,LEFT(settle_time,7),count(1) FROM dj_2021_settle_details WHERE  device_type = 8 AND channel = '渠道'
AND settle_merchant IN (
'成都车亿科技有限公司',
'成都创晟汽车服务有限公司',
'成都福聚盈汽车服务有限公司',
'成都易博鑫科技有限公司',
'赤峰易云信息咨询服务有限责任公司',
'佛山市鑫车汽车服务有限公司',
'甘肃诚利源汽车销售服务有限公司',
'广东盛世创客汽车科技有限公司',
'广西控桂商务信息咨询有限公司',
'广西瑜健连投资有限公司',
'广州盟锐科技发展有限公司',
'贵阳嘉鑫汽车装饰经营部',
'贵州车吉家信息咨询服务有限公司',
'贵州车喜达汽车销售服务有限责任公司',
'哈尔滨诚丰商贸有限公司',
'哈密市名驰汽车服务有限公司',
'杭州佳途实业有限公司',
'杭州天一汽车有限公司',
'河北程尊汽车服务有限公司',
'河北益智康商贸有限公司',
'湖北凯众汽车销售服务有限公司',
'湖北路琥揽星商贸有限公司',
'湖南达阳汽车用品销售有限公司',
'江西乐车林贸易有限公司',
'乐山市城琪汽车销售服务有限公司',
'聊城荣泰网络科技有限公司',
'零售电商客户 ',
'南京趣融网络技术有限公司',
'内蒙古威耀商贸有限公司',
'内蒙古银创投资管理有限公司',
'萍乡市睿宇科技有限公司',
'厦门富创新汽车科技有限公司',
'厦门国戎华汽车销售服务有限公司',
'汕头市卓信汽车服务有限公司',
'上海泓合科技服务有限公司',
'上海联越电子科技有限公司',
'深圳市富恒业科技有限公司',
'沈阳合德祥商贸有限公司',
'四川正通安吉汽车服务有限公司',
'铜仁德恒汽车销售服务有限公司',
'乌鲁木齐市汇享汇融汽车服务有限公司',
'乌鲁木齐玉利金鸿汽车用品有限公司',
'武汉融易租汽车服务有限公司',
'武汉众银信息咨询服务有限公司',
'云南金拓投资有限公司',
'云南行知经济信息咨询服务有限公司',
'长春市鑫车圣汽车用品销售服务有限公司',
'长春沃杰斯汽车科技有限公司',
'郑州汇聚汽车用品有限公司',
'郑州润希汽车服务有限公司',
'重庆车乐道汽车用品有限公司',
'重庆卡达能汽车用品有限公司',
'安徽优盾信息科技有限公司',
'福建省联合车尚贸易有限公司',
'广东优客云汽车科技有限公司',
'杭州电车家汽车科技有限公司',
'杭州交创汽车贸易有限公司',
'吉林市兴孚汽车销售服务有限公司',
'茂名市茂南盈汇汽车贸易有限公司',
'其他',
'深圳市宝旌科技有限公司',
'四川汇鹏兴成汽车服务有限公司',
'天津恺益约车租赁有限公司',
'西藏鸿瑞汽车贸易有限公司',
'北京海韵山峦商贸有限公司',
'合肥望京科技有限公司',
'重庆车生缘商贸有限公司',
'东莞市玖众科技有限责任公司',
'赣州名荣汽车销售服务有限公司',
'杭州禄通科技有限公司',
'三亚百亿鑫实业有限公司',
'石家庄岚申汽车销售有限公司',
'石家庄兴和汽车销售服务有限公司',
'四川众联兴通汽车服务有限公司',
'郑州远之创电子科技有限公司',
'济南新中兴汽车用品有限责任公司',
'重庆雅尚汽车饰品有限公司',
'湖北华瑞智联科技有限公司',
'哈尔滨哈得力金宜汽车销售有限公司',
'衡阳市沪德包装有限公司',
'天津市亿嘉信息技术有限公司',
'森风集团有限公司',
'云南众锐金泉汽车销售有限公司',
'南昌领鑫信息咨询有限公司',
'非常品牌生活文化传播茂名)有限公司 ',
'宁夏吉源辉汽车信息咨询服务有限公司',
'厦门盈鹭通汽车服务有限公司',
'都江堰市速达汽车贸易有限公司',
'上海鲁悦汽车服务有限公司',
'云南鸿超汽车服务有限公司',
'长沙祺捷汽车用品有限公司',
'联通租赁集团有限公司',
'茂鑫实业投资集团有限公司',
'云南众锐汽车服务有限公司',
'贵州林荣汽车装饰服务有限公司',
'哈尔滨市博能汽车销售有限公司',
'遵义市千汇汽车销售服务有限公司',
'贵州林荣汽车贸易股份有限公司',
'合肥云成汽车科技有限公司',
'四川众联晟通国际贸易有限公司',
'大连友联电子有限公司'
) GROUP BY settle_merchant ,LEFT(settle_time,7);

SELECT customer	,settle_202201,settle_202202,settle_202203,settle_202204,settle_202205,settle_202206,settle_202207,settle_202208,settle_202209,settle_202210,settle_202211,settle_202212
FROM  dj_2023_direct_cus_active_20231219;


SELECT settle_merchant,LEFT(settle_time,7),count(1) FROM dj_2021_settle_details WHERE  device_type = 8 AND channel = '渠道'
AND settle_merchant IN ('遵义市千汇汽车销售服务有限公司');

SELECT * FROM  dj_2023_settlment_order_finance a WHERE cus_name = '遵义千汇汽车销售服务有限公司';
SELECT * FROM  dj_2023_settlment_order a WHERE cus_name = '遵义千汇汽车销售服务有限公司';

-- 核对分摊
# 备份已经跑完的十一月份的数据
CREATE TABLE temp_dj_device_details_20231226 LIKE dj_2021_settle_details;
INSERT INTO temp_dj_device_details_20231226 SELECT * FROM dj_2021_settle_details;
select count(1) from dj_2021_settle_details;

select count(1) from temp_dj_device_details_20231226;
select * from temp_dj_device_details_20231226_settle_install_gps_ft;
select * from temp_dj_device_details_20231226_settle_install_gps_zj;

SELECT
	`id`,
	`sn`,
	`settle_time`,
	`pk_period`,
	SUM(IFNULL(hw_price, 0)+ IFNULL(pk_price, 0)+ IFNULL(install_price, 0)) AS total_price
FROM
	temp_dj_device_details_20231226
WHERE
	`device_type` IN ('8')
	AND settle_time IS NOT NULL
GROUP BY
	settle_merchant,
	LEFT(
		settle_time ,
		7
	),
	pk_period ;

SELECT
	SUM(IFNULL(hw_price, 0)+ IFNULL(pk_price, 0)+ IFNULL(install_price, 0)) AS total_price
FROM
	temp_dj_device_details_20231226
WHERE
	`device_type` IN ('8')
	AND settle_time IS NOT NULL;

SELECT DISTINCT  pk_period FROM temp_dj_device_details_20231226 ;
SELECT * FROM temp_dj_device_details_20231226 WHERE pk_period IS NULL  AND `device_type` IN ('8');

UPDATE temp_dj_device_details_20231226 SET pk_period = 12 WHERE pk_period = 0 OR pk_period IS NULL ;




SELECT LEFT(active_time,7) , count(1) FROM dj_2021_settle_details 
WHERE LEFT(active_time,4) >= '2023'
GROUP BY LEFT(active_time,7);

SELECT LEFT(active_time,7) , count(1) FROM dj_2021_settle_details 
WHERE LEFT(active_time,4) >= '2023'
GROUP BY LEFT(active_time,7);

SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2022-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-01-01 00:00:00') OR
(active_time >= '2022-01-01 00:00:00' AND active_time < '2022-06-30 23:59:59'))
GROUP BY dsm.`merchant_id`;

select * from dj_device_details;

insert into dj_device_details (channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost) 
SELECT channel,sn,device_type,delivery_time,delivery_merchant,active_time,
active_merchant,pk_name,pk_period,settle_merchant,settle_order,settle_time,pk_price,hw_price,install_price,hw_cost,
install_cost from dj_2021_settle_details where settle_time >= '2023-10-01';


SELECT dsm.merchant_id,dsm.`merchant_name`,dsm.`created_date` AS createTime
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
(active_time >= '2023-01-01 00:00:00' AND active_time < '2023-02-01 00:00:00'))
GROUP BY dsm.`merchant_id`;

SELECT count(1)
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-01-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-01-01 00:00:00') OR
(active_time >= '2023-01-01 00:00:00' AND active_time < '2023-02-01 00:00:00'));

set @yearStart = '2023-01-01';
set @yearEnd = '2023-02-01';
SELECT count(DISTINCT active_merchant) from dj_2021_settle_details where active_merchant <> '' and 
((active_time < @yearStart and DATE_ADD(active_time,INTERVAL pk_period MONTH) > @yearEnd) or 
active_time >= @yearStart and active_time < @yearEnd);

SELECT count(1)
FROM dj_device_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-06-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-06-01 00:00:00') OR
(active_time >= '2023-06-01 00:00:00' AND active_time < '2023-06-31 23:59:59'));


SELECT count(1)
FROM dj_2021_settle_details d LEFT JOIN dj_system_merchant dsm ON d.active_merchant =dsm.merchant_name 
WHERE active_merchant <> '' AND dsm.`merchant_id` IS NOT NULL AND
((active_time < '2023-07-01 00:00:00' AND DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2023-07-01 00:00:00') OR
(active_time >= '2023-07-01 00:00:00' AND active_time < '2023-07-31 23:59:59'));

CREATE TABLE dj_device_details_20240111 LIKE  dj_device_details;
INSERT INTO dj_device_details_20240111 SELECT * FROM dj_device_details;













