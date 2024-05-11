SELECT * FROM dj_2022_settlment_order_finance_06plus;
SELECT * FROM dj_2022_settlment_order_06plus;

CREATE TABLE dj_2023_settlment_order_finance LIKE dj_2022_settlment_order_finance_06plus;

DROP TABLE dj_2023_settlment_order_finance_06plus;
CREATE TABLE dj_2023_settlment_order LIKE dj_2022_settlment_order_06plus;
DROP TABLE dj_2023_settlment_order_06plus;

SELECT count(1) FROM dj_2023_settlment_order;


truncate TABLE  dj_2023_settlment_order;

select * from dj_2022_settle_details;

set @yearStart = '2022-01-01';
set @yearEnd = '2023-01-01';
SELECT count(DISTINCT active_merchant) from dj_2021_settle_details where active_merchant <> '' and 
((active_time < @yearStart and DATE_ADD(active_time,INTERVAL pk_period MONTH) > @yearEnd) or 
active_time >= @yearStart and active_time < @yearEnd);

SELECT count(1) FROM dj_active_store das WHERE active_year = '2022';

SELECT count(*) FROM dj_2023_settlment_order_finance WHERE LEFT(finance_time,7) = '2023-02';
SELECT count(*) FROM dj_2023_settlment_order WHERE LEFT(finance_time,7) = '2023-03';

SELECT *from  dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—智慧车管线索订阅';

SELECT * FROM  dj_2023_settle_details;
SELECT * FROM  dj_2023_settle_details_record;

update dj_2022_settlment_order_06plus set match_total=NULL,`status`=0 where finance_time >= '2022-09-01';

SELECT * FROM dj_2023_settlment_order WHERE status <> 0;

select * from dj_2021_settle_details WHERE settle_time > '2023-01-01';

SELECT * FROM dj_2021_delivery_device WHERE delivery_time > '2023-01-01 00:00:00' AND alloc <> 0;
SELECT * FROM dj_2021_delivery_device_record WHERE delivery_time > '2023-01-01 00:00:00' AND alloc <> 0;

SELECT *FROM dj_2022_settle_details WHERE settle_time > '2023-01-01';
SELECT *FROM dj_2022_settle_details_record WHERE settle_time > '2023-01-01';


-- 记录仪&车充合并
insert into dj_device_details (`channel`,`sn`,`device_type`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`hw_price`,`install_price`)
SELECT `channel`,`sn`,`device_type`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`hw_price`,`install_price` from 
dj_2023_settle_details_record where settle_time >='2023-01-01';


-- 追踪器合并
insert into dj_device_details (`channel`,`sn`,`device_type`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`hw_price`,`install_price`)
SELECT `channel`,`sn`,`device_type`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`hw_price`,`install_price` from 
dj_2023_settle_details where settle_time >='2023-01-01';


SELECT DATE_FORMAT(`settle_time`, '%Y'),COUNT(*),SUM(pk_price),SUM(hw_price) FROM `dj_device_details_return` a
WHERE a.`device_type` IN (6,12501)
GROUP BY DATE_FORMAT(`settle_time`, '%Y');



select DISTINCT a.cus_name from dj_2024_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' AND a.cus_name NOT IN 
(SELECT settle_merchant_name FROM dj_system_merchant) 
AND a.cus_name NOT  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');



-- select DISTINCT a.cus_name from dj_2023_settlment_order a 
-- WHERE a.business_type = 'SAAS系统订阅服务—旧版本' AND a.cus_name NOT IN 
-- (SELECT merchant_name FROM dj_system_merchant) 
-- AND  a.cus_name NOT  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');

SELECT *FROM dj_2021_settle_details WHERE settle_merchant = '广汇汽车';

select merchant_id,merchant_name,settle_merchant_name,svr_merchant_name from dj_system_merchant where  settle_merchant_name <>'' and svr_merchant_name <> '二次转化客户';
select DISTINCT a.cus_name from dj_2023_settlment_order a WHERE a.cus_name  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');
select * from dj_system_merchant WHERE merchant_name IN ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');
select * from dj_system_merchant WHERE merchant_name IN ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');
select * from dj_system_merchant WHERE merchant_name in(
'贵州林荣汽车贸易股份有限公司',
'呼伦贝尔冀海汽车贸易有限公司',
'唐山光辉汽车销售服务有限公司',
'唐山弘德丰田汽车销售服务有限公司',
'唐山冀东丰田汽车销售服务有限公司',
'通辽庞大一众汽车销售服务有限公司',
'乌鲁木齐庞大腾众汽车销售有限公司',
'新疆大地汽车销售有限责任公司',
'张家口庞大铭盛汽车销售服务有限公司'
);

