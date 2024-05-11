insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 17010309, 0, sysdate(), 1
from t_role tr
where tr.del_flag = 0
  and tr.id <> 1;

select *
from t_role
where del_flag = 0;

SELECT * FROM t_workorder tw WHERE tw.partner_order_no = 'AP16868863635240';
SELECT *FROM t_workorder_vehicle twv WHERE twv.workorder_id = 45955;

select *
from t_role_menu
where menu_id = 17010309;

select *
from t_menu
where permission_tag = 'vehicle_vin_frequency';

select *
from t_tenant;
SELECT *FROM t_workorder tw WHERE partner_order_no = 'AP2020082611482';
SELECT *FROM t_workorder tw WHERE order_source = 'zhongyuan123';
SELECT * FROM t_workorder_vehicle twv WHERE twv.workorder_id =  46142;

SELECT * FROM  

select *
from t_vehicle
where vin = 'testGYY1669356955';

SELECT * FROM t_workorder tw WHERE partner_order_no = '2023060911000001';
SELECT * FROM t_workorder_documents twd WHERE twd.workorder_id = 46013;
SELECT * FROM t_tenant tt ;


select *
from t_vehicle_device
where vehicle_id = 73783;

select *
from t_organization
where del_flag = 0
  and superior_id = 4665
order by superior_id, depth;


select tvd.id
from t_vehicle tv
         left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
         left join t_device td on td.sn = tvd.sn
         left join t_device_location tdl on tdl.sn = td.sn
         left join t_user tu on tu.id = tv.created_by
WHERE tvd.del_flag = 0
  and tv.del_flag = 0
  and tvd.bind_status = 1
  and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
        timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
    or (tdl.last_gps_time is null and tdl.last_bs_time is null)
    or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
    or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
    )
  and tvd.sn not in
      (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392, 1501025226,
       1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431, 1610125355,
       1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373, 2601025567,
       2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929, 1501024930,
       1510519161, 1510802779, 1590630167, 1510116892)
  and tu.tenant_id = 85;
#         <if test="search.settleCondition != null and search.settleCondition != ''">
#             ${search.settleCondition}
#         </if>

select *
from t_user;

select *
from t_department;

select tfofs.sn
from t_fake_offline_fence_sn tfofs
         left join t_vehicle_device tvd on tvd.sn = tfofs.sn
where tfofs.del_flag = 0
  and tfofs.status = 1
  and tvd.id in
      (select tvd.id
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
#          and tvd.sn not in
#              (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
#               1501025226,
#               1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
#               1610125355,
#               1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
#               2601025567,
#               2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
#               1501024930,
#               1510519161, 1510802779, 1590630167, 1510116892)
#          and tu.tenant_id = 1
      )
union
select tfocf.sn
from t_fake_offline_change_frequently tfocf
         left join t_vehicle_device tvd on tvd.sn = tfocf.sn
where tfocf.del_flag = 0
  and tfocf.status = 1
  and tvd.id in
      (select tvd.id
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
#          and tvd.sn not in
#              (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
#               1501025226,
#               1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
#               1610125355,
#               1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
#               2601025567,
#               2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
#               1501024930,
#               1510519161, 1510802779, 1590630167, 1510116892)
#          and tu.tenant_id = 1
      )
union
select tws.sn
from t_whitelist_sn tws
         left join t_vehicle_device tvd on tvd.sn = tws.sn
