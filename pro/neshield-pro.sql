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
  and td.sn like '45%';

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
from t_vehicle
where vin = 'LSJW74U37MZ279884';

select tw.*
from t_workorder tw
         left join t_workorder_vehicle twv on twv.workorder_id = tw.id
where twv.vin = 'LSJW74U37MZ279884';

select *
from t_user
where id = 1048;

select *
from t_vehicle_device
where sn = 1780720528;

select *
from t_vehicle_device
where sn = 75210151801;

select *
from t_user
where id = 1292;

select tvd.sn
from t_vehicle tv
         left join t_workorder tw on tw.id = tv.workorder_id
         left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
where tv.del_flag = 0
  and tvd.del_flag = 0
  and tvd.bind_status = 1
  and tw.partner_order_no is null
  and tvd.sn in (
                 75209290996,
                 75209290997,
                 75209290999,
                 75209291000,
                 75209100186,
                 75209100162,
                 75209100140,
                 75209100122,
                 75209290004,
                 75209290015,
                 75209290019,
                 75209290022,
                 75209290025,
                 75209290027,
                 75209290029,
                 75209290030,
                 75209290031,
                 75209290032,
                 75209290033,
                 75209290034,
                 75209290035,
                 75209290038,
                 75209290039,
                 75209290040,
                 75209290044,
                 75209290052,
                 75209290063,
                 75209290066,
                 75209290077,
                 75209290078,
                 75209290080,
                 75209290081,
                 75209290082,
                 75209290083,
                 75209290085,
                 75209290086,
                 75209290096,
                 75209290101,
                 75209290102,
                 75209290103,
                 75209290106,
                 75209290107,
                 75209290109,
                 75209290110,
                 75209290111,
                 75209290112,
                 75209290113,
                 75209290116,
                 75209290123,
                 75209290127,
                 75209290144,
                 75209290146,
                 75209290147,
                 75209290148,
                 75209290151,
                 75209290152,
                 75209290159,
                 75209290161,
                 75209290164,
                 75209290166,
                 75209290170,
                 75209290171,
                 75209290174,
                 75209290175,
                 75209290176,
                 75209290177,
                 75209290178,
                 75209290181,
                 75209290182,
                 75209290185,
                 75209290189,
                 75209290190,
                 75209290192,
                 75209290199,
                 75209290200,
                 1620915116,
                 75208180917,
                 75208180919,
                 75208180920,
                 75208180921,
                 75208180922,
                 75208180923,
                 75208180924,
                 75208180925,
                 75208180926,
                 75208180927,
                 75208180928,
                 75208180929,
                 75208180946,
                 75208180947,
                 75208180948,
                 75208180954,
                 75208180957,
                 75208180958,
                 75208180960,
                 75208180964,
                 75208180966,
                 75208180972,
                 75208180973,
                 75208180976,
                 75208180977,
                 75208180979,
                 75208180981,
                 75208180986,
                 75208180988,
                 75208180993,
                 75208180994,
                 75208180992,
                 15208110670,
                 75208180013,
                 75208180028,
                 75208180029,
                 75208180030,
                 75208180031,
                 75208180035,
                 75208180054,
                 75208180093,
                 75207100714,
                 75207100719,
                 75207100730,
                 75207100760,
                 75207100770,
                 75207100779,
                 75207100782,
                 75207100783,
                 75207100789,
                 75207100813,
                 75207100817,
                 75207100818,
                 75207100819,
                 75207100820,
                 75207100821,
                 75207100822,
                 75207100841,
                 75207100853,
                 75207100890,
                 75207100892,
                 75206010957,
                 75206010972,
                 75206011122,
                 75206011151,
                 75206011155,
                 75206011157,
                 75206011158,
                 75206011159,
                 75206011160,
                 75206011184,
                 75206011198,
                 75206010474,
                 75206010411,
                 75206010572,
                 75206010557,
                 75206010555,
                 75206010480,
                 1500401228
    );

select tvd.sn, tw.partner_order_no
from t_vehicle tv
         left join t_workorder tw on tw.id = tv.workorder_id
         left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
where tv.del_flag = 0
  and tvd.del_flag = 0
  and tvd.bind_status = 1
  and tw.partner_order_no is null
  and tvd.sn in (
    1620915116
    );

select *
from t_vehicle
where vin = 'W7777777777777777';

