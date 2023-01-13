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

select turr.user_id      as userId,
       turr.role_id      as roleId,
       tm.menu_no        as menuNo,
       tm.menu_name      as menuName,
       tm.permission_tag as permissionTag
from t_role_menu trm
         left join t_menu tm on trm.menu_id = tm.menu_no
         left join t_user_role_relation turr on trm.role_id = turr.role_id
where trm.del_flag = 0
  and tm.del_flag = 0
  and turr.del_flag = 0
  and tm.enable_status = 1
  and tm.permission_tag = 'vehicle_vin_frequency'
  and turr.user_id in (1048);

select *
from t_user
where id = 1048;

select *
from t_user_role_relation
where user_id = 1048;

select *
from t_role_menu
where role_id = 64
  and menu_id = 6010211;

select *
from t_workorder
where id = 33707;

select *
from t_workorder_vehicle
where workorder_id = 33707;

select *
from t_workorder_vehicle_device
where workorder_id = 33707;

select *
from t_workorder_documents
where workorder_id = 33707;

select sysdate();

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
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)
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
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)
union
select tws.sn
from t_whitelist_sn tws
         left join t_vehicle_device tvd on tvd.sn = tws.sn
where tws.del_flag = 0
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
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226,
              1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847, 2610413431,
              1610125355,
              1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678, 2601025564, 2601023373,
              2601025567,
              2601110950, 1610108110, 1610112756, 2600919073, 1500911705, 1501111793, 1500921686, 1501024929,
              1501024930,
              1510519161, 1510802779, 1590630167, 1510116892)
         and tu.tenant_id = 44)

  and tws.department_id IN
      (select sub_id
       from t_organization
       where del_flag = 0
         and superior_id = 1611
       order by superior_id, depth);

select *
from t_workorder
where partner_order_no = '2022121516000001';

select *
from t_workorder_documents
where workorder_id = 33708;

select *
from t_device_location
where sn in (1700112234, 1570916886);