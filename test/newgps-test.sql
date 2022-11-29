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