select distinct triggerType
from d_electric_fence_alarm;

select distinct electricFenceType
from d_electric_fence;

select distinct orderSource
from d_vehicle_workorder
where orderType = 'PAZL'
  and status <> 2;

select area, area_id, areaId
from d_vehicle_workorder
where sqbh = 'PAGL-3062391-2022ZLTJ100443710-ZL-01-1122152140505';

select distinct area_id
from d_vehicle_workorder
where orderType = 'PAZL';

select distinct address
from d_vehicle_workorder
where orderType = 'PAZL';

select area, area_id, areaId
from d_vehicle_workorder
where area_id is not null
  and area is not null;

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3060945-2022ZLTJ100443777-ZL-01-1122155320149';

select area, areaId
from d_vehicle_workorder
where sqbh = 'PAZL';

select sqbh, activeTime, workOrderId, createtime
from d_vehicle_workorder
where sqbh = 'PAGL-3060945-2022ZLTJ100443777-ZL-01-1122155320149';

select *
from d_vehicle
where workOrderId = 960335;

select *
from d_track_info
where userId = 3249643;

select *
from d_user
where d_LoginUserId = 498;

select *
from d_vehicle_workorder
where status = 0
  and orderType = 'PAZL';

select area, areaId
from d_vehicle_workorder
where orderType = 'PAZL';

select *
from t_track_stujudge_alarm
where sn = '1620830683';

select *
from t_track_stujudge_alarm
where poi_type is not null
  and delflag = 2;

select *
from d_electric_fence_alarm
where sn = '15209040250';

select *
from d_vehicle
where standno = 'LFV3A23C2J3009965';

select *
from d_track_info
where userId in (3226263, 3226201);

select *
from d_electric_fence_alarm
where sn = 15204120221;

select *
from d_electric_fence_sns
where sn = 15209040250;

select *
from d_electric_fence
where id in (7016, 7017);

select *
from d_track_info
where sn = 15204120221;

select *
from d_vehicle
where userId = 3157145;

select *
from d_vehicle
where vehicleId = 994713;

select dv.idnum, dv.name as ownerName, dv.standno
from d_vehicle dv
         left join d_electric_fence_sns defs on defs.standno = dv.standno
         left join d_electric_fence def on def.id = defs.fenceId
where def.id = 7016;

select dv.idnum, dv.name as ownerName
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dti.sn = 15204120221;


select *
from t_track_stujudge_alarm
where left(begintime, 10) = '2022-12-05';

select *
from d_electric_fence
where id = 7177;

select *
from d_track_info
where sn = 1780720528;


select *
from d_electric_fence_alarm
where sn = 1780720528;

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3090717-2022ZLTJ100454973-ZL-01-1206143258654';

select *
from d_vehicle
where standno = 'JN8B*********0471';

select *
from d_track_info
where sn = '1621104589';

select *
from d_track_info
where userId = 3248287;

update d_vehicle
set isSubUserId =3249322
where vehicleId = 1019147;

update d_track_info
set isActive   = 1,
    activeDate = sysdate()
where sn = '1621104589';

update d_track_info
set vehicleId = 1019147
where sn = '1621104589';

update d_track_info
set issub = 0
where sn = '15210250267';
update d_track_info
set issub = 1
where sn = '1621104589';

select areaId
from d_vehicle_workorder
where sqbh = 'PAGL-3092337-2022ZLTJ100455617-ZL-01-1207095557303';

select *
from d_alarm_second_data
where sn = '1510120347';

select *
from d_track_info
where sn = '1620818727';

select *
from d_vehicle
where userId = 3215806;

select sqbh
from d_vehicle_workorder
where standno = 'LC0C*********3105';

select *
from d_vehicle
where standno = 'LFV3A23C8D3026967';

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3094244-2022PAZL101302032-ZL-01-1208155727721';

select *
from d_vehicle
where workOrderId = 963169;

select *
from d_vehicle
where standno = 'LC0C*********3105';

select *
from d_track_info
where userId in (3220976, 3221186);

select *
from d_user
where d_LoginUserId = 498;


select *
from d_track_info
where userId = 1951424;

select *
from d_vehicle_workorder
where standno = 'LGAX3AG47K1028862';

select *
from d_class
where className like '%东莞茂鑫%';

select *
from d_class
where className = '东莞茂鑫（广东）F广东高静（包活干）';

select *
from d_group
where vehicleGroupId = 170;

