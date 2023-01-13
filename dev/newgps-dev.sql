select *
from t_track_stujudge_alarm
where sn in (96210200001, 96210200002);

select *
from t_track_stujudge_alarm
where sn = 9310772000;

SELECT dti.sn
FROM d_vehicle dv,
     d_track_info dti,
     d_class dc
WHERE dti.vehicleId = dv.vehicleId
  AND dc.classid = dv.classId
  AND dv.status = 0
  AND dc.vehicleGroupId IN (200);

select *
from t_track_stujudge_alarm t
where t.alarm_type = 3
  and t.delflag = 2
order by t.id desc;

select *
from t_track_stujudge_alarm
where sn in (
             4711014006,
             4711014013,
             4711014037,
             4711014065,
             4711014057,
             4711014029,
             4711014096,
             4711014010,
             4711014008,
             4711014093,
             4711014036,
             4711014034,
             4711014022,
             4711014032,
             4711014094,
             4711014069,
             4711014012,
             4711014098,
             4711014081,
             4711014015,
             4711014024,
             4711014086,
             4711014062,
             4711014085,
             4711014025,
             4711014091,
             4711014020,
             4711014063,
             4711014033,
             4711014028,
             4711014071,
             4711014095,
             4711014001,
             4711014054,
             4711014044,
             4711014017,
             4711014049,
             4711014055,
             4711014002,
             4711014007,
             4711014064,
             4711014074,
             4711014027,
             4711014048,
             4711014087,
             4711014068,
             4711014076,
             4711014097,
             4711014004,
             4711014070,
             4711014100,
             4711014067,
             4711014058,
             4711014043,
             4711014038,
             4711014077,
             4711014014,
             4711014080,
             4711014040,
             4711014084,
             4711014011,
             4711014059,
             4711014053,
             4711014082,
             4711014009,
             4711014083,
             4711014005,
             4711014051,
             4711014092,
             4711014089,
             4711014021,
             4711014075,
             4711014042,
             4711014079,
             4711014066,
             4711014088,
             4711014072,
             4711014030,
             4711014052,
             4711014019,
             4711014031,
             4711014026,
             4711014016,
             4711014041,
             4711014045,
             4711014050,
             4711014060,
             4711014056,
             4711014035,
             4711014046,
             4711014047,
             1510927176,
             75111051090,
             1510928296,
             75111240208,
             1511012663,
             75111240862,
             75201050986,
             75111241929,
             45111120326,
             45111120452,
             45111120466,
             1511012660,
             75111240852,
             1510115677,
             75201160550,
             1510112585,
             75111051100,
             1510115673,
             75201160551,
             1510927166,
             75111051081,
             1510927189,
             75111051086,
             75111240204,
             75111241544,
             1511224181,
             1610520319,
             45203070553,
             1510927193,
             75111051097,
             15111090754,
             45203070935,
             15111090757,
             45203070942,
             93107720006,
             8130902327,
             1610522773,
             2192801101,
             3010006003,
             3010007001,
             3010007000,
             3010006999,
             3010006004,
             3010006005,
             1700151515,
             1591113211,
             2691113936,
             1510112899,
             1700000001,
             1610507001,
             3010005989,
             3010005933,
             3010005933,
             75111051416,
             1610127312,
             1610127300,
             1610127297,
             1610127307,
             1610127299,
             1610127306,
             1610127303,
             1610127301,
             1610127298,
             75108032084,
             75108032085,
             75108032075,
             75111240322,
             75111241284,
             45111120391,
             1611012312,
             1611012313,
             2601204222,
             2601025417,
             2601204204,
             1610111616,
             1610111624,
             1610111618,
             1610111619,
             1610111615,
             2600628225,
             2600628223,
             2600628222,
             2600628228,
             2600628224,
             2600628221,
             1610525087,
             2601025374,
             2601025381,
             2601025400,
             1610113004,
             1610108136,
             1610113259,
             1610113270,
             1610113262,
             1610108146,
             1610108192,
             1610125392,
             1610125393,
             1610125403,
             1610125401,
             1610125388,
             1610125394,
             1610701065,
             1610701050,
             1610701225,
             1610701066,
             1610701220,
             1610701070,
             1610701223,
             75108030030,
             75111240485,
             75111240484,
             2601023676,
             2601023679,
             75110260157,
             75111240614,
             45111120832,
             45111120827,
             45111120831,
             1610425192,
             1610425188,
             1610425189,
             1510113901,
             1610120911,
             1510113903,
             1610120906,
             1510109116,
             1610125598,
             1510109117,
             1610125607,
             1510109113,
             1610125591,
             1510109123,
             1610125608,
             1510109122,
             1610125590,
             1510109120,
             1610125596,
             1501025232,
             1610107329,
             1501025279,
             2601110913,
             1501025272,
             1610123652,
             2600919073,
             1500921686,
             2601015674,
             1501025280,
             1501025235,
             2601110917,
             1510109383,
             1610513444,
             1501025230,
             2610622164,
             1501025227,
             2610622131,
             1501023730,
             1610523414,
             1610517946,
             1510627838,
             1501205445,
             1610523383,
             1501205457,
             1610523390,
             1510928987,
             75111051425,
             1511216218,
             75201050757,
             1511216219,
             45111120688,
             1510627402,
             1610522620,
             1510627404,
             1610522612,
             75108030052,
             1510927101,
             1510110401,
             75111240843,
             15111100233,
             45111120707,
             1510624159,
             1610522750,
             1510624149,
             1610522745,
             1510624148,
             1610522756,
             1511211117,
             45111120083,
             1511224205,
             45111120377,
             15111100267,
             45111120372,
             1510114506,
             75109080197,
             1510114507,
             75109080178,
             1511013222,
             75111051268,
             1510114508,
             75109080191,
             1510114505,
             75109080193,
             75111051204,
             15111080194,
             1510114509,
             75109080179,
             1591114499,
             75109080184,
             2601025560,
             1501024922,
             1510110214,
             1610111606,
             1510108990,
             1610112716,
             1500102710,
             2600401246,
             1500102764,
             2600717542,
             1500102751,
             2600401295,
             1500102722,
             1610118138,
             1510112541,
             2610413023,
             2600401236,
             1500102752,
             1610112757,
             1510113558,
             1510113557,
             1610118159,
             1610520227,
             1510623593,
             2600401282,
             1510113574,
             1610513502,
             1510519109,
             1610520226,
             1510623586,
             1510113572,
             1610118134,
             1610518455,
             1510627873,
             1510113573,
             1610118136,
             1610118129,
             1510627576,
             1610118130,
             1510113570,
             1610110123,
             1510623596,
             1610118141,
             1510627584,
             1610118133,
             1510627589,
             1610118135,
             1510625699,
             1510627591,
             1610522645,
             2610413057,
             1510627819,
             1610118131,
             1510627578,
             1610118140,
             1510627583,
             1610118132,
             1510627581,
             2610413006,
             1510627810,
             1610118137,
             1510627588,
             1510625687,
             1610522716,
             1610522644,
             1510627781,
             1610522631,
             1510627787,
             1510625537,
             75105200529,
             1510519008,
             75105200054,
             1510625551,
             75105200509,
             1510625552,
             75105200512,
             1510625543,
             75105200518,
             1510113556,
             75105200055,
             1510519000,
             75105200053,
             2600717230,
             1510625541,
             1510627887,
             75105200659,
             1590630891,
             1610112375,
             2600911886,
             1501110577,
             1510627513,
             75105200033,
             2600717218,
             1510625550,
             2600911879,
             1510627520,
             2600618999,
             1510109025,
             1510121620,
             75105200613,
             1510519007,
             75105200067,
             1510617805,
             75105200694,
             1510519011,
             75105200068,
             1510623682,
             1610522183,
             1510519013,
             75105200064,
             1610522224,
             1510627788,
             1510623671,
             1610522178,
             1610110230,
             1510623978,
             1610111620,
             1510119435,
             1510626012,
             75105200533,
             2610622898,
             1510824223,
             1510715173,
             75105200075,
             2610622866,
             1510824226,
             1510113780,
             75105200685,
             1510121621,
             75105200616,
             1510114493,
             1610523091,
             1610120038,
             1510519006,
             1610125497,
             1510623974,
             1510623683,
             1610522177,
             1510110200,
             1610522693,
             1610522634,
             1510627795,
             1591113257,
             75105200639,
             1500628380,
             75105200628,
             1510623673,
             75105200629,
             1610118139,
             1510627775,
             1610522633,
             1510627782,
             1610521427,
             1510627780,
             75108030004,
             1510922251,
             75105200664,
             1510922249,
             75108032012,
             1510927123,
             1610521434,
             1510627774,
             75105200601,
             1510922695,
             1610522190,
             1510627783,
             75107290253,
             1510922208,
             75105200644,
             1510922699,
             75108030006,
             1510927112,
             75108030007,
             1510927103,
             75109080439,
             1510922678,
             75108032002,
             1510927148,
             1510617777,
             75107290241,
             75108030042,
             1510922692,
             75108030035,
             1510927146,
             75107290256,
             97110140098,
             1610911970,
             1510922685,
             75108030009,
             97110140096,
             1610516548,
             1510627798,
             1610911967,
             1510922688,
             75110260742,
             1511025792,
             75110260941,
             1511025743,
             75110260744,
             1511025789,
             75110260735
    )
  and delflag = 2;

