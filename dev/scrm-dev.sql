SELECT * FROM  scrm_activity_red_envelope_detail;
SELECT * FROM  scrm_activity_red_envelope_record;
SELECT * FROM  scrm_activity_red_envelope_record;
id	activity_red_envelope_id	link	third_activity_name	third_activity_type	export_time	status	wechat_name	user_phone	wechat_union_id	wechat_open_id	binding_time	created_by	created_time	updated_by	updated_time	del_flag

id	activity_red_envelope_detail_id	link	third_activity_name	third_wechat_name	third_wechat_open_id	third_user_phone	third_prize_type	third_prize_name	third_prize_money	created_by	created_time	updated_by	updated_time	del_flag

UPDATE scrm_activity_red_envelope SET amount = {} ,usable_amount = {} WHERE id  = {};


SELECT date_format(sysdate(),'%Y-%m-%d') ;

select
        id ,
        activity_name,
        merchant_id,
        merchant_name,
        activity_start_time,
        activity_end_time,
        CASE
        WHEN activity_type = 2 THEN 2
        WHEN DATE_FORMAT(SYSDATE(),'%Y-%m-%d') < DATE_FORMAT(activity_start_time,'%Y-%m-%d') THEN 0
        WHEN DATE_FORMAT(SYSDATE(),'%Y-%m-%d') >= DATE_FORMAT(activity_start_time,'%Y-%m-%d')
        AND DATE_FORMAT(SYSDATE(),'%Y-%m-%d') <= DATE_FORMAT(activity_end_time,'%Y-%m-%d')THEN 1
        WHEN DATE_FORMAT(SYSDATE(),'%Y-%m-%d') > DATE_FORMAT(activity_end_time,'%Y-%m-%d') THEN 3
        END AS activityType,
        amount,
        used_amount,
        usable_amount,
        activity_status
        from scrm_activity_red_envelope
        where del_flag = 0;
        
UPDATE scrm_activity_red_envelope
        SET amount        = amount + 1,
            usable_amount = usable_amount + 1
        WHERE id =1      
        
        SELECT *FROM shopmall_sub_order;	
        
       
ALTER TABLE scrm_activity_red_envelope_record modify  `third_prize_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '第三方奖品名称';     
ALTER TABLE scrm_activity_red_envelope_record modify  `third_prize_money` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '第三方中奖金额';     


SELECT now();

select * from scrm_shopmall.shopmall_sub_order;
select * from scrm_shopmall.shopmall_order;
select * from scrm_shopmall.shopmall_order_goods;
select * from scrm_shopmall.shopmall_goods;

select * from shopmall_order_refund;
select * from shopmall_order_refund_img;
select * from shopmall_order_delivery;
select * from shopmall_strategy;
select * from shopmall_discover_goods;
select * from shopmall_activity_goods;
select * from shopmall_order_verfication;


select
*
from shopmall_order_verfication
where deleted_flag = 'N'
and order_code = 'S2311271356153261'
limit 1;

select * from shopmall_customer_reserve_record;

-- 雷达信息
SELECT  * FROM scrm_charge_radar_info; 
-- 车位信息
SELECT  * FROM scrm_charge_parking_space_info;
--  车位照片
SELECT  * FROM scrm_charge_parking_space_img;
--  车位历史状态
SELECT  * FROM scrm_charge_parking_space_history_status;
--  车位空闲提醒订阅
SELECT  * FROM scrm_charge_parking_space_free_subscribe;


SELECT * FROM scrm_charge_parking_space_info scpsi 
LEFT JOIN scrm_charge_radar_info scri ON scri.id = scpsi.radar_id 
WHERE scpsi.merchant_name = ;

SELECT now();

SELECT scpshs.id ,scpsi.merchant_name ,scpsi.parking_area ,scpsi.parking_floor ,scpsi.parking_building ,
scpsi.parking_number,scpshs.parking_status,scri.radar_number ,scpshs.start_time ,scpshs.end_time 
FROM scrm_charge_parking_space_history_status scpshs
LEFT JOIN scrm_charge_parking_space_info scpsi ON scpsi.id = scpshs.parking_space_id 
LEFT JOIN scrm_charge_radar_info scri ON scri.id = scpshs.radar_id 
WHERE scpshs.del_flag = 0; 

select count(1)
        from scrm_charge_parking_space_info
        where del_flag = 0 and parking_address_lng IS NULL  and merchant_id = 1;
       
SELECT * FROM t_prompt_info;       





