select *
from t_workorder;



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
              1501025226, 1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847,
              2610413431, 1610125355, 1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678,
              2601025564, 2601023373, 2601025567, 2601110950, 1610108110, 1610112756, 2600919073, 1500911705,
              1501111793, 1500921686, 1501024929, 1501024930, 1510519161, 1510802779, 1590630167, 1510116892,
              4711014078, 4711014003, 4711014073, 4711014018, 4711014099, 97110140092, 4711014047, 4711014046,
              4711014035, 4711014056, 4711014060, 4711014050, 97110140075, 4711014045, 4711014041, 4711014016,
              4711014026, 4711014031, 4711014019, 4711014052, 4711014030, 97110140063, 97110140034, 4711014072,
              97110140079, 4711014023, 97110140065, 4711014088, 97110140061, 4711014066, 97110140076, 4711014079,
              97110140026, 4711014042, 4711014075, 97110140038, 4711014021, 97110140088, 4711014089, 97110140040,
              4711014092, 97110140021, 4711014051, 97110140049, 97110140084, 4711014005, 4711014083, 97110140096,
              4711014009, 97110140082, 4711014082, 97110140036, 97110140059, 97110140042, 97110140087, 4711014053,
              97110140048, 97110140004, 4711014059, 97110140025, 4711014011, 97110140050, 97110140033, 4711014084,
              97110140098, 97110140044, 4711014040, 97110140083, 4711014080, 4711014014, 97110140055, 97110140054,
              4711014077, 97110140031, 97110140041, 97110140095, 4711014038, 4711014043, 4711014058, 4711014067,
              97110140009, 97110140086, 4711014100, 97110140011, 4711014070, 97110140090, 4711014004, 97110140097,
              4711014097, 4711014076, 97110140069, 4711014068, 4711014087, 97110140091, 4711014048, 4711014027,
              4711014074, 97110140058, 4711014064, 97110140006, 97110140071, 4711014007, 4711014002, 97110140099,
              4711014055, 97110140014, 4711014049, 4711014017, 4711014044, 4711014054, 4711014001, 4711014095,
              97110140062, 4711014071, 4711014028, 97110140068, 4711014033, 4711014063, 97110140070, 4711014020,
              4711014091, 4711014025, 4711014085, 4711014062, 4711014086, 4711014024, 97110140001, 4711014015,
              97110140094, 4711014081, 97110140019, 4711014098, 4711014012, 97110140057, 4711014069, 4711014094,
              4711014032, 4711014022, 97110140005, 4711014034, 4711014036, 4711014093, 4711014008, 4711014010,
              4711014096, 4711014029, 97110140012, 4711014057, 97110140085, 97110140017, 4711014065, 4711014037,
              4711014013, 97110140029, 4711014006, 97110140072, 97110140089, 97110140028)
#          and tu.tenant_id = 44
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
         and tvd.sn not in
             (1510108783, 1610123299, 1510108984, 1500921784, 2601015192, 1510109188, 1610518869, 2600917392,
              1501025226, 1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847,
              2610413431, 1610125355, 1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678,
              2601025564, 2601023373, 2601025567, 2601110950, 1610108110, 1610112756, 2600919073, 1500911705,
              1501111793, 1500921686, 1501024929, 1501024930, 1510519161, 1510802779, 1590630167, 1510116892,
              4711014078, 4711014003, 4711014073, 4711014018, 4711014099, 97110140092, 4711014047, 4711014046,
              4711014035, 4711014056, 4711014060, 4711014050, 97110140075, 4711014045, 4711014041, 4711014016,
              4711014026, 4711014031, 4711014019, 4711014052, 4711014030, 97110140063, 97110140034, 4711014072,
              97110140079, 4711014023, 97110140065, 4711014088, 97110140061, 4711014066, 97110140076, 4711014079,
              97110140026, 4711014042, 4711014075, 97110140038, 4711014021, 97110140088, 4711014089, 97110140040,
              4711014092, 97110140021, 4711014051, 97110140049, 97110140084, 4711014005, 4711014083, 97110140096,
              4711014009, 97110140082, 4711014082, 97110140036, 97110140059, 97110140042, 97110140087, 4711014053,
              97110140048, 97110140004, 4711014059, 97110140025, 4711014011, 97110140050, 97110140033, 4711014084,
              97110140098, 97110140044, 4711014040, 97110140083, 4711014080, 4711014014, 97110140055, 97110140054,
              4711014077, 97110140031, 97110140041, 97110140095, 4711014038, 4711014043, 4711014058, 4711014067,
              97110140009, 97110140086, 4711014100, 97110140011, 4711014070, 97110140090, 4711014004, 97110140097,
              4711014097, 4711014076, 97110140069, 4711014068, 4711014087, 97110140091, 4711014048, 4711014027,
              4711014074, 97110140058, 4711014064, 97110140006, 97110140071, 4711014007, 4711014002, 97110140099,
              4711014055, 97110140014, 4711014049, 4711014017, 4711014044, 4711014054, 4711014001, 4711014095,
              97110140062, 4711014071, 4711014028, 97110140068, 4711014033, 4711014063, 97110140070, 4711014020,
              4711014091, 4711014025, 4711014085, 4711014062, 4711014086, 4711014024, 97110140001, 4711014015,
              97110140094, 4711014081, 97110140019, 4711014098, 4711014012, 97110140057, 4711014069, 4711014094,
              4711014032, 4711014022, 97110140005, 4711014034, 4711014036, 4711014093, 4711014008, 4711014010,
              4711014096, 4711014029, 97110140012, 4711014057, 97110140085, 97110140017, 4711014065, 4711014037,
              4711014013, 97110140029, 4711014006, 97110140072, 97110140089, 97110140028)