select *
from d_electric_fence;

select area, areaId
from d_vehicle_workorder
where sqbh = 'PA1595344984117219328';

select area, areaId, area_id
from d_vehicle_workorder
where orderType = 'pazl';

update d_vehicle_workorder
set areaId = area
where orderType = 'pazl';

select *
from d_city
where level = 'district';

select *
from t_city
where full_name like '%北京市%';

select tc.full_name as area, tc1.full_name as city, tc2.full_name as province
from t_city tc
         left join t_city tc1 on tc1.id = tc.parent_id
         left join t_city tc2 on tc2.id = tc1.parent_id
where tc.id = 110000;

select *
from d_electric_fence
where id = 743;

select dv.idnum, dv.name as ownerName, dv.standno
from d_vehicle dv
         left join d_electric_fence_sns defs on defs.standno = dv.standno
         left join d_electric_fence def on def.id = defs.fenceId
where def.id = 770;

select dti.sn
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dv.standno = 'GLCW2021102010001';

select dv.idnum, dv.name as ownerName
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dti.sn = 32146525113;

select dv.idnum, dv.name as ownerName
from d_vehicle dv
         left join d_track_info dti on dti.userId = dv.userId
where dv.status = 0
  and dti.sn = 8160602923;

select *
from d_vehicle_workorder
where orderType = 'pazl'
  and status = 1;

