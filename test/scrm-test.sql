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

select * from shopmall_order_verfication WHERE order_code = 'S2312061121564354';
select * from shopmall_sub_order WHERE sub_order_code = '733834191825018880';

# 提示词表
SELECT * FROM t_prompt_info;   
# 员工工牌表
SELECT * FROM inspection_employee_badge; 
# 员工工牌录音表
SELECT * FROM inspection_badge_recordings; 
# 话术质检分析结果
SELECT * FROM inspection_conversation_date;
# 工牌每日录音记录批次表
SELECT * FROM inspection_conversation_batch WHERE id = 1; 
# 工牌录音对话明细表
SELECT  *FROM inspection_conversation_detail; 
# 接待批次的质检分析
SELECT * FROM inspection_conversation_check_detail WHERE batch_id = 1; 

SHOW CREATE TABLE inspection_conversation_batch;
SHOW CREATE TABLE inspection_conversation_detail;
SHOW CREATE TABLE inspection_conversation_check_detail;

CREATE TABLE `inspection_conversation_batch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL COMMENT '关联inspection_conversation_date的id',
  `num` int(11) NOT NULL COMMENT '批次编号',
  `start_time` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录音开始时间',
  `end_time` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '录音结束时间',
  `duration` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '持续时长，单位毫秒',
  `file_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '合并后文件url',
  `estimated_result` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预计营销结果',
  `score` decimal(10,2) DEFAULT NULL COMMENT '话术质检评分',
  `digest` text COLLATE utf8mb4_unicode_ci COMMENT 'AI对话摘要',
  `quality_inspection` text COLLATE utf8mb4_unicode_ci COMMENT '话术质检结果',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'system' COMMENT '修改人',
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '删除标识(D：已删除；N：未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工牌每日录音记录批次表'

CREATE TABLE `ai_sparring_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` int(11) DEFAULT NULL COMMENT '批次id',
  `role` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对话内容',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system' COMMENT '修改人',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '删除标识(D：已删除；N：未删除)',
  PRIMARY KEY (`id`),
  KEY `system_time_index` (`system_time`),
  KEY `batch_id_index` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='AI对练记录明细表';

CREATE TABLE `ai_sparring_check_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `batch_id` int(11) NOT NULL COMMENT '接待批次ID',
  `first_classify` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '一级分类名称',
  `second_classify` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '二级分类名称',
  `score` decimal(10,2) NOT NULL COMMENT '质检得分',
  `raw_score` decimal(10,2) DEFAULT NULL COMMENT '分值',
  `hit_result` tinyint(4) NOT NULL COMMENT '是否命中 1-是 0-否',
  `hit_text` text COLLATE utf8mb4_unicode_ci COMMENT '命中文本',
  `suggestions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '话术建议',
  `created_by` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system' COMMENT '创建人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_by` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'system' COMMENT '修改人',
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_flag` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N' COMMENT '删除标识(D：已删除；N：未删除)',
  PRIMARY KEY (`id`),
  KEY `batch_id_index` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='AI对练质检分析';



