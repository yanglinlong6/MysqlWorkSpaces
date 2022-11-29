insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 17010309, 0, sysdate(), 1
from t_role tr
where tr.del_flag = 0
  and tr.id <> 1;

select *
from t_role
where del_flag = 0;

select *
from t_role_menu
where menu_id = 17010309;

select *
from t_menu
where permission_tag = 'vehicle_vin_frequency';

select *
from t_tenant;

select *
from t_vehicle
where vin = 'testGYY1669356955';

select *
from t_vehicle_device
where vehicle_id = 73783;