select *
from d_class
where classid = 5553;

update d_vehicle
set classId = 5553
where standno = 'LGAX3AG47K1028862';

update d_vehicle_workorder
set classId = 5553
where standno = 'LGAX3AG47K1028862';

select *
from t_track_stujudge_alarm
where sn = '1511026711'
  and alarm_type = 2;


select *
from d_feedback_pa
where workorder_id = 963169;

select *, count(1) as num
from d_vehicle_workorder
group by standno
having num > 1;

select *
from d_vehicle_workorder
where sqbh in
      ('PAGL-3089799-2022PAZL101300588-ZL-01-1206141006455', 'PAGL-3095602-2022PAZL101301635-ZL-01-1208101850941');

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3095602-2022PAZL101301635-ZL-01-1208101850941';

select *
from d_vehicle_workorder
where workOrderId = 962472
;


select *
from d_vehicle_workorder
where sqbh = 'PAGL-3101769-2022ZLTJ100459388-ZL-01-1209213219280';

select *
from d_app_image
where workOrderId = 967493;

select *
from d_user
where username = 'PAXM';

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3103659-2022ZLTJ100460037-ZL-01-121015493721';

select *
from d_vehicle
where workOrderId = 963790;

update d_vehicle_workorder
set status = 0
where workOrderId = 970460;

select *
from d_user
where d_LoginUserId = 4802;

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3196162-2023ZLTJ100500102-ZL-01-0109155907989';

select *
from d_track_info
where sn = 16208046931620;

select *
from d_location_check_log
where sn = 16208046931620;
select *
from d_location_check_log
where sn = '1620804693';

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3199545-2023ZLTJ100501803-ZL-01-0110144737233';

select *
from d_app_image
where workOrderId = 974247;

select *
from d_vehicle
where workOrderId = 974247;

select *
from d_vehicle
where name = '周**'
  and standno = 'LHGC*********7661';

select *
from d_track_info
where vehicleId = 1030643;

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3168596-2023ZLTJ100486139-ZL-01-0101104448529';

select *
from d_vehicle
where workOrderId = 972156;

select *
from d_track_info
where vehicleId = 1029167;

update d_vehicle_workorder
set status = 0
where workOrderId = 970470;

select *
from d_vehicle_workorder
where orderType = 'PAZl'
  and left(activeTime, 10) = '2023-01-12';

# 激活时间，业务工单号，姓名，车架，分组分类，贷款期限（汇通有此数据）

select dvw.activeTime,
       dvw.sqbh,
       dvw.name,
       dvw.standno,
       dg.groupName,
       dc.className,
       dvw.creditPeriod,
       dvw.activeTime
from d_vehicle_workorder dvw
         left join d_vehicle dv on dv.workOrderId = dvw.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where dvw.status = 1
  and dvw.activeTime >= '2018-01-01';

select dvw.activeTime, dvw.sqbh, dvw.name, dvw.standno, dg.groupName, dc.className, dvw.creditPeriod
from d_vehicle dv
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where dv.status = 0
  and dvw.activeTime >= '2018-01-01'
order by dvw.activeTime;

select dvw.activeTime, dvw.sqbh, dvw.name, dvw.standno, dg.groupName, dc.className, dvw.creditPeriod
from d_vehicle dv
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where
   dvw.activeTime >= '2018-01-01'
order by dvw.activeTime;

# dv.status = 0 and

select dvw.activeTime, dvw.sqbh, dvw.name, dvw.standno, dg.groupName, dc.className, dvw.creditPeriod
from d_vehicle dv
         left join d_track_info dti  on dti.vehicleId = dv.vehicleId
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where dv.status = 0 and
   dvw.activeTime >= '2018-01-01'
order by dvw.activeTime;

select count(1)
from d_vehicle dv
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where dv.status = 0  and
   dvw.activeTime >= '2018-01-01'
order by dvw.activeTime;

select count(dti.sn)
from d_vehicle dv
         left join d_track_info dti on dti.vehicleId = dv.vehicleId
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
         left join d_class dc on dc.classid = dv.classId
         left join d_group dg on dg.vehicleGroupId = dc.vehicleGroupId
where dv.status = 0 and
   dvw.activeTime < '2018-01-01'
order by dvw.activeTime;

#

# 1 总数 994890
# 2 18年之前的数量 472676


select *
from d_user
where d_LoginUserId = 4537;

