-- CREATE TABLE dj_device_details_20230620 LIKE dj_device_details;
-- SELECT * FROM dj_device_details_20230620;

select * from temp_dj_device_details_20230620;
SELECT LEFT(settle_time,7), count(1)  FROM temp_dj_device_details_20230620 WHERE active_time IS NULL GROUP BY LEFT(settle_time,7) ;

ALTER TABLE temp_dj_device_details_20230620 ADD COLUMN `fentan_time` datetime DEFAULT NULL COMMENT '分摊时间' AFTER install_cost;


-- 渠道分摊时间用激活时间 非渠道的分摊时间按照结算时间
UPDATE temp_dj_device_details_20230620 SET fentan_time = settle_time WHERE channel <> '渠道';
UPDATE temp_dj_device_details_20230620 SET fentan_time = active_time WHERE channel = '渠道';
UPDATE temp_dj_device_details_20230620 SET pk_period = 12 WHERE pk_period = 0 OR pk_period IS NULL;
UPDATE temp_dj_device_details_20230620 SET pk_price = 0 WHERE pk_price IS NULL;
UPDATE temp_dj_device_details_20230620 SET active_merchant = '激活客户' WHERE active_merchant IS NULL ;
UPDATE temp_dj_device_details_20230620 SET active_merchant = '激活客户' WHERE active_merchant = '';

select * from temp_dj_device_details_20230620 WHERE fentan_time IS NULL ;

select * from temp_dj_device_details_20230620_active_record_ft;


-- 记录仪
SELECT sum(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501);
-- GPS
SELECT sum(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8);

-- 记录仪 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
-- GPS 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;

SELECT sum(apportionment_price) FROM temp_dj_device_details_20230620_settle_install_gps_ft;

SELECT sum(zengjia_total_price) FROM temp_dj_device_details_20230620_settle_install_gps_zj;
SELECT sum(jianshao_total_price) FROM temp_dj_device_details_20230620_settle_install_gps_zj;
SELECT sum(qichu_total_price) FROM temp_dj_device_details_20230620_settle_install_gps_zj;

SELECT * FROM temp_dj_device_details_20230620_settle_hw_gps_ft ;
SELECT * FROM temp_dj_device_details_20230620_settle_hw_gps_zj;

SELECT min(settle_time),max(settle_time),DATE_ADD(settle_time,INTERVAL pk_period MONTH ) as fentan_end_time  FROM temp_dj_device_details_20230620 WHERE pk_period =60;; 
SELECT *  FROM temp_dj_device_details_20230620  where `device_type` IN (8) and settle_time is not null;

SELECT `id`,`sn`,`settle_time`,`pk_period`,SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null GROUP BY settle_merchant,LEFT(settle_time ,7),pk_period ;

356339.6919
356337.12
356339.69
356337.12

-- 激活维度
-- 记录仪 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
-- GPS 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;

SELECT sum(apportionment_price) FROM temp_dj_device_details_20230620_active_hw_record_ft;

SELECT sum(zengjia_total_price) FROM temp_dj_device_details_20230620_active_hw_record_zj;
SELECT sum(jianshao_total_price) FROM temp_dj_device_details_20230620_active_hw_record_zj;
SELECT sum(qichu_total_price) FROM temp_dj_device_details_20230620_active_hw_record_zj;

SELECT * FROM temp_dj_device_details_20230620_active_hw_record_zj;

86846492.6838
86846492.40
86846492.71
86846492.40

-- 结算维度
-- 记录仪 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (6,12501) and settle_time is not null ;
-- GPS 
SELECT SUM(IFNULL(pk_price,0) + IFNULL(hw_price, 0) + IFNULL(install_price, 0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null ;
SELECT SUM(IFNULL(hw_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;
SELECT SUM(IFNULL(pk_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;
SELECT SUM(IFNULL(install_price,0)) as total_price FROM temp_dj_device_details_20230620 where `device_type` IN (8) and settle_time is not null ;

SELECT sum(apportionment_price) FROM temp_dj_device_details_20230620_settle_hw_record_ft;

SELECT sum(zengjia_total_price) FROM temp_dj_device_details_20230620_settle_hw_record_zj;
SELECT sum(jianshao_total_price) FROM temp_dj_device_details_20230620_settle_hw_record_zj;
SELECT sum(qichu_total_price) FROM temp_dj_device_details_20230620_settle_hw_record_zj;

SELECT * FROM temp_dj_device_details_20230620_settle_hw_record_zj WHERE order_year = 2020 GROUP BY device_id;
SELECT * FROM temp_dj_device_details_20230620_settle_hw_record_ft WHERE device_id =1500126; 
SELECT * FROM temp_dj_device_details_20230620_settle_hw_record_zj WHERE device_id IN (1603498); 
SELECT id,device_id,order_year,qichu_num,qichu_unit_price,qichu_total_price,zengjia_num,zengjia_unit_price,zengjia_total_price,jianshao_num,jianshao_unit_price,jianshao_total_price 
FROM temp_dj_device_details_20230620_settle_hw_record_zj tddz WHERE device_id IN (1370202);

356679.3147
356676.60
356679.31
356676.60

SELECT id,settle_merchant,'门店',channel,pk_period,count(1) as num, settle_time,sum(IFNULL(install_price,0)) as total_price,fentan_time,DATE_ADD(fentan_time,INTERVAL pk_period MONTH ) as fentan_end_time,install_price,
sum(install_price)/pk_period, device_type,min(active_time),max(active_time),fentan_time,left(fentan_time,4) 
FROM temp_dj_device_details_20230620 where `device_type` IN (8) and fentan_time is not null AND id = 1393932
GROUP BY settle_merchant,LEFT(fentan_time ,7),pk_period ;

SELECT * FROM temp_dj_device_details_20230620 WHERE id = 1393932;