SELECT * FROM dj_system_merchant dsm WHERE dsm.merchant_name IN (
'茂鑫实业投资集团有限公司',
'太原远方通贸易有限公司',
'哈尔滨市博能汽车销售有限公司',
'成都零六六科技有限公司',
'铜仁德恒汽车销售服务有限公司',
'唐山光辉汽车销售服务有限公司',
'唐山弘德丰田汽车销售服务有限公司',
'通辽庞大一众汽车销售服务有限公司',
'乌鲁木齐庞大腾众汽车销售有限公司',
'新疆大地汽车销售有限责任公司',
'张家口庞大铭盛汽车销售服务有限公司'
);

select * from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' 
AND a.cus_name in(
'贵州林荣汽车贸易股份有限公司',
'呼伦贝尔冀海汽车贸易有限公司',
'唐山光辉汽车销售服务有限公司',
'唐山弘德丰田汽车销售服务有限公司',
'唐山冀东丰田汽车销售服务有限公司',
'通辽庞大一众汽车销售服务有限公司',
'乌鲁木齐庞大腾众汽车销售有限公司',
'新疆大地汽车销售有限责任公司',
'张家口庞大铭盛汽车销售服务有限公司'
);

select * from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' 
AND a.cus_name in(
'贵州林荣汽车贸易股份有限公司',
'呼伦贝尔冀海汽车贸易有限公司',
'唐山光辉汽车销售服务有限公司',
'唐山弘德丰田汽车销售服务有限公司',
'唐山冀东丰田汽车销售服务有限公司',
'通辽庞大一众汽车销售服务有限公司',
'乌鲁木齐庞大腾众汽车销售有限公司',
'新疆大地汽车销售有限责任公司',
'张家口庞大铭盛汽车销售服务有限公司'
);


select DISTINCT cus_name from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' 
AND a.cus_name in(
'茂鑫实业投资集团有限公司',
'太原远方通贸易有限公司',
'哈尔滨市博能汽车销售有限公司',
'成都零六六科技有限公司',
'铜仁德恒汽车销售服务有限公司',
'唐山光辉汽车销售服务有限公司',
'唐山弘德丰田汽车销售服务有限公司',
'通辽庞大一众汽车销售服务有限公司',
'乌鲁木齐庞大腾众汽车销售有限公司',
'新疆大地汽车销售有限责任公司',
'张家口庞大铭盛汽车销售服务有限公司'
);

SELECT *FROM  dj_system_merchant WHERE merchant_name = '贵州林荣汽车贸易股份有限公司';
SELECT *FROM  dj_system_merchant WHERE merchant_name = '遵义千汇汽车销售服务有限公司';
SELECT * FROM dj_2023_settlment_order WHERE cus_name = '张家口庞大铭盛汽车销售服务有限公司';

SELECT sysdate();

INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (156000006,'156000006','成都万增商贸有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'四川',NULL,'成都',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'成都万增商贸有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000007,'156000007','非常品牌生活文化传播(茂名)有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'广东',NULL,'茂名',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'非常品牌生活文化传播(茂名)有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000008,'156000008','南昌领鑫信息咨询有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'江西',NULL,'南昌',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'南昌领鑫信息咨询有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000009,'156000009','宁夏吉源辉汽车信息咨询服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'宁夏',NULL,'银川',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'宁夏吉源辉汽车信息咨询服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000010,'156000010','宁夏亿兴汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'宁夏',NULL,'银川',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'宁夏亿兴汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000011,'156000011','上海贵谱信息科技有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'上海',NULL,'上海',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'上海贵谱信息科技有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000012,'156000012','宿州市小家汽车服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'安徽',NULL,'宿州',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'宿州市小家汽车服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000013,'156000013','云南金鼎汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'云南',NULL,'昆明',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'云南金鼎汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000014,'156000014','遵义市千汇汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'贵州',NULL,'遵义',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'遵义市千汇汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000015,'156000015','长春子煜商贸有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'吉林',NULL,'长春',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'长春子煜商贸有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');


INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (156000017,'156000017','赣州广虹雷克萨斯汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'江西',NULL,'赣州',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'赣州广虹雷克萨斯汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000018,'156000018','南京福之鼎汽车服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'江苏',NULL,'南京',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'南京福之鼎汽车服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000019,'156000019','陕西悍途领驭科技有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'陕西',NULL,'西安',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'陕西悍途领驭科技有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');

SELECT * FROM  dj_system_merchant; 
select DISTINCT a.cus_name from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' AND a.cus_name NOT IN 
(SELECT settle_merchant_name FROM dj_system_merchant) 
AND  a.cus_name NOT  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');

INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (156000020,'156000020','贵州林荣汽车贸易股份有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'贵州',NULL,'贵阳',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'贵州林荣汽车贸易股份有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
-- 	 (44205243,'44205243','呼伦贝尔冀海汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'呼伦贝尔',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'呼伦贝尔冀海汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205288,'44205288','唐山光辉汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'唐山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'唐山光辉汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205289,'44205289','唐山弘德丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'唐山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'唐山弘德丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185512,'44185512','通辽庞大一众汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'通辽',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通辽庞大一众汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185623,'44185623','乌鲁木齐庞大腾众汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'新疆',NULL,'乌鲁木齐',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'乌鲁木齐庞大腾众汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185616,'44185616','新疆大地汽车销售有限责任公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'新疆',NULL,'喀什',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'新疆大地汽车销售有限责任公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185476,'44185476','张家口庞大铭盛汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'张家口',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'张家口庞大铭盛汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');

SELECT * FROM dj_system_merchant dsm WHERE merchant_id = 44205243; 
SELECT * FROM dj_system_merchant dsm WHERE merchant_id = '44205174'; 

INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (44205174,'44205174','唐山冀东丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'唐山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'唐山冀东丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');

SELECT * FROM dj_system_merchant WHERE id >= 2590;

SELECT * FROM  dj_2023_settlment_order WHERE cus_name  = '大连庞大华通汽车贸易有限公司';
SELECT * FROM  dj_2021_settle_details dsd WHERE dsd.settle_merchant  = '大连庞大华通汽车贸易有限公司';

SELECT dsm.id, dsm.merchant_name ,dsm.created_date AS date01 , dso.finance_time AS date02 , TIMESTAMPDIFF(DAY ,dsm.created_date,dso.finance_time) AS diff
FROM dj_system_merchant dsm LEFT JOIN ( SELECT finance_time ,cus_name FROM (SELECT finance_time ,cus_name FROM dj_2023_settlment_order ORDER BY finance_time) AS temp01 GROUP BY cus_name ) dso 
ON dso.cus_name = dsm.settle_merchant_name 
WHERE dsm.id >= 2558 ORDER BY diff DESC ; 

SELECT TIMESTAMPDIFF(MONTH,'2009-10-01','2009-09-01'); 
-- DELETE FROM dj_system_merchant WHERE id = 2566;
SELECT * FROM  dj_system_merchant WHERE merchant_id = 44205226;
SELECT * FROM  dj_system_merchant_1129 dsm  WHERE merchant_id = 44205226;

SELECT * FROM  dj_system_merchant; 
select DISTINCT a.cus_name from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' AND a.cus_name NOT IN 
(SELECT settle_merchant_name FROM dj_system_merchant) 
AND  a.cus_name NOT  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');

INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (156000024,'156000024','大连庞大华通汽车贸易有限公司','大连上海大众',0,NULL,NULL,NULL,NULL,NULL,NULL,'辽宁',NULL,'大连',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'大连庞大华通汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
 	 (156000021,'156000021','广州市饰和汽车有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'广东',NULL,'广州',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'广州市饰和汽车有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000025,'156000025','呼伦贝尔市庞大龙盛丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'呼伦贝尔',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'呼伦贝尔市庞大龙盛丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185352,'44185352','荣成新广利丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'山东',NULL,'荣成',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'荣成新广利丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44209171,'44209171','深圳市爱车有道汽车服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'通辽',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'深圳市爱车有道汽车服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185615,'44185615','昌吉庞大丰雅丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'新疆',NULL,'昌吉',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'昌吉庞大丰雅丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000026,'156000026','承德市通程汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'承德',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'承德市通程汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000027,'156000027','赤峰冀腾汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'赤峰',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'赤峰冀腾汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44193274,'44193274','定西恒信丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'甘肃',NULL,'定西',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'定西恒信丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185552,'44185552','衡阳市畅安汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'湖南',NULL,'衡阳',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'衡阳市畅安汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000022,'156000022','山西瑞车汇汽车服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'山西',NULL,'太原',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山西瑞车汇汽车服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205298,'44205298','唐山庞大泰达汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'唐山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'唐山庞大泰达汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185712,'44185712','新疆庞大本顺汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'新疆',NULL,'乌鲁木齐',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'新疆庞大本顺汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185530,'44185530','延边金山丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'吉林',NULL,'延吉',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'延边金山丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185636,'44185636','保定庞大本瑞汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'保定',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'保定庞大本瑞汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000023,'156000023','北京冀贵汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'北京',NULL,'北京',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京冀贵汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000028,'156000028','北京来广营中冀汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'北京',NULL,'北京',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京来广营中冀汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185304,'44185304','北京五方桥丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'北京',NULL,'北京',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'北京五方桥丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000029,'156000029','承德本祥汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'承德',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'承德本祥汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000030,'156000030','邯郸市誉丰汽车销售有限责任公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'邯郸',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'邯郸市誉丰汽车销售有限责任公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44209320,'44209320','合肥云成汽车科技有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'安徽',NULL,'合肥',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'合肥云成汽车科技有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205277,'44205277','沈阳庞大华通汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'辽宁',NULL,'沈阳',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'沈阳庞大华通汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185570,'44185570','太原庞大丰扬丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'山西',NULL,'太原',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'太原庞大丰扬丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205315,'44205315','唐山市庞大众跃汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'唐山',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'唐山市庞大众跃汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');

	
	
SELECT * FROM  dj_system_merchant WHERE merchant_id = 44205257; 

select DISTINCT a.cus_name from dj_2023_settlment_order a 
WHERE a.business_type = 'SAAS系统订阅服务—旧版本' AND a.cus_name NOT IN 
(SELECT settle_merchant_name FROM dj_system_merchant) 
AND  a.cus_name NOT  in ('东台宝通汽车服务有限责任公司', '广汇汽车服务有限责任公司东台分公司', '广汇汽车服务有限责任公司天津武清分公司', '上海宝信实嘉汽车销售有限公司天津武清分公司');


INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (44185504,'44185504','赤峰市冀东本峰汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'赤峰市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'赤峰市冀东本峰汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
 	 (156000031,'156000031','大连友联电子有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'辽宁',NULL,'大连',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'大连友联电子有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000034,'156000034','廊坊市庞大一众汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'廊坊',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'廊坊市庞大一众汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205334,'44205334','乌兰察布庞大弘翔丰田汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'内蒙古',NULL,'乌兰察布',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'乌兰察布庞大弘翔丰田汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44205338,'44205338','西宁中冀汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'青海',NULL,'西宁',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'西宁中冀汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185617,'44185617','新疆政辉贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'新疆',NULL,'乌鲁木齐',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'新疆政辉贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185470,'44185470','张家口市庞大一众汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'张家口',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'张家口市庞大一众汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (44185471,'44185471','张家口市庞大众腾汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'张家口',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'张家口市庞大众腾汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000032,'156000032','浙江众联晟通国际贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'张家口',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'浙江众联晟通国际贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000033,'156000033','武汉荣方科技有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'河北',NULL,'张家口',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'武汉荣方科技有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');

SELECT active_merchant, DATE_SUB(min(delivery_time), INTERVAL 1 WEEK)  FROM  dj_2021_settle_details  WHERE active_merchant IN ('江西华兴斯巴鲁汽车销售有限公司') GROUP BY active_merchant;

SELECT * FROM dj_system_merchant WHERE id >= 2760; 
SELECT * FROM dj_system_merchant WHERE merchant_name = '承德市通程汽车销售有限公司'; 


INSERT INTO dj_system_merchant (merchant_id,account_name,merchant_name,short_name,user_type,merchant_type,contact_name,phone,channel_id,address,province_id,province_name,city_id,city_name,area_id,area_name,lng,lat,shop_photo,business_hours,parent_merchant_id,parent_merchant_name,svr_merchant_id,settle_merchant_name,svr_merchant_name,created_by,created_date,updated_by,updated_date,deleted_flag) VALUES
	 (44185409,'44185409','安康庞大冀安汽车贸易有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'陕西',NULL,'安康市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'安康庞大冀安汽车贸易有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
 	 (44195377,'44195377','贵州斯巴鲁汽车销售服务有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'贵州',NULL,'贵阳市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'贵州斯巴鲁汽车销售服务有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N'),
	 (156000035,'156000035','江西华兴斯巴鲁汽车销售有限公司',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'江西',NULL,'南昌市',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'江西华兴斯巴鲁汽车销售有限公司',NULL,'admin',sysdate(),'admin',sysdate(),'N');
	 

select * from dj_system_merchant WHERE merchant_id IN (44185409,44195377,44205249);	
select * from dj_system_merchant WHERE merchant_id IN (156000034);	
	