select *
from d_vehicle
where workOrderId = 829136;

CREATE TABLE `d_location_check_log`
(
    `id`          int(11)  NOT NULL AUTO_INCREMENT COMMENT 'id',
    `sn`          varchar(256) DEFAULT NULL COMMENT '设备号',
    `remark`      varchar(256) DEFAULT NULL COMMENT '设备定位备注',
    `create_time` datetime null comment '创建时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT ='设备定位验证日志表';

CREATE TABLE `d_feedback_param`
(
    `id`                     int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `order_id`               int(11)      DEFAULT NULL COMMENT '工单ID',
    `sqbh`                   varchar(50)  DEFAULT NULL COMMENT '工单申请编号',
    `vin`                    varchar(50)  DEFAULT NULL COMMENT '车架号',
    `actual_install_address` varchar(256) DEFAULT NULL COMMENT '实际按照地址',
    `actual_install_name`    varchar(256) DEFAULT null comment '实际安装人',
    `create_time`            datetime     DEFAULT null comment '创建时间',
    PRIMARY KEY (`id`),
    KEY `idx_order_id` (`order_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8 COMMENT ='平安工单激活反馈参数';

select *
from t_track_stujudge_alarm;


select dv.vehicleId,
       dv.name       as ownerName,
       dvw.shopName,
       dvw.sqbh,
       dv.standno,
       dvw.source,
       dvw.no_source as noSource,
       dv.createtime as createTime,
       dvw.standnoHash
from d_vehicle dv
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
where dv.status = 0
  and dvw.status = 1
#           and dvw.standnoHash = #{standnoHash}
order by createTime desc

select *
from d_vehicle_workorder
where standnoHash = 'e604888b7e67eb49700838ce1c6f7cc0';

select workOrderId
from d_vehicle
where standno = 'LYF16666634802940';

select *
from d_vehicle_workorder
where workOrderId = 829254;

select *
from d_feedback_param;

select *
from d_track_info
where isActive = 0
  and source = 1;

select *
from d_location_check_log;

select *
from t_track_stujudge_alarm
where sn = '1570921349';

select *
from d_user
where username = 'pingan';

select *
from d_user
where username = 'admin';

explain
select dv.vehicleId,
       dv.name       as ownerName,
       dvw.shopName,
       dvw.sqbh,
       dv.standno,
       dvw.source,
       dvw.no_source as noSource,
       dvw.workOrderId
from d_vehicle dv
         left join d_vehicle_workorder dvw on dvw.workOrderId = dv.workOrderId
where dv.status = 0
  and dvw.status = 1
  and dvw.standnoHash = 'e604888b7e67eb49700838ce1c6f7cc0'
order by dv.vehicleId desc;

select *
from d_vehicle_workorder
where standnoHash = 'e604888b7e67eb49700838ce1c6f7cc0';

select *
from d_vehicle_workorder
where sqbh = 'PA1539170682351521792';

select *
from d_vehicle
where standno = 'PA12*********6543';

insert into d_vehicle_workorder(classId, name, identityCard, standno, standnoHash, userTel, userSex, shopContacts,
                                contactsPhone, fix_time, status, lastLoginUserId, activeTime, activeMan, sendStatus,
                                area, shopName, color, brandid, brand, carType, carTypeName, carSystem, carSystemName,
                                isDvd, creditPeriod, rent, address, cycle, ishandsel, branch, branchCompanyTel, sqbh,
                                orderNum, projectNum, contractNo, createtime, idnum, noticeUser, engine, displacement,
                                remark, importdate, description, createUserId, productType, province, city, orderType,
                                orderSource, creditLimit, installMethod, shop_addr, fix_area, fix_phone, source,
                                no_source, obd_cnt, pa, record, areaId, dispatchEmail, insuranceFlag, fund,
                                isselfcollection, business_type, install_name, message_phone, area_id, gongdanId,
                                contractId, refOrderId, bizOrderType, gpsSupplier, vehicle_type, vehiclePrice,
                                insurancePolicyHolder, insuranceFirstBeneficiary, insuranceCertificate,
                                insuranceTelephone)
select classId,
       name,
       identityCard,
       standno,
       standnoHash,
       userTel,
       userSex,
       shopContacts,
       contactsPhone,
       fix_time,
       status,
       lastLoginUserId,
       activeTime,
       activeMan,
       sendStatus,
       area,
       shopName,
       color,
       brandid,
       brand,
       carType,
       carTypeName,
       carSystem,
       carSystemName,
       isDvd,
       creditPeriod,
       rent,
       address,
       cycle,
       ishandsel,
       branch,
       branchCompanyTel,
       sqbh,
       orderNum,
       projectNum,
       contractNo,
       createtime,
       idnum,
       noticeUser,
       engine,
       displacement,
       remark,
       importdate,
       description,
       createUserId,
       productType,
       province,
       city,
       orderType,
       orderSource,
       creditLimit,
       installMethod,
       shop_addr,
       fix_area,
       fix_phone,
       source,
       no_source,
       obd_cnt,
       pa,
       record,
       areaId,
       dispatchEmail,
       insuranceFlag,
       fund,
       isselfcollection,
       business_type,
       install_name,
       message_phone,
       area_id,
       gongdanId,
       contractId,
       refOrderId,
       bizOrderType,
       gpsSupplier,
       vehicle_type,
       vehiclePrice,
       insurancePolicyHolder,
       insuranceFirstBeneficiary,
       insuranceCertificate,
       insuranceTelephone
from d_vehicle_workorder
where workOrderId = 829213;

insert into d_vehicle (idnum, classId, vehicleTypeId, displacement, buyDate, mileage, name, standno, noticuser, userSex,
                       userTel, shopcontactor, shopPhone, lastLoginUserId, createtime, updatetime, userId, isSubUserId,
                       workOrderId, endtime, isuse, engine, remark, description, status, fix_time, validateStatus, acc,
                       validateInfo, createUserId, activeUserId, sync_neshield_flag)
SELECT idnum,
       classId,
       vehicleTypeId,
       displacement,
       buyDate,
       mileage,
       name,
       standno,
       noticuser,
       userSex,
       userTel,
       shopcontactor,
       shopPhone,
       lastLoginUserId,
       createtime,
       updatetime,
       userId,
       isSubUserId,
       829275,
       endtime,
       isuse,
       engine,
       remark,
       description,
       status,
       fix_time,
       validateStatus,
       acc,
       validateInfo,
       createUserId,
       activeUserId,
       sync_neshield_flag
from d_vehicle
where vehicleId = 805768;

select *
from d_feedback_param;

INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1482200741698473984', 'LFV3214G3C3090321', '广东省深圳市南山区桃园路', 'jack测试');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1482203282842718208', 'LFV3214G3C3090323', '广东省深圳市南山区桃园路', 'jack测试');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800001', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800002', '12345678998765431', '广东省深圳市南山区仙科路', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800003', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012000001', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012000002', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1484401471117201408', 'LFV3*********0401', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1484401729326944256', 'LFV3*********0402', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400002', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400003', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012500002', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012500001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160002', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160003', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160004', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1539170682351521792', 'PA123456789876543', '北京市朝阳区石景山公园', '流传奇');

INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1482200741698473984', 'LFV3214G3C3090321', '广东省深圳市南山区桃园路', 'jack测试');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1482203282842718208', 'LFV3214G3C3090323', '广东省深圳市南山区桃园路', 'jack测试');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800001', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800002', '12345678998765431', '广东省深圳市南山区仙科路', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022011800003', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012000001', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012000002', '1234*********5433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1484401471117201408', 'LFV3*********0401', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1484401729326944256', 'LFV3*********0402', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400002', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012400003', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012500002', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX2022012500001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160002', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160003', '12345678998765432', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202202160004', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202203210001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202203210005', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202203230001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202203300001', '12345678998765433', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1526132883562041344', 'PA123202205161729', '广东省深圳市龙华区观盛东路', '实名认证');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1526133271866511360', 'PA123202205161731', '广东省深圳市龙华区观盛东路', '实名认证');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202205170001', '12345678998765433', '广东省深圳市龙华区观盛东路', '实名认证');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202205170002', '12345678998765433', '广东省深圳市龙华区观盛东路', '实名认证');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGL-392254-2022PAZL106109569-ZL-01-0606103201504', 'W1K6X6BB0NA114188', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGL-392254-2022PAZL106109569-ZL-01-0607102618174', '1FDWW37P67EB14803', '广东省深圳市南山区留仙大道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGL-392254-2022PAZL106109569-ZL-01-0607162437530', '1G8JW54R73Y585474', '广东省深圳市福田区滨河大道辅道', '扫码2');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1538708515496005632', 'PA123456789876543', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1538790231879323648', 'PA20*********5001', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206210001', '12345678998765433', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206230001', '12345678998765431', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206230003', '12345678998765433', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206230004', '12345678998765434', '广东省深圳市南山区桃园路2号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206230006', '12345678998765436', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206230005', '12345678998765435', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206260002', '12345678998765432', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206260003', '12345678998765433', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206260004', '12345678998765434', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1541303280058109952', 'PA202206271411001', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1541303717511434240', 'PA202206271412001', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1541304219716423680', 'PA202206271415001', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1541304426243952640', 'PA202206271416001', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202206260005', '12345678998765434', '广东省深圳市南山区仙科路', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1563096539402997760', 'PA123202208261729', '广东省深圳市南山区塘益路191-1号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PAGLSX202210120001', '12345678998765434', '广东省深圳市南山区塘益路191-1号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1589505950459498496', 'PA123202211071431', '广东省深圳市南山区塘益路191-1号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1595682824223068160', 'PA123202205161731', '广东省深圳市南山区桃园路2号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1600049792334041088', 'PA123202205161731', '广东省深圳市南山区桃园路2号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1601155952730574848', 'PA123202205161735', '广东省深圳市南山区桃园路2号', 'xjq');
INSERT INTO d_feedback_param(sqbh, vin, actual_install_address, actual_install_name)
VALUES ('PA1607637216824266752', 'PA123202205161741', '广东省深圳市南山区桃园路2号', 'xjq');


update d_feedback_param dfp left join d_vehicle_workorder dvw on dvw.sqbh = dfp.sqbh
set dfp.order_id = dvw.workOrderId
where dvw.status = 0;

select *
from t_track_stujudge_alarm;

select *
from d_app_image
where workOrderId = 829278;

select *
from d_app_image_delete
where workOrderId = 829278;

select *
from d_device_login
where sn in (1700112234, 1570916886);