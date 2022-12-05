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

select *
from t_menu
where permission_tag = 'vehicle_vin_frequency';

select *
from t_workorder_documents;

select *
from t_alarm_track_stujudge
where sn = '1620830683';

select *
from t_alarm_track_stujudge
where poi_type is not null;

insert into t_role_menu (role_id, menu_id, del_flag, created_date, created_by)
select tr.id, 6010211, 0, sysdate(), 1
from t_role tr
where tr.del_flag = 0
  and tr.id <> 1;

select *
from t_role_menu
where menu_id = '6010211';

select *
from t_role
where id = 1;

select tvd.sn
from t_vehicle_device tvd
         left join t_fake_offline_fence_sn tfofs on tfofs.sn = tvd.sn and tfofs.del_flag = 0 and tfofs.status = 1
         left join t_fake_offline_change_frequently tfocf
                   on tfocf.sn = tvd.sn and tfocf.del_flag = 0 and tfocf.status = 1
         left join t_whitelist_sn tws on tws.sn = tvd.sn and tws.del_flag = 0
where tfofs.id is not null
   or tfocf.id is not null
   or tws.id is not null;

select tfofs.sn
from t_fake_offline_fence_sn tfofs
         left join t_vehicle_device tvd on tvd.sn = tfofs.sn
where tfofs.del_flag = 0
  and tfofs.status = 1
union
select tfocf.sn
from t_fake_offline_change_frequently tfocf
         left join t_vehicle_device tvd on tvd.sn = tfocf.sn
where tfocf.del_flag = 0
  and tfocf.status = 1
union
select tws.sn
from t_whitelist_sn tws
         left join t_vehicle_device tvd on tvd.sn = tws.sn
where tws.del_flag = 0;

select *
from t_alarm_electric_fence
where sn = '15209040250';

select *
from t_vehicle
where vin = 'LFV3A23C2J3009965';

select *
from t_message_log
where send_type = 'SMS'
  and to_user in (13029499567, 15140519567);

select *
from;
