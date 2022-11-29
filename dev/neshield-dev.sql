select *
from t_role_menu;

select *
from t_menu tm
         left join t_menu_permission tmp on tmp.id = tm.menu_no
where tmp.permission_tag = 'vehicle_vin_frequency';

select *
from t_menu_permission
where permission_tag = 'vehicle_vin_frequency';

select *
from t_menu
where permission_tag = 'vehicle_vin_frequency';

select *
from t_role_menu
where menu_id = 6010211;

select *
from t_role tr
where tr.del_flag = 0;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010211, 0, sysdate(), 1
from t_role tr
where del_flag = 0;

select id, count(1) as num
from t_role_menu
where del_flag = 0
  and menu_id = 6010211
group by role_id
having num > 1;

delete
from t_role_menu
where id in (6988, 7069, 7040);

select *
from t_alarm_track_stujudge
where sn = '1501014648';

select *
from t_vehicle_device
where del_flag = 0;


select tvd.sn
from t_vehicle_device tvd
         left join t_vehicle tv on tv.id = tvd.vehicle_id
         left join t_user tu on tu.id = tv.created_by
where tu.tenant_id = 44
  and tv.del_flag = 0
  and tv.del_flag = 0
  and tu.del_flag = 0;