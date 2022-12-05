select *
from t_track_stujudge_alarm
where sn = 93210200002;

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