where tws.del_flag = 0
  and tvd.id in
      (select tvd.id, tvd.sn
       from t_vehicle tv
                left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                left join t_device td on td.sn = tvd.sn
                left join t_device_location tdl on tdl.sn = td.sn
                left join t_user tu on tu.id = tv.created_by
       WHERE tvd.del_flag = 0
         and tv.del_flag = 0
         and tvd.bind_status = 1
         and ((timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and
               timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (tdl.last_gps_time is null and tdl.last_bs_time is null)
           or (tdl.last_gps_time is null and timestampdiff(SECOND, tdl.last_bs_time, now()) > 3 * 24 * 3600)
           or (timestampdiff(SECOND, tdl.last_gps_time, now()) > 3 * 24 * 3600 and tdl.last_bs_time is null)
           )
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226, 1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847,
              2610413431, 1610125355, 1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678,
              2601025564, 2601023373, 2601025567, 2601110950, 1610108110, 1610112756, 2600919073, 1500911705,
              1501111793, 1500921686, 1501024929, 1501024930, 1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 85
         and tvd.sn = '15185613007'
      )
  and tws.department_id IN
      (select sub_id
       from t_organization
       where del_flag = 0
         and superior_id = 4665
       order by superior_id, depth);

select *
from t_vehicle_device
where sn = '15185613007';

select *
from t_vehicle
where id = 73793;

select *
from t_user
where id = 8174;

select *
from t_whitelist_sn
where sn = '15185613007';

select *
from t_device_location
where sn = '15185613007';

select *
from t_vehicle
where id in (73664, 73671);

select *
from t_vehicle_device
where vehicle_id in (73664, 73671);

select *
from t_role_menu;

select *
from t_menu tm where permission_tag in ('vehicle_table_car_model','vehicle_table_car_label','vehicle_table_car_use');

select *
from t_role where del_flag = 0;

select *
from t_role_menu where menu_id in (select menu_no from t_menu tm where permission_tag in ('vehicle_table_car_model','vehicle_table_car_label','vehicle_table_car_use'));

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 17010310, 0, sysdate(), 1
from t_role tr where tr.del_flag = 0;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 17010311, 0, sysdate(), 1
from t_role tr where tr.del_flag = 0;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 17010312, 0, sysdate(), 1
from t_role tr where tr.del_flag = 0;

select *
from t_tenant;
SELECT * FROM t_vehicle_device tvd WHERE tvd.sn= '96541445375'; 
SELECT * FROM t_vehicle tv WHERE tv.id = 73963; 
SELECT * FROM t_workorder tw WHERE tw.id = 46285; 
SELECT *FROM t_device td ;


select tv.id as vid, tw.partner_order_no as appcode, tv.owner_name as username, tv.vin as vin, tvd.sn as imei,
(CASE td.source WHEN 1 THEN '有线' WHEN 0 THEN '无线' ELSE '' END) as equipment
from t_vehicle_device tvd
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_workorder tw on tw.id = tv.workorder_id
left join t_user tu on tv.created_by = tu.id
where tu.tenant_id = 85  and tv.del_flag = 0  and tvd.del_flag = 0  and tvd.bind_status = 1  and tw.del_flag = 0  and tw.status = 2 
-- order by tvd.id desc LIMIT 180;
AND tvd.sn = 96541445375;

SELECT * FROM t_dev_split tds ;
SELECT * FROM t_dev_split WHERE vid = 73929;
SELECT * FROM t_dev_split WHERE vin = 'Testfv13932000210';
UPDATE t_dev_split SET del_flag = -1 WHERE del_flag = 0;

SELECT * FROM t_workorder tw WHERE tw.partner_order_no = '2023080816000001';
SELECT * FROM t_vehicle tv WHERE vin = 'Testfv13932000210'; 

SELECT * FROM  t_poi_fence;
CREATE TABLE `t_poi_fence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `poi_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'poi名称',
  `poi_type` tinyint(2) DEFAULT '0' COMMENT 'POI类型 1:黑区圆心，2:二押点，3:异常聚集点',
  `lnglat` text COLLATE utf8_bin COMMENT '经纬度坐标',
  `enable_status` tinyint(4) DEFAULT '1' COMMENT '状态 0=关闭 1=开启',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述(备注)',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_tef_created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='POI列表';


SELECT *FROM t_user tu WHERE tu.id = 8349;
SELECT * FROM t_role tr ;



INSERT INTO t_poi_fence (poi_name,poi_type,lnglat,enable_status,del_flag,created_date,created_by,updated_date,updated_by) VALUES
	 ('崇文园区1号楼',1,'113.991416,22.587527',1,0,'2023-09-13 16:08:34.0',1,NULL,NULL),
	 ('崇文园区2号楼',2,'113.991881,22.587696',0,0,'2023-09-14 09:41:14.0',1,'2023-09-14 09:41:27.0',1),
	 ('智园崇文园区3号楼',3,'113.99287,22.588043',1,0,'2023-09-14 09:46:04.0',1,NULL,NULL);

SELECT * FROM t_device_location tdl WHERE tdl.sn = '93309190134'; 

 SELECT * from t_device
        where del_flag = 0 and sn IN ('1570917631');

SELECT * FROM t_electric_fence; 
alter table t_electric_fence add `source` tinyint(2) DEFAULT NULL COMMENT '1有源 0无源' after fence_no;
UPDATE t_electric_fence SET	`source` = 1;

select tv.id as vid, tw.partner_order_no as appcode, tv.owner_name as username, tv.vin as vin, tvd.sn as imei, td.source,
(CASE td.source WHEN 1 THEN '有线' WHEN 0 THEN '无线' ELSE '' END) as equipment
 from t_vehicle_device tvd
left join t_device td on td.sn = tvd.sn 
left join t_vehicle tv on tv.id = tvd.vehicle_id 
left join t_workorder tw on tw.id = tv.workorder_id 
left join t_user tu on tv.created_by = tu.id 
where tu.tenant_id = 85  and tv.del_flag = 0  and tvd.del_flag = 0  and tvd.bind_status = 1  and tw.del_flag = 0  and tw.status = 2
AND tvd.sn IN ('96308220161','93309190134') ;

SELECT * FROM t_device tvd WHERE tvd.sn IN ('1620831629');  
SELECT * from t_electric_fence tef WHERE id = 1102328;
SELECT * FROM t_alarm_electric_fence WHERE sn = '93210200002';	
SELECT * FROM t_device_location tdl  WHERE sn = '96541445375';


SELECT * FROM t_workorder tw WHERE tw.partner_order_no = 'AP2022022414786';
SELECT DISTINCT order_source  FROM t_workorder tw ;
SELECT * FROM t_workorder tw WHERE tw.order_source = 'ZL';
UPDATE t_workorder SET order_source  = 'zlgj' WHERE order_source = 'ZL';

SELECT t1.partner_order_no,t2.vin FROM `t_workorder` t1
LEFT JOIN `t_workorder_vehicle` t2 ON t1.id = t2.workorder_id
WHERE t1.order_source = 'zlgj' 
AND t1.partner_order_no  NOT LIKE '%AP%' 
AND t1.del_flag = 0 AND t2.del_flag = 0 AND t1.status = 2 AND t2.status = 0

SELECT tv.vin , tw.partner_order_no  FROM t_vehicle tv LEFT join t_workorder tw ON tw.id = tv.workorder_id 
WHERE tv.del_flag = 0 AND tw.partner_order_no IS NOT NULL ; 	

SELECT * FROM t_user tu WHERE tu.account  = 'kai1212';	
SELECT * FROM t_cust_user_local_auth tcula WHERE tcula.account = 'kai1212';
SELECT * FROM t_cust_user_local_account tcula WHERE tcula.auth_id IN (748,749,750);
SELECT * FROM t_cust_user_auth_rel tcual WHERE  tcual.auth_id IN (748,749,750);
SELECT * FROM t_cust_user tcu WHERE tcu.id IN (748,749,750);
SELECT * FROM t_user tu WHERE tu.id = 8388;

select * from t_alarm_electric_fence taef ;
select * from t_electric_fence tef WHERE source IS NULL;

select
taef.id taefId,
taef.fence_id fenceId,
tw.partner_order_no bizOrderNo,
tv.owner_name ownerName,
tv.vin vin,
case when tv.type_id is null then tv.model_name else concat(tv.series_name, '/', tv.type_name) end modelName,
tvd.sn sn,
td.model_name deviceModelName,
tef.fence_name fenceName,
tef.source source,
taef.address address,
taef.fence_type alarmType,
taef.alarm_time alarmTime,
taef.end_time endTime
from t_alarm_electric_fence taef
left join t_vehicle_device tvd on tvd.id = taef.vd_id
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_workorder tw on tw.id = tv.workorder_id and tw.del_flag = 0
left join t_electric_fence tef on tef.id = taef.fence_id
where tv.del_flag = 0
and taef.del_flag = 0
and tvd.del_flag = 0
and tef.del_flag = 0;

select
count(1)
from t_alarm_electric_fence taef
left join t_vehicle_device tvd on tvd.id = taef.vd_id
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_electric_fence tef on tef.id = taef.fence_id
where tv.del_flag = 0
and taef.del_flag = 0
and tvd.del_flag = 0
and tef.del_flag = 0
;

SELECT
	count(1)
FROM
	t_alarm_electric_fence taef
LEFT JOIN t_vehicle_device tvd ON
	tvd.id = taef.vd_id
LEFT JOIN t_device td ON
	td.sn = tvd.sn
LEFT JOIN t_vehicle tv ON
	tv.id = tvd.vehicle_id
LEFT JOIN t_electric_fence tef ON
	tef.id = taef.fence_id
WHERE
	tv.del_flag = 0
	AND taef.del_flag = 0
	AND tvd.del_flag = 0
	AND tef.del_flag = 0
	AND tv.created_by IN (
		SELECT
			t_user.id
		FROM
			t_user
		WHERE
			t_user.department_id IN (
				4665, 4666, 4667, 4668, 4669, 4670, 4671, 4672, 4673, 4674, 4675, 4676, 4677, 4678, 4679, 4680, 4681, 4682, 4683, 4684, 4685, 4686, 4687, 4688, 4689, 4690, 4691, 4692, 4693, 4694, 4695, 4696, 4697, 4698, 4699, 4700, 4701, 4702, 4703, 4704, 4705, 4706, 4707, 4708, 4709, 4710, 4711, 4712, 4713, 4714, 4715, 4716, 4717, 4718, 4719, 4720, 4721, 4722, 4723, 4724, 4725, 4726, 4727, 4728, 4729, 4730, 4731, 4732, 4733, 4734, 4735, 4736, 4737, 4738, 4739, 4740, 4741, 4742, 4743, 4744, 4745, 4746, 4747, 4748, 4749, 4750, 4751, 4752, 4753, 4754, 4755, 4756, 4757, 4758, 4759, 4760, 4761, 4762, 4763, 4764, 4765, 4766, 4767, 4768, 4769, 4770, 4771, 4772, 4773, 4774, 4775, 4776, 4777, 4778, 4779, 4780, 4781, 4782, 4783, 4784, 4785, 4786, 4787, 4788, 4789, 4790, 4791, 4792, 4793, 4794, 4795, 4796, 4797, 4798, 4799, 4800, 4801, 4802, 4803, 4804, 4805, 4806, 4807, 4808, 4809, 4810, 4811, 4812, 4813, 4814, 4815, 4816, 4817, 4818, 4819, 4820, 4821, 4822, 4823, 4824, 4825, 4826, 4827, 4828, 4829, 4830, 4831, 4832, 4833, 4834, 4835, 4836, 4837, 4838, 4839, 4840, 4841, 4842, 4843, 4844, 4845, 4846, 4847, 4848, 4849, 4850, 4851, 4852, 4853, 4854, 4855, 4856, 4857, 4858, 4859, 4860, 4861, 4862, 4863, 4864, 4865, 4866, 4867, 4868, 4869, 4870, 4871, 4872, 4873, 4874, 4875, 4876, 4877, 4878, 4879, 4880
			)
	)
UNION
SELECT
	count(1)
FROM
	t_alarm_electric_fence taef
LEFT JOIN t_vehicle_device tvd ON
	tvd.id = taef.vd_id
LEFT JOIN t_device td ON
	td.sn = tvd.sn
LEFT JOIN t_vehicle tv ON
	tv.id = tvd.vehicle_id
LEFT JOIN t_electric_fence tef ON
	tef.id = taef.fence_id
WHERE
	tv.del_flag = 0
	AND taef.del_flag = 0
	AND tvd.del_flag = 0
	AND tef.del_flag = 0
	AND (
		taef.id IN (
			SELECT
				tvp.content_id
			FROM
				t_vehicle_permit tvp
			WHERE
				tvp.del_flag = 0
				AND tvp.receiver_id IN (8174)
					AND tvp.content_type = 0
		)
		OR taef.created_by IN (
			SELECT
				tu2.id
			FROM
				t_user tu2
			WHERE
				tu2.del_flag = 0
				AND tu2.department_id IN (
					SELECT
						tvp.content_id
					FROM
						t_vehicle_permit tvp
					WHERE
						tvp.del_flag = 0
						AND tvp.receiver_id IN (8174)
							AND tvp.content_type = 2
				)
				AND tu2.id NOT IN (
					8193, 8194, 8195, 8196, 8197, 8198, 8199, 8200, 8201, 8202, 8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214, 8215, 8216, 8217, 8218, 8219, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242, 8243, 8244, 8245, 8246, 8247, 8248, 8249, 8250, 8251, 8252, 8253, 8254, 8255, 8256, 8257, 8258, 8259, 8260, 8261, 8262, 8263, 8264, 8265, 8266, 8267, 8268, 8269, 8270, 8271, 8272, 8273, 8274, 8275, 8276, 8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284, 8285, 8286, 8287, 8288, 8289, 8290, 8291, 8292, 8293, 8294, 8295, 8296, 8297, 8298, 8299, 8300, 8301, 8302, 8303, 8304, 8305, 8306, 8307, 8308, 8309, 8310, 8311, 8312, 8313, 8314, 8315, 8316, 8317, 8318, 8319, 8320, 8321, 8322, 8323, 8324, 8325, 8326, 8327, 8328, 8329, 8330, 8331, 8332, 8333, 8334, 8335, 8336, 8338, 8339, 8340, 8341, 8342, 8343, 8344, 8345, 8346, 8347, 8348, 8351, 8354, 8358, 8378, 8379, 8380, 8382, 8387, 8388, 8148, 8149, 8150, 8151, 8152, 8153, 8154, 8155, 8156, 8157, 8158, 8159, 8160, 8161, 8162, 8163, 8164, 8165, 8166, 8167, 8168, 8169, 8170, 8171, 8172, 8173, 8174, 8175, 8176, 8177, 8178, 8179, 8180, 8181, 8185, 8186, 8187, 8188, 8189, 8190
				)
		)
	);


SELECT * FROM t_alarm_electric_fence taef WHERE taef.sn = '93309190134'; 
SELECT * FROM t_alarm_electric_fence taef WHERE taef.sn = '93309190133'; 

select * from t_electric_fence tef WHERE tef.fence_name = '仲利的无线围栏';
select * from t_electric_fence_sns tefs WHERE sn=  '93309190134';
select * from t_vehicle_device tvd WHERE tvd.sn  = '93309190134';
SELECT *FROM  t_vehicle tv WHERE tv.vin = 'LFMBD85B360067059';

select
count(1)
from t_alarm_electric_fence taef
left join t_vehicle_device tvd on tvd.id = taef.vd_id
left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_electric_fence tef on tef.id = taef.fence_id
where tv.del_flag = 0
and taef.del_flag = 0
and tvd.del_flag = 0
and tef.del_flag = 0
AND taef.sn = '93309190134'
;

select * from t_device td WHERE td.sn = '1570921451';
SELECT * FROM t_vehicle_device tvd WHERE tvd.sn = '1570921451';
CREATE TABLE `t_device_stay_often` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '里程主键ID',
  `sn` varchar(32) DEFAULT NULL COMMENT '设备号',
  `vd_id` int(11) DEFAULT NULL COMMENT '车辆、设备关系id',
  `home_address` varchar(64) DEFAULT NULL COMMENT '预测家庭地址',
  `home_lng` varchar(20) DEFAULT NULL COMMENT '家庭地址经度',
  `home_lat` varchar(20) DEFAULT NULL COMMENT '家庭地址纬度',
  `work_address` varchar(64) DEFAULT NULL COMMENT '预测工作地址',
  `work_lng` varchar(20) DEFAULT NULL COMMENT '工作地址经度',
  `work_lat` varchar(20) DEFAULT NULL COMMENT '工作地址纬度',
  `predict_date` datetime DEFAULT NULL COMMENT '预测时间',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间|入库时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_sn` (`sn`),
  KEY `idx_predict_date` (`predict_date`),
  KEY `idx_vd_id` (`vd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新e盾|预测家庭地和预测工作地表';

SELECT * FROM  t_device_stay_often WHERE sn  = '1570921451';
SELECT * FROM  t_device_journey;
SELECT * FROM t_device td WHERE td.sn = '1570921451'; 

SELECT sn , count(1) AS num  FROM t_device_journey GROUP BY sn ORDER BY num desc; 
UPDATE t_device_journey SET sn = '1570921451' WHERE sn = '1590427260';
SELECT * FROM t_device_journey WHERE sn = '1570921451';
SELECT * FROM t_alarm_warn_analyse tawa WHERE tawa.device_noes  = '1570921451,';
SELECT * FROM t_fake_offline_fence_sn WHERE  sn = '1570921451';
SELECT * FROM t_fake_offline_change_frequently WHERE sn = '1570921451'; 

SELECT * FROM t_fake_offline_fence_sn WHERE  sn = '96403151000';
SELECT * FROM t_fake_offline_change_frequently WHERE sn = '96403151000'; 
SELECT * FROM t_vehicle_device tvd WHERE tvd.sn = '93306280602'; 
SELECT * FROM t_vehicle_device tvd WHERE tvd.vehicle_id  = '62244'; 
SELECT * FROM t_vehicle tv WHERE tv.id = '62244';

select tvd.sn    AS sn,
               td.source AS source
        from t_vehicle_device tvd
                 LEFT JOIN t_device td ON td.sn = tvd.sn
        where tvd.vehicle_id = 73999
          AND tvd.bind_status = 1
          AND td.source = 1
          AND td.del_flag = 0
          and tvd.del_flag = 0
        order by tvd.created_date;
        
select tvd.id as vdId,
tw.partner_order_no as workOrderNo,
tv.owner_name as ownerName,
tvd.sn as sn,
tv.vin as vin,
tv.created_by as createdBy,
td.device_type as deviceType,
tvd.created_date as activeDate,
tdl.last_gps_time as lastGpsTime,
tdl.last_bs_time as lastBsTime,
td.source as `source`
from t_vehicle tv
left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
left join t_device td on td.sn = tvd.sn
left join t_workorder tw on tw.id = tv.workorder_id and tw.del_flag = 0
left join t_device_location tdl on tdl.sn = td.sn
where tv.del_flag = 0
and tvd.bind_status = 1
and tvd.del_flag = 0
    and ((tdl.last_gps_time < '2024-03-27 10:15:04' and tdl.last_bs_time < '2024-03-27 10:15:04')
    or (tdl.last_gps_time is null and tdl.last_bs_time is null)
    or (tdl.last_gps_time is null and tdl.last_bs_time < '2024-03-27 10:15:04')
    or (tdl.last_gps_time < '2024-03-27 10:15:04' and tdl.last_bs_time is null)
    )
    and tv.id = '73657'
order by vdId DESC;
        
 select distinct tv.vin
from t_fake_offline_fence_sn tfofs
left join t_vehicle_device tvd on tvd.sn = tfofs.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
where tfofs.status = 1
and tfofs.del_flag = 0
and tvd.del_flag = 0
and tvd.bind_status = 1
and tv.vin IN ('LXAS438842B1AA10S');

SELECT *
    from t_fake_offline_change_frequently tfocf
    where del_flag = 0
      and status = 1
      and vin IN ('LXAS438842B1AA10S');

SELECT * FROM  t_whitelist_sn WHERE vin IN ('LXAS438842B1AA10S');

SELECT * FROM t_vehicle_device tvd WHERE tvd.sn = '1501024404';
SELECT * FROM t_device_location tdl WHERE tdl.sn = '1501024404';

 SELECT begin_time,
        YEAR(begin_time) AS yearInt,
        WEEK(begin_time,1) AS weekInt,
        sum(mileage)     AS weekNum
        FROM t_device_journey
        WHERE sn = 1570921451
        AND del_flag = 0
        GROUP BY yearInt,weekInt
        ORDER BY yearInt ,weekInt;
       
SELECT
DATE(begin_time) AS dayInt,
sum(mileage)/1000 AS dayNum
FROM t_device_journey
WHERE sn = 1570921451
GROUP BY dayInt
ORDER BY dayInt;       

SELECT begin_time, WEEK(begin_time) FROM t_device_journey WHERE sn = 1570921451 ORDER BY begin_time DESC ;
SELECT * FROM t_device_journey WHERE del_flag <> 0;
SELECT * FROM  t_device_journey  WHERE sn = '1570921451';
       
        
SELECT SUM(mileage)
        FROM t_device_journey
        WHERE sn = 1570921451 
        AND begin_time >= '2020-08-10 00:00:00'
        AND begin_time <= '2020-08-16 23:59:59';
       
SELECT * FROM t_device_journey  WHERE sn = 1570921451 ;   
SELECT vehicle_id ,device_noes,alarm_level,alarm_explain,deal_status FROM `t_alarm_warn_analyse` WHERE device_noes IN(1591126173) AND del_flag=0;
SELECT vehicle_id,device_noes,alarm_level,alarm_explain FROM `t_alarm_warn_analyse` WHERE device_noes IN(1501024404) AND del_flag=0 AND deal_status =2;
SELECT * FROM `t_alarm_warn_analyse` WHERE del_flag=0 AND deal_status =2 AND alarm_level =2;
SELECT * FROM t_alarm_warn_analyse WHERE deal_status = 2 AND vehicle_id = 58859;
SELECT * FROM t_device tdj WHERE tdj.sn in ('93306280602','1570916115');  

select tv.id,
               twv.lessee_name                              AS lesseeName,
               tw.`shop_name`                               AS shopName,
               tw.partner_order_no                          AS workOrderNo,
               tv.vin                                       as vin,
               tw.created_date                              AS createTime,
               group_concat(tvd.sn ORDER BY tvd.id)         as sns,
               group_concat(td.source ORDER BY tvd.id)      as sources,
               group_concat(td.device_type ORDER BY tvd.id) AS deviceTypes
        from t_vehicle tv
                 LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id
                 LEFT JOIN t_device td ON td.sn = tvd.sn
                 LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id AND tw.del_flag = 0
                 LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id AND twv.del_flag = 0
        where tv.del_flag = 0
          AND tvd.bind_status = 1
          AND tvd.del_flag = 0
          AND tv.id = 74009
        GROUP BY tv.id;
       
SELECT * FROM t_workorder ;    
SELECT * FROM t_workorder_vehicle; 
SELECT * FROM t_device_stay_often;

SELECT * FROM t_vehicle tv WHERE vin = 'LHGRY3885L2028533'; 
SELECT * FROM t_workorder tw WHERE tw.id = 16337;
SELECT * FROM t_workorder_vehicle twv WHERE twv.workorder_id = 26856; 	
SELECT * FROM t_workorder_vehicle  where del_flag = 0 and workorder_id =26856 limit 1;

-- 2691212737,1591126173
select
tv.*
from t_vehicle tv
inner join t_vehicle_device tvd on tvd.vehicle_id = tv.id
where tv.del_flag = 0 and tvd.bind_status = 1 and tvd.del_flag = 0
    and tvd.sn = '1591126173';
   
SELECT * from t_workorder_vehicle
where del_flag = 0
and workorder_id =  26856
limit 1;

SELECT * FROM t_device_stay_often;
   
SELECT * FROM t_vehicle tv;
SELECT * FROM t_workorder tw;	
SELECT * FROM t_workorder_vehicle twv ; 

SELECT owner_name ,tv.vin ,model_name,license_plate ,tv.owner_tel ,twv.engine_no,tvd.sn FROM t_vehicle tv 
LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id
LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id 
LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id 
WHERE tvd.sn IS NOT NULL AND tv.owner_tel IS NOT NULL AND model_name IS NOT NULL ;

       



























