select *
from t_track_stujudge_alarm
where sn = 15185613006;

select tc.full_name as area, tc1.full_name as city, tc2.full_name as province
from t_city tc
         left join t_city tc1 on tc1.id = tc.parent_id
         left join t_city tc2 on tc2.id = tc1.parent_id
where tc.id = 440305;

select *
from t_city
where area_name like '%南山%';

select dv.idnum, dv.name as ownerName, dv.standno
from d_vehicle dv
         left join d_electric_fence_sns defs on defs.standno = dv.standno
         left join d_electric_fence def on def.id = defs.fenceId
where def.id = 770;

select *
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dti.sn = '96210200001'
limit 1;

select *
from d_vehicle_workorder
where workOrderId = 829436;

select *
from d_user
where username = 'pingan';

select *
from d_user
where username = 'paxm';

select *
from t_city
where area_name like '%牡丹江%';

select *
from t_city
where parent_id = 231000;

select *
from d_vehicle_workorder
where sqbh = 'PAGLSX202301090001';
select *
from d_vehicle_workorder
where sqbh = 'PAGLSX202301090002';

select *
from d_app_image
where workOrderId = 829477;

select *
from d_app_image
where standno = '1234*********5434';

select distinct workOrderId
from d_app_image
where standno = '1234*********5434'
  and name = '张**';

select orderType
from d_vehicle_workorder
where sqbh = 'glsx_1673512745838';

select *
from d_feedback_param;