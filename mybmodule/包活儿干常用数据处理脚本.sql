#################################################修改服务时间#########################################
#修改服务时间，expect_install_time为期望上门安装时间，也被成为服务时间
select *
from sys_order
where car_owner like '%增城工厂%'
  and active_status = 4;

update sys_order
set expect_install_time = '2021-11-09 00:00:00'
where car_owner like '%增城工厂%'
  and active_status = 4;


#################################################批量指派安装工#########################################
#服务商(merchant_id=sys_manager.user_id)
select *
from sys_manager
where provider_name = '山东个人接单';
select *
from sys_manager
where user_id = 817;
#技工(mechanic_id=sys_user.id)
select *
from sys_user
where name = '寻永涛';
select *
from sys_user
where phone_number = 18239837982
  and user_type = 3;


# 服务商—广州郑朝叠    2080，技工账号—郑朝叠   2084
# 服务商—上海个人接单  1040，技工账号—董呈记   3915
# 服务商—广东服务商    914，技工账号—秦国伟   6733
# 服务商—福建个人接单  817，技工账号—汪伟     7196
# 服务商—山东个人接单  3109，技工账号—寻永涛   7365

select *
from sys_order
where vin_no = 'LDP31B962NG123305';

select *
from sys_order
where vin_no in (
                 'LDP31B96XNG132902',
                 'LDP31B961NG132948',
                 'LDP31B969NG132955',
                 'LDP31B960NG132942',
                 'LDP31B969NG132938',
                 'LDP31B967NG132971',
                 'LDP31B966NG132900',
                 'LDP31B963NG132904',
                 'LDP31B968NG132963',
                 'LDP31B960NG132973',
                 'LDP31B967NG132968',
                 'LDP31B964NG132958',
                 'LDP31B966NG132945',
                 'LDP31B961NG132951',
                 'LDP31B96XNG132947',
                 'LDP31B961NG132965',
                 'LDP31B969NG132969',
                 'LDP31B967NG132940',
                 'LDP31B96XNG132897',
                 'LDP31B960NG132939',
                 'LDP31B965NG132953',
                 'LDP31B96XNG132964',
                 'LDP31B966NG132976',
                 'LDP31B964NG132961',
                 'LDP31B964NG132975',
                 'LDP31B961NG132898',
                 'LDP31B962NG132943',
                 'LDP31B963NG132952',
                 'LDP31B96XNG132950',
                 'LDP31B968NG132977',
                 'LDP31B960NG132956',
                 'LDP31B962NG132974',
                 'LDP31B968NG132896',
                 'LDP31B968NG132901',
                 'LDP31B963NG132949',
                 'LDP31B961NG132903',
                 'LDP31B966NG132962',
                 'LDP31B964NG132944',
                 'LDP31B963NG132899',
                 'LDP31B966NG132959',
                 'LDP31B968NG132946',
                 'LDP31B969NG132972',
                 'LDP31B962NG132957',
                 'LDP31B965NG132967',
                 'LDP31B966NG132895',
                 'LDP31B962NG132960',
                 'LDP31B967NG132954',
                 'LDP31B965NG132970',
                 'LDP31B969NG132941',
                 'LDP31B963NG132966'
    )
  AND create_time >= '2021-12-07 00:00:00'
  AND canceled = 1;

#merchant_id为服务商id（sys_manager.user_id），mechanic_id、update_by为对应技工id
UPDATE `sys_order`
SET active_status          = 4,
    merchant_id            = 3109,
    mechanic_id            = 7365,
    update_by              = 7365,
    update_time            = NOW(),
    reassign_mechanic_time = NOW()
WHERE vin_no IN (
                 'LDP31B96XNG132902',
                 'LDP31B961NG132948',
                 'LDP31B969NG132955',
                 'LDP31B960NG132942',
                 'LDP31B969NG132938',
                 'LDP31B967NG132971',
                 'LDP31B966NG132900',
                 'LDP31B963NG132904',
                 'LDP31B968NG132963',
                 'LDP31B960NG132973',
                 'LDP31B967NG132968',
                 'LDP31B964NG132958',
                 'LDP31B966NG132945',
                 'LDP31B961NG132951',
                 'LDP31B96XNG132947',
                 'LDP31B961NG132965',
                 'LDP31B969NG132969',
                 'LDP31B967NG132940',
                 'LDP31B96XNG132897',
                 'LDP31B960NG132939',
                 'LDP31B965NG132953',
                 'LDP31B96XNG132964',
                 'LDP31B966NG132976',
                 'LDP31B964NG132961',
                 'LDP31B964NG132975',
                 'LDP31B961NG132898',
                 'LDP31B962NG132943',
                 'LDP31B963NG132952',
                 'LDP31B96XNG132950',
                 'LDP31B968NG132977',
                 'LDP31B960NG132956',
                 'LDP31B962NG132974',
                 'LDP31B968NG132896',
                 'LDP31B968NG132901',
                 'LDP31B963NG132949',
                 'LDP31B961NG132903',
                 'LDP31B966NG132962',
                 'LDP31B964NG132944',
                 'LDP31B963NG132899',
                 'LDP31B966NG132959',
                 'LDP31B968NG132946',
                 'LDP31B969NG132972',
                 'LDP31B962NG132957',
                 'LDP31B965NG132967',
                 'LDP31B966NG132895',
                 'LDP31B962NG132960',
                 'LDP31B967NG132954',
                 'LDP31B965NG132970',
                 'LDP31B969NG132941',
                 'LDP31B963NG132966'
    )
  AND create_time >= '2021-12-07 00:00:00'
  AND canceled = 1;


#update_by为对应技工id
INSERT INTO `sys_order_status`(`order_id`, `active_status`, `update_time`, `update_by`, `is_show`)
SELECT id, 4, NOW(), 7365, 1
FROM `sys_order`
WHERE 1 = 1
  AND vin_no IN (
                 'LDP31B96XNG132902',
                 'LDP31B961NG132948',
                 'LDP31B969NG132955',
                 'LDP31B960NG132942',
                 'LDP31B969NG132938',
                 'LDP31B967NG132971',
                 'LDP31B966NG132900',
                 'LDP31B963NG132904',
                 'LDP31B968NG132963',
                 'LDP31B960NG132973',
                 'LDP31B967NG132968',
                 'LDP31B964NG132958',
                 'LDP31B966NG132945',
                 'LDP31B961NG132951',
                 'LDP31B96XNG132947',
                 'LDP31B961NG132965',
                 'LDP31B969NG132969',
                 'LDP31B967NG132940',
                 'LDP31B96XNG132897',
                 'LDP31B960NG132939',
                 'LDP31B965NG132953',
                 'LDP31B96XNG132964',
                 'LDP31B966NG132976',
                 'LDP31B964NG132961',
                 'LDP31B964NG132975',
                 'LDP31B961NG132898',
                 'LDP31B962NG132943',
                 'LDP31B963NG132952',
                 'LDP31B96XNG132950',
                 'LDP31B968NG132977',
                 'LDP31B960NG132956',
                 'LDP31B962NG132974',
                 'LDP31B968NG132896',
                 'LDP31B968NG132901',
                 'LDP31B963NG132949',
                 'LDP31B961NG132903',
                 'LDP31B966NG132962',
                 'LDP31B964NG132944',
                 'LDP31B963NG132899',
                 'LDP31B966NG132959',
                 'LDP31B968NG132946',
                 'LDP31B969NG132972',
                 'LDP31B962NG132957',
                 'LDP31B965NG132967',
                 'LDP31B966NG132895',
                 'LDP31B962NG132960',
                 'LDP31B967NG132954',
                 'LDP31B965NG132970',
                 'LDP31B969NG132941',
                 'LDP31B963NG132966'
    )
  AND create_time >= '2021-12-07 00:00:00'
  AND canceled = 1;

#验证
select vin_no,
       order_type,
       merchant_id,
       mechanic_id,
       create_time,
       canceled,
       active_status,
       audit_status
from sys_order
where vin_no in (
    'LS6A2E0F8MA001194'
    );