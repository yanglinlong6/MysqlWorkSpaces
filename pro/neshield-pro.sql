select *
from t_tenant;

select tvd.sn
from t_vehicle_device tvd
         left join t_vehicle tv on tv.id = tvd.vehicle_id
         left join t_user tu on tu.id = tv.created_by
         left join t_device td on td.sn = tvd.sn
where tu.tenant_id = 44
  and tv.del_flag = 0
  and tvd.bind_status = 1
  and tvd.del_flag = 0
  and tv.del_flag = 0
  and tu.del_flag = 0
  and td.source = 0;

select *
from t_vehicle
where vin = 'LVSHFCAC1NS246579';

select *
from t_vehicle_device
where vehicle_id = 37052;

# 1867321
select count(temp.sn)
from (
         select sn
         from t_fake_offline_fence_sn
         Union
# 37779
         select sn
         from t_fake_offline_change_frequently) temp;



select count(*)
from t_whitelist_sn;