select *
from d_feedback_param
where sqbh = '';

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3103659-2022ZLTJ100460037-ZL-01-121015493721';

update d_vehicle_workorder
set status = 1
where workOrderId = 963790;

select *
from d_vehicle
where workOrderId = 963790;

update d_vehicle
set status = 0
where vehicleId = 1020518;

select *
from d_track_info
where userId = 3256716;

update d_track_info
set isActive   = 1,
    activeDate = sysdate(),
    vehicleId  = 1020518
where userId = 3256716;

select *
from d_user
where d_LoginUserId = 4626;

select * from d_track_alarm_rec where sn = '15212150726';

select source
from d_track_info where sn = '15212150726';

select *
from d_vehicle where vehicleId = 1033146;

select *
from d_device_login order by d_device_id desc ;

select *
from d_vehicle_workorder where sqbh = 'PAGL-3139574-2022PAZL101312905-ZL-01-1222143741105';

select * from d_vehicle where workOrderId = 967457;

select * from d_track_info where userId = 3249132;
select * from d_track_info where userId = 3265123;

select *
from d_user where d_LoginUserId = 9;


update d_vehicle_workorder set status = 1 where workOrderId =970236;
update d_vehicle set status = 0 where workOrderId = 970236;
update d_track_info set isActive = 1 , activeDate = sysdate() ,vehicleId = 1026489 where userId = 3269326;

update d_vehicle_workorder set status = 1 where workOrderId =967908;
update d_vehicle set status = 0 where workOrderId = 967908;
update d_track_info set isActive = 1 , activeDate = sysdate() ,vehicleId = 1024518 where userId = 3264667;
update d_track_info set isActive = 1 , activeDate = sysdate() ,vehicleId = 1024518 where userId = 3265123;

update d_vehicle_workorder set status = 1 where workOrderId =967457;
update d_vehicle set status = 0 where workOrderId = 967457;
update d_track_info set isActive = 1 , activeDate = sysdate() ,vehicleId = 1026489 where userId = 3249132;

select *
from d_device_login where sn = '1621225931';

select
        d.vehicleId,
        d.name,
        d.standno,
        t.source,
        date_format(dl.lastRtTrack,'%Y-%m-%d %H:%i:%s') as lastRtTrack,
        date_format(dl.lastGprsTime,'%Y-%m-%d %H:%i:%s')  as lastGprsTime ,
        t.sn as sn,
        t.source as source,
        dl.speed as speed,
        dl.device_stay_status as deviceStayStatus,
        dvw.shopName,
        d.idnum,
        dvr.vehicle_icon as vehicleIcon,
        dvr.user_remark as userRemark
        from d_track_info t
        INNER JOIN d_vehicle d on t.vehicleId = d.vehicleId
        left join d_vehicle_remark dvr on dvr.vehicle_id = d.vehicleId
        left JOIN d_device_login dl on dl.sn = t.sn
        LEFT JOIN d_vehicle_workorder dvw ON dvw.workOrderId = d.workOrderId AND dvw.`status` != 2
        where t.sn ='1621225931';