#          and tu.tenant_id = 44
      )
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
              1501025226, 1510109311, 1510108649, 1610125957, 75105200620, 1501023417, 1591211747, 1510627847,
              2610413431, 1610125355, 1610125519, 1610518496, 75107290976, 1501023623, 2601023603, 2601023678,
              2601025564, 2601023373, 2601025567, 2601110950, 1610108110, 1610112756, 2600919073, 1500911705,
              1501111793, 1500921686, 1501024929, 1501024930, 1510519161, 1510802779, 1590630167, 1510116892,
              4711014078, 4711014003, 4711014073, 4711014018, 4711014099, 97110140092, 4711014047, 4711014046,
              4711014035, 4711014056, 4711014060, 4711014050, 97110140075, 4711014045, 4711014041, 4711014016,
              4711014026, 4711014031, 4711014019, 4711014052, 4711014030, 97110140063, 97110140034, 4711014072,
              97110140079, 4711014023, 97110140065, 4711014088, 97110140061, 4711014066, 97110140076, 4711014079,
              97110140026, 4711014042, 4711014075, 97110140038, 4711014021, 97110140088, 4711014089, 97110140040,
              4711014092, 97110140021, 4711014051, 97110140049, 97110140084, 4711014005, 4711014083, 97110140096,
              4711014009, 97110140082, 4711014082, 97110140036, 97110140059, 97110140042, 97110140087, 4711014053,
              97110140048, 97110140004, 4711014059, 97110140025, 4711014011, 97110140050, 97110140033, 4711014084,
              97110140098, 97110140044, 4711014040, 97110140083, 4711014080, 4711014014, 97110140055, 97110140054,
              4711014077, 97110140031, 97110140041, 97110140095, 4711014038, 4711014043, 4711014058, 4711014067,
              97110140009, 97110140086, 4711014100, 97110140011, 4711014070, 97110140090, 4711014004, 97110140097,
              4711014097, 4711014076, 97110140069, 4711014068, 4711014087, 97110140091, 4711014048, 4711014027,
              4711014074, 97110140058, 4711014064, 97110140006, 97110140071, 4711014007, 4711014002, 97110140099,
              4711014055, 97110140014, 4711014049, 4711014017, 4711014044, 4711014054, 4711014001, 4711014095,
              97110140062, 4711014071, 4711014028, 97110140068, 4711014033, 4711014063, 97110140070, 4711014020,
              4711014091, 4711014025, 4711014085, 4711014062, 4711014086, 4711014024, 97110140001, 4711014015,
              97110140094, 4711014081, 97110140019, 4711014098, 4711014012, 97110140057, 4711014069, 4711014094,
              4711014032, 4711014022, 97110140005, 4711014034, 4711014036, 4711014093, 4711014008, 4711014010,
              4711014096, 4711014029, 97110140012, 4711014057, 97110140085, 97110140017, 4711014065, 4711014037,
              4711014013, 97110140029, 4711014006, 97110140072, 97110140089, 97110140028)
#          and tu.tenant_id = 44)

         and tws.department_id IN
             (select sub_id
              from t_organization
              where del_flag = 0
                and superior_id = 1
              order by superior_id, depth));

select *
from t_whitelist_sn;

select *
from t_vehicle_device
where sn = '45209280301';

select *
from t_vehicle
where id in (38499, 38706);

select *
from t_workorder
where id in (36491, 36509);

select *
from t_workorder_vehicle_device
where workorder_id in (36491, 36509);

select remark
from t_vehicle
where vin = 'LGWEF7A62GH290650';

select *
from t_vehicle_log;

ALTER TABLE t_vehicle_log
    modify remark varchar(1024) DEFAULT null comment '备注';
ALTER TABLE t_vehicle
    modify remark varchar(1024) DEFAULT null comment '备注';
