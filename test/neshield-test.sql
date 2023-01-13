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