select *
from d_track_info where sn in (
'93162586960',
'93162586961',
'93162586962',
'93162586963',
'93162586964',
'93162586965',
'93162586966',
'93162586967',
'93162586968',
'93162586969',
'93162586970',
'93162586971',
'93162586972',
'93162586973',
'93162586974',
'93162586975',
'93162586976',
'93162586977',
'93162586978',
'93162586979',
'93162586980',
'93162586981',
'93162586982',
'93162586983',
'93162586984',
'93162586985',
'93162586986',
'93162586987',
'93162586988',
'93162586989',
'93162586990',
'93162586991',
'93162586992',
'93162586993',
'93162586994',
'93162586995',
'93162586996',
'93162586997',
'93162586998',
'93162586999',
'93162587000',
'93162587001',
'93162587002',
'93162587003',
'93162587004',
'93162587005',
'93162587006',
'93162587007',
'93162587008',
'93162587009',
'93162587010',
'93162587011',
'93162587012',
'93162587013',
'93162587014',
'93162587015',
'93162587016',
'93162587017',
'93162587018',
'93162587019',
'96540965881',
'96540965882',
'96540965883',
'96540965884',
'96540965885',
'96540965886',
'96540965887',
'96540965888',
'96540965889',
'96540965890',
'96540965891',
'96540965892',
'96540965893',
'96540965894',
'96540965895',
'96540965896',
'96540965897',
'96540965898',
'96540965899',
'96540965900',
'96540965901',
'96540965902',
'96540965903',
'96540965904',
'96540965905',
'96540965906',
'96540965907',
'96540965908',
'96540965909',
'96540965910',
'96540965911',
'96540965912',
'96540965913',
'96540965914',
'96540965915',
'96540965916',
'96540965917',
'96540965918',
'96540965919',
'96540965920',
'96540965921',
'96540965922',
'96540965923',
'96540965924',
'96540965925',
'96540965926',
'96540965927',
'96540965928',
'96540965929',
'96540965930',
'96540965931',
'96540965932',
'96540965933',
'96540965934',
'96540965935',
'96540965936',
'96540965937',
'96540965938',
'96540965939',
'96540965940',
'96541078412',
'96541078413',
'96541078414',
'96541078415',
'96541078416',
'96541078417',
'96541078418',
'96541078419',
'96541078420',
'96541078421',
'96541078422',
'96541078423',
'96541078424',
'96541078425',
'96541078426',
'96541078427',
'96541078428',
'96541078429',
'96541078430',
'96541078431',
'93162587648',
'93162587649',
'93162587650',
'93162587651',
'93162587652',
'93162587653',
'93162587654',
'93162587655',
'93162587656',
'93162587657'
    );

delete
from d_track_info
where sn in (
'93162586960',
'93162586961',
'93162586962',
'93162586963',
'93162586964',
'93162586965',
'93162586966',
'93162586967',
'93162586968',
'93162586969',
'93162586970',
'93162586971',
'93162586972',
'93162586973',
'93162586974',
'93162586975',
'93162586976',
'93162586977',
'93162586978',
'93162586979',
'93162586980',
'93162586981',
'93162586982',
'93162586983',
'93162586984',
'93162586985',
'93162586986',
'93162586987',
'93162586988',
'93162586989',
'93162586990',
'93162586991',
'93162586992',
'93162586993',
'93162586994',
'93162586995',
'93162586996',
'93162586997',
'93162586998',
'93162586999',
'93162587000',
'93162587001',
'93162587002',
'93162587003',
'93162587004',
'93162587005',
'93162587006',
'93162587007',
'93162587008',
'93162587009',
'93162587010',
'93162587011',
'93162587012',
'93162587013',
'93162587014',
'93162587015',
'93162587016',
'93162587017',
'93162587018',
'93162587019',
'96540965881',
'96540965882',
'96540965883',
'96540965884',
'96540965885',
'96540965886',
'96540965887',
'96540965888',
'96540965889',
'96540965890',
'96540965891',
'96540965892',
'96540965893',
'96540965894',
'96540965895',
'96540965896',
'96540965897',
'96540965898',
'96540965899',
'96540965900',
'96540965901',
'96540965902',
'96540965903',
'96540965904',
'96540965905',
'96540965906',
'96540965907',
'96540965908',
'96540965909',
'96540965910',
'96540965911',
'96540965912',
'96540965913',
'96540965914',
'96540965915',
'96540965916',
'96540965917',
'96540965918',
'96540965919',
'96540965920',
'96540965921',
'96540965922',
'96540965923',
'96540965924',
'96540965925',
'96540965926',
'96540965927',
'96540965928',
'96540965929',
'96540965930',
'96540965931',
'96540965932',
'96540965933',
'96540965934',
'96540965935',
'96540965936',
'96540965937',
'96540965938',
'96540965939',
'96540965940',
'96541078412',
'96541078413',
'96541078414',
'96541078415',
'96541078416',
'96541078417',
'96541078418',
'96541078419',
'96541078420',
'96541078421',
'96541078422',
'96541078423',
'96541078424',
'96541078425',
'96541078426',
'96541078427',
'96541078428',
'96541078429',
'96541078430',
'96541078431',
'93162587648',
'93162587649',
'93162587650',
'93162587651',
'93162587652',
'93162587653',
'93162587654',
'93162587655',
'93162587656',
'93162587657'
    );

select *
from d_workorder_reassign;

ALTER TABLE d_workorder_reassign modify workOrderInfo varchar(1024)   null comment '工单信息';

select *
from d_stat_alarm_his order by statId desc ;

select *
from d_track_alarm_rec_dailystat order by alarmDay desc ;

select *
from d_track_alarm_rec_dailystat_tmp;