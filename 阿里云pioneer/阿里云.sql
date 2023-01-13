select tc.full_name, tc.id
from t_city tc
         left join sys_area sa on sa.id = tc.id
where sa.id is null;


select sa.area_name, sa.id
from sys_area sa
         left join t_city tc on tc.id = sa.id
where tc.id is null;

select *
from sys_area
where area_name like '%香港%';

select *
from t_city
where area_name = '南市区';

select *
from t_city
where id = 810000;

select *
from t_city
where area_name like '%离岛%';

select *
from t_city
where parent_id = 110000;

select *
from t_city
where parent_id = 110102;

select tc.full_name as area, tc1.full_name as city, tc2.full_name as province
from t_city tc
         left join t_city tc1 on tc1.id = tc.parent_id
         left join t_city tc2 on tc2.id = tc1.parent_id
where tc.id = 110106;


select *
from t_city
where id = 110000;

select *
from t_city
where area_name like '%荔湾区%';


INSERT INTO sys_area (id, area_name, area_code, parent_id, init_date)
SELECT id, full_name, area_code, parent_id, init_date
FROM t_city;

select *
from sys_area
where area_code = 110000;