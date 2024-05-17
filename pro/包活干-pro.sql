select id,
       user_id,
       mail,
       occupation,
       provider_name,
       address_detail,
       address_code,
       IDCard,
       bank_card_no,
       bank_name,
       generate_check_sheet
from sys_manager
where user_id = 4569;

SELECT * FROM sys_area sa WHERE sa.area_code = '220200';
SELECT * FROM sys_order_status sos WHERE sos.order_id = 340435;
SELECT *FROM sys_order so WHERE so.vin_no = 'LVGBE40K99G300110';
UPDATE sys_order SET active_status = 8 WHERE id = 340435;
INSERT INTO sys_order_status (order_id,active_status,update_time,update_by,reason,property1,property2,phone1,phone2,remark,is_show) VALUES
	 (340435,8,now(),9559,'','','','','',NULL,1);

SELECT *FROM sys_order so WHERE work_order_no = 'PASY-2023PAZL110211196-ZL-01-230923-001';
UPDATE sys_order SET expect_install_time = '2023-10-25 00:00:00' WHERE id = 375598;

select sod.id, sod.order_id, sod.device_no, sod.device_type, sod.install_location, sod.sort,
            sdd.data_value as deviceTypeName, sod.repair_type, sod.old_device_no
        from sys_order_device sod
        LEFT JOIN sys_dict_data sdd ON sod.device_type = sdd.data_key
        where order_id = 354422
        order by sort asc, id DESC;
       
UPDATE sys_order_device SET install_location  = '左C柱' WHERE id = 369486;

SELECT *FROM sys_order_file sof WHERE sof.order_id = 353572;
SELECT LENGTH(file_name), file_name FROM sys_order_file  WHERE file_name IS NOT NULL and file_name <> ''  ORDER BY LENGTH(file_name) DESC ;
select *
from sys_manager
where provider_name = '南京臻浩-广东';
select * from sys_order so WHERE so.work_order_no = 'PASY-2024PAZL110285438-ZL-01-240325-001';
select * from sys_order so WHERE so.vin_no = 'LMGMB1S85P1017623';
select audit_status  from sys_order so WHERE so.vin_no = 'LMGMB1S86P101289P';
UPDATE sys_order SET audit_status = 2 WHERE vin_no = 'LMGMB1S86P101289P';
select * from sys_order_status sos WHERE sos.order_id = 342415;
select * from sys_order_status sos WHERE sos.active_status = 0;

UPDATE sys_order SET shop_id = 10451 WHERE id = 339954;

SELECT *FROM sys_merchant sm WHERE sm.shop_name  = '东莞茂鑫';
SELECT *FROM sys_organization so  WHERE so.name  = '东莞茂鑫';
SELECT *FROM sys_user su   WHERE su.username  = '东莞茂鑫';

SELECT DISTINCT  longitude,latitude FROM sys_order so WHERE so.shop_id = 10451;
SELECT longitude,latitude FROM sys_order so WHERE order_source = 'gh';

SELECT * FROM sys_manager;
select * from sys_user su WHERE id = 9575;
select * from sys_user su WHERE id = 9649;
select * from sys_user su WHERE user_type = 0;
select * from sys_user su WHERE id IN (SELECT user_id  FROM sys_user_role sur WHERE sur.role_id = 0);
SELECT user_id  FROM sys_user_role sur WHERE sur.role_id = 0;
SELECT * FROM sys_role sr ;

SELECT sr.name  FROM sys_user su LEFT JOIN sys_user_role sur ON sur.user_id = su.id 
LEFT JOIN sys_role sr ON sr.id = sur.role_id WHERE  su.user_type  = 0

select * from sys_phone_number_log spnl WHERE spnl.user_id IN (9575,9649);

select merchant_id
from sys_order
where id = 297011;

select * from sys_user su  WHERE actual_phone_number IS NOT NULL ;
select * from sys_phone_number_log;

select *
from sys_manager
where user_id = 9588;

select *
from sys_manager
where user_id = 4569;

select * from sys_order where work_order_no = 'PA3542937-2023ZLTJ100632918-ZL-01-0620134629428';

SELECT DISTINCT order_source  FROM sys_order so WHERE so.work_order_no  = 'AP2023062175433';
SELECT *  FROM sys_order so WHERE so.order_source  = 'ZL';

SELECT * FROM sys_order_device sod WHERE device_no = '1510802003';

SELECT * FROM sys_order_file sof WHERE sof.order_id =  352443;

SELECT count(1) AS num , mechanic_id ,LEFT(complete_time,10) ,sm.district , sm.address  FROM sys_order so 
LEFT JOIN  sys_mechanic sm ON 	sm.user_id = so.mechanic_id 
WHERE active_status = 8 AND order_source = 'PAZl' GROUP BY mechanic_id ,LEFT(complete_time,10) ORDER BY num desc;

SELECT count(1) AS num , mechanic_id  ,sm.district , sm.address  FROM sys_order so 
LEFT JOIN  sys_mechanic sm ON 	sm.user_id = so.mechanic_id 
WHERE active_status = 8 AND order_source = 'PAZl' GROUP BY mechanic_id  ORDER BY num desc;


SELECT * FROM sys_mechanic sm  WHERE user_id  = 6733;
SELECT * FROM sys_user su WHERE id = 6733; 

SELECT * FROM sys_mechanic sm LEFT JOIN sys_area sa ;

SELECT * FROM  sys_area WHERE id = ;

SELECT * FROM sys_order;


select *
from sys_order_file
where order_id = 309886;

select *
from sys_order_status
where order_id = 297555;

select *
from sys_service_item
where service_code = 'PA001'
limit 1;


select *
from sys_order_audit_status
where order_id = 297555;

select *
from sys_order
where vin_no = 'LMGCS1G88H1006931';

SELECT *FROM sys_order_device sod  WHERE sod .order_id = 329448;

UPDATE sys_order_device set device_no = '45212100379' WHERE id = 309452;  # 15212100379

SELECT CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
FROM sys_area sa
         LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
         LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id
WHERE sa.id = 231086;

SELECT * FROM sys_order so WHERE order_source  IS NULL;
SELECT * FROM sys_order so WHERE order_source = 'PAZL';


select *
        from sys_user su
        LEFT JOIN sys_merchant sm on su.id = sm.user_id
        where
            su.user_type = 2
                and su.group_id = 'glsx_edun'
                and sm.shop_name = '商用车不担保条线/零售一部/西南区/四川组-辽宁省'
                and su.user_status = 'sys_user_status_normal';              

SELECT * FROM sys_user su WHERE su.id  = '10308';	

SELECT * FROM sys_merchant sm WHERE sm.user_id  = '10308';
SELECT * FROM sys_merchant sm WHERE sm.id  = '11978';
SELECT * FROM sys_merchant sm WHERE sm.shop_name  = '思享驾融资租赁';


SELECT *  FROM sys_order so WHERE so.work_order_no  = 'PASY-2023PAZL110245010-ZL-01-231222-001';

UPDATE sys_order SET vin_no = 'LRDS6PEB9JT002944' WHERE id = 390532;

SELECT * FROM sys_order so WHERE so.shop_id  = 890;
SELECT * FROM sys_sub_order_vassal;


UPDATE sys_order SET shop_id = '890'  WHERE id = 362034;
SELECT *FROM sys_car_ocr sco ;

SELECT * from sys_service_item where service_code = 'PA011' limit 1;

SELECT * FROM sys_order so WHERE so.order_source = 'ZL'; 
SELECT work_order_no  FROM sys_order so WHERE so.id = 253832; 
SELECT *FROM sys_order_file sof WHERE sof.order_id = 362779;
SELECT * FROM sys_order so WHERE order_type = 4;

SELECT * FROM sys_user su WHERE su.username = '15398879285'; 
SELECT * FROM sys_merchant; 

SELECT * FROM sys_user su WHERE su.id = 6826; 

SELECT * FROM sys_order_audit_status soas WHERE audit_status = 3 AND order_id = 273649; 
SELECT * FROM sys_order so WHERE so.work_order_no  = 'PASY-2023PAZL110204752-ZL-01-230924-001'; 
UPDATE sys_order SET shop_id = 10686 WHERE id = 375649;
UPDATE sys_order SET shop_id = 11423 WHERE id = 375650;
SELECT * FROM sys_order so WHERE so.order_sn  = '81288755585504436224'; 
SELECT so.work_order_no ,su.name  FROM sys_order so 
LEFT JOIN sys_user su ON su.id = so.update_by 
WHERE so.order_source = 'PAZL' AND audit_status = 3; 

SELECT so.work_order_no ,su.name  FROM sys_order so
        LEFT JOIN sys_user su ON su.id = so.update_by
        WHERE so.order_source = 'PAZL' AND so.work_order_no  = 'PAGL-3279257-2023ZLTJ100536814-ZL-01-0218100955586';

SELECT * FROM sys_order so WHERE so.vin_no  = 'LVHRS3836P7151419';
SELECT * FROM sys_user su WHERE su.id = 11448;
SELECT * FROM sys_user su WHERE su.phone_number  = '15229839121';
UPDATE sys_order SET shop_id = 11478 WHERE id = 377062;
SELECT * FROM sys_order so WHERE so.district IS NOT NULL AND so.district <> -1 AND order_source = 'PAZL';

SELECT
CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
FROM sys_area sa
LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id
WHERE sa.id = 220204;

SELECT * FROM sys_area sa WHERE area_code = 220204;   
SELECT * FROM sys_mechanic WHERE user_id = 2745;
SELECT * FROM  sys_service_item;

SELECT *  FROM sys_order so WHERE so.work_order_no  = 'PASY-2023PAZL110215780-ZL-01-231010-001'; 
SELECT * FROM sys_order_status sos WHERE order_id = 390532;
UPDATE sys_order SET audit_status = 1 WHERE id = 373930; 

SELECT * FROM sys_user su WHERE su.phone_number = '15398879285';
SELECT * FROM sys_user su WHERE su.username = 'kfadmin';
SELECT * FROM sys_service_mechanic WHERE service_id = 1388;
SELECT * FROM sys_merchant sm WHERE sm.user_id = 11478;
SELECT * FROM sys_manager sm WHERE sm.user_id = 11478;
SELECT * FROM sys_mechanic sm WHERE sm.user_id = 11478;

UPDATE sys_order SET vin_no = 'LZZ1BAGB6PP772354' WHERE id = 377736;
SELECT * FROM sys_order so WHERE so.work_order_no = 'PA3948323-2023PAZL101527213-ZL-01-1224090329875';
UPDATE sys_order SET canceled = 1 WHERE id = 391028;
SELECT
 CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
FROM sys_area sa
LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id
WHERE sa.id = 130131;

SELECT * FROM sys_area;

SELECT * FROM sys_order so WHERE so.order_source = 'PAZL';
SELECT * FROM sys_order_device sod WHERE sod.order_id = 377983;	

SELECT * FROM sys_order WHERE order_sn = '10288461319861956608';
SELECT DISTINCT  install_remark  FROM sys_order;
SELECT * FROM sys_order_material som ;
SELECT * FROM sys_sub_order sso;
SELECT * FROM sys_order_status sos;
SELECT * FROM sys_delivery sd ;

SELECT * FROM sys_order WHERE id = 387731;
SELECT DISTINCT file_name FROM sys_order_file sof;
SELECT * FROM sys_order_file sof WHERE file_name = '三码合一' ORDER BY id DESC ;
SELECT * FROM sys_order_file sof WHERE file_name = '人车合影' ORDER BY id DESC ;
SELECT * FROM sys_order_file sof WHERE file_name = '门店照' ORDER BY id DESC ;
SELECT * FROM sys_order_file sof WHERE file_name = '安装位置照' ORDER BY id DESC ;

select sof.* from sys_order_file sof LEFT JOIN sys_order so ON so.id = sof.order_id 
WHERE so.order_source = 'PAZL'
AND sof.file_name = '三码合一' AND so.create_time >= '2023-06-01' ORDER BY sof.id DESC;

SELECT DISTINCT order_source  FROM sys_order so; 


SELECT * FROM sys_order_status sos WHERE order_id = 148456;
SELECT * FROM sys_order_status sos WHERE sos.active_status  = 120;
SELECT * FROM sys_order_status sos WHERE sos.active_status  = 7;
SELECT * FROM sys_order WHERE order_source = 'PAZL';
SELECT * FROM sys_resource_matching WHERE service_key = '';

SELECT * FROM sys_order_audit_status soas WHERE audit_status IN (3,4);	
SELECT so.work_order_no ,so.vin_no  ,so.order_source,su.username,su.name  , soas.create_time 
from sys_order so LEFT JOIN sys_order_audit_status soas ON soas.order_id = so.id 
LEFT JOIN sys_user su on su.id = soas.create_by 
WHERE soas.audit_status IN (3,4) AND so.order_source = 'PAZL';

SELECT *FROM sys_order so WHERE work_order_no = 'sxjd202312220004';

UPDATE sys_order SET complete_time  = '2023-12-21 10:41:34' WHERE id = 390544;

SELECT * FROM sys_order_audit_status soas ;
select * from sys_order_status sos ;

select * from sys_delivery_file sdf ;
select * from sys_order_file sof ;

-- volvo_approved_time
select * from sys_user su ;
select * from sys_manager sm ;
select * from sys_mechanic sm ;
select * from sys_merchant sm ;

SELECT
            so.id   id,
            so.name name,
            so.org_type orgType
        FROM
            sys_organization so
        WHERE
            so.parent_id =0
            AND so.org_status = 1 AND so.name  LIKE '%江苏%';

           SELECT
            so.id   id,
            so.name name,
            so.org_type orgType
        FROM
            sys_organization so
        WHERE
            so.parent_id = 420
            AND so.org_status = 1;
           
SELECT
            u.id id,
            sm.provider_name name,
            sm.provider_name serviceName,
            u.org_id orgId,
            u.group_id 
        FROM sys_user u
        LEFT JOIN sys_user_org uo ON uo.org_id = u.org_id
        LEFT JOIN sys_organization so ON uo.org_id = so.id
        LEFT JOIN sys_manager sm ON sm.user_id = u.id
        WHERE 
         u.user_status='sys_user_status_normal'
--         AND sm.provider_name LIKE concat('%','江苏','%')
        AND u.group_id = 420 
--         u.group_id = 420 
--         AND u.user_type = 1
        GROUP BY id
        LIMIT 50;
            
select * from sys_user su WHERE su.group_id  = 420;  
select * from sys_user su WHERE su.group_id  = 5238;  
select * from sys_organization WHERE name LIKE '%江苏%';
select * from sys_organization WHERE id = 5238;
select * from sys_user_org WHERE org_id = 420 AND user_id = 11327;
select su.* from sys_manager sm LEFT JOIN sys_user su ON su.id = sm.user_id  WHERE su.username LIKE concat('%','江苏','%');

select * from sys_organization so WHERE so.id = 420;
select * from sys_organization so WHERE so.id = 5238;
select * from sys_organization so WHERE so.id = 5250;
select * from sys_user_org suo WHERE suo.org_id = 5238; 
select * from sys_user su WHERE su.id = 10465;

select * from sys_order_device sod WHERE sod.device_no LIKE  '%93311150755%';
select * from sys_device sd WHERE sd.device_no LIKE  '%96312110064%';

select sod.id, sod.order_id, sod.device_no, sod.device_type, sod.install_location, sod.sort,
            sdd.data_value as deviceTypeName, sod.repair_type, sod.old_device_no
        from sys_order_device sod
        LEFT JOIN sys_dict_data sdd ON sod.device_type = sdd.data_key
        where order_id = 385618
        order by sort asc, id DESC;
       
select * from sys_order_device sod WHERE sod.order_id = 397792;       
        
select * from sys_order so WHERE so.order_source = 'pazl';
select * from sys_order so WHERE so.work_order_no = 'PASY-2024PAZL110256983-ZL-01-240129-001';

select sof.id,sof.order_id,sof.sub_order_id,sof.file_name,sof.file_path,sof.file_type,sof.sort,sof.create_by,sof.create_time ,so.vin_no  
from sys_order_file sof LEFT JOIN sys_order so ON so.id = sof.order_id 
WHERE so.order_source = 'pazl' AND sof.file_name = '三码合一' ORDER BY so.create_time DESC;

SELECT * FROM sys_order_file;
SELECT * FROM sys_order_repair;

SELECT service_code, service_item_name  from sys_order WHERE service_code IS NOT NULL AND LENGTH(service_code)> 0;
SELECT merchant_name FROM sys_order WHERE merchant_name IS NULL ;
SELECT mortgage_time FROM sys_order WHERE complete_time IS NOT null AND LENGTH(complete_time) > 0 AND order_type =6
AND active_status != 9 AND  order_source = 'volvo';


update sys_order a,sys_service_item b
set a.service_item_name=b.service_name
where a.service_code = b.service_code;

update sys_order a,sys_merchant b
set a.merchant_name=b.shop_name
where (a.merchant_name is null or length(a.merchant_name)=0)
  and a.shop_id = b.user_id;

update sys_order
set mortgage_time=complete_time
where order_source = 'volvo'
  and active_status != 9
  and order_type = 6;
 
 
SELECT * FROM sys_order_file WHERE file_name LIKE '%含设备号安%' GROUP BY file_name; 
SELECT * FROM sys_order_file WHERE file_name LIKE '%图⑨含设备号安装图1%'; 
SELECT * FROM sys_order_file WHERE file_name LIKE '%图⑩含设备号安装位置1%'; 
SELECT * FROM sys_order_file WHERE file_name LIKE '%图⑪含设备号安装位置2%'; 

SELECT * FROM sys_order_file WHERE file_name IN ('图⑨含设备号安装图1','图⑩含设备号安装位置1','图⑪含设备号安装位置2');

select sof.id,sof.order_id,sof.sub_order_id,sof.file_name,sof.file_path,sof.file_type,sof.sort,sof.create_by,sof.create_time ,group_concat(DISTINCT sod.device_no) AS sns    
from sys_order_file sof LEFT JOIN sys_order so ON so.id = sof.order_id 
LEFT JOIN sys_order_device sod ON sod.order_id = so.id
WHERE sof.file_name IN ('图⑨含设备号安装图1','图⑩含设备号安装位置1','图⑪含设备号安装位置2') 
GROUP BY so.id , sof.file_path  ORDER BY so.create_time DESC;

SELECT * FROM sys_order_device sod ;

select sof.id,sof.order_id,sof.sub_order_id,sof.file_name,sof.file_path,sof.file_type,sof.sort,sof.create_by,sof.create_time ,group_concat(DISTINCT sod.device_no) AS sns    
from sys_order_file sof LEFT JOIN sys_order so ON so.id = sof.order_id 
LEFT JOIN sys_order_device sod ON sod.order_id = so.id
WHERE sof.file_name IN ('三码合一') 
GROUP BY so.id , sof.file_path  ORDER BY so.create_time DESC;

UPDATE sys_order SET vin_no = 'LNXAEG082PR704854' WHERE id = 404714;

SELECT id , username, name, org_id, phone_number, user_status, create_by, create_time, update_by, update_time, password, sex, remark, user_type,group_id FROM sys_user su WHERE su.id in (null);

SELECT *  FROM sys_order WHERE work_order_no = 'PALS-2024PAZL101556491-ZL-01-240130-001';
SELECT *  FROM sys_order WHERE vin_no  = 'LC0C*********0429';

SELECT *FROM sys_order_file;	

SELECT *FROM sys_order WHERE id =405585; 
UPDATE sys_order SET vin_no_decode = 'LVHFE4640R6000256' WHERE id = 405014;

SELECT * FROM sys_order WHERE order_source = 'PAZL'  and vin_no NOT LIKE '%*%';

SELECT * FROM sys_order_ocr_vin_result soovr ;

SELECT * FROM sys_order_ocr_sn_result;

SELECT * FROM sys_order WHERE id = 416186;

SELECT * FROM sys_device_repertory WHERE user_id = 859; 
SELECT * FROM sys_user su ;
SELECT * FROM sys_manager sm;   # 服务商
SELECT * FROM sys_mechanic sm ; # 技工
SELECT * FROM sys_merchant sm ; # 商户
SELECT * FROM sys_user_org;
SELECT * FROM sys_dict_data; 
SELECT * FROM sys_indent; 

SELECT * FROM sys_service_mechanic; 
SELECT * FROM sys_organization; 
SELECT * FROM sys_user_services; 
SELECT * FROM sys_manager sm WHERE user_id = 576;
SELECT * FROM sys_mechanic sm WHERE user_id = 578; 

SELECT * FROM sys_user su WHERE su.id = 576; 
SELECT * FROM sys_user su WHERE su.id = 578; 
SELECT * FROM sys_device WHERE user_id = 859;  
SELECT * FROM sys_indent;
SELECT * FROM sys_delivery sd ; 

SELECT u.id,u.username, suo.id,so.id 
FROM sys_user_org suo
LEFT JOIN sys_organization so ON suo.org_id = so.id
LEFT JOIN sys_user u ON u.org_id = so.id
LEFT JOIN sys_merchant sm ON sm.user_id = u.id
LEFT JOIN sys_user_service_items susi ON sm.user_id = susi.user_id
LEFT JOIN sys_service_item ssi ON susi.service_code = ssi.service_code
LEFT JOIN sys_user_order_type suot ON u.id = suot.user_id;

SELECT suo.id,suo.user_id ,so.id,so.name ,u.*
FROM sys_user_org suo 
LEFT JOIN sys_organization so ON so.id = suo.org_id  
LEFT JOIN sys_user su ON su.id = suo.user_id 
LEFT JOIN sys_user u ON u.org_id = so.id
WHERE suo.user_id = 634 AND u.user_type = 2;

SELECT * FROM sys_user su WHERE user_type = 2; 
SELECT * FROM sys_organization; 
SELECT * FROM sys_merchant; 

SELECT * FROM sys_user;
SELECT * FROM sys_organization;
SELECT * FROM sys_user_org suo ; 
SELECT * FROM sys_order so ;
SELECT * FROM sys_manager sm;   # 服务商
SELECT * FROM sys_mechanic sm ; # 技工
SELECT * FROM sys_merchant sm ; # 商户
SELECT * FROM sys_service_mechanic;  # 服务商和技工关联表
SELECT * FROM sys_service_item;

SELECT * FROM sys_user;  # 系统用户表
SELECT * FROM sys_organization;   # 系统组织表
SELECT * FROM sys_user_org;   # 用户组织表
SELECT * FROM sys_order;   # 系统工单表
SELECT * FROM sys_manager;   # 服务商
SELECT * FROM sys_mechanic;   # 技工
SELECT * FROM sys_merchant;    # 商户
SELECT * FROM sys_service_mechanic;   # 服务商和技工关联表
SELECT * FROM sys_service_item;       # 设备组合类型表

SELECT mechanic_id,count(1) num  FROM  sys_service_mechanic GROUP BY mechanic_id HAVING num  > 1;

SELECT * FROM sys_order so WHERE so.work_order_no = 'PALS-2024ZLTJ100843068-ZL-01-240429-001-001'; 
SELECT * FROM sys_order_file sof WHERE sof.order_id  = 432816;

SELECT * FROM sys_indent;
SELECT * FROM sys_device sd ; 
SELECT * FROM sys_indent_import_device;

SELECT * FROM sys_device_repertory;
SELECT * FROM sys_indent_import_device; 
SELECT * FROM sys_secondment;
SELECT * FROM sys_secondment_import_device;
SELECT * FROM sys_secondment_log;
SELECT * FROM sys_indent_logistics;
SELECT * FROM sys_indent_log sil ;
SELECT * FROM sys_logistics;
SELECT
	*
    FROM
	  sys_logistics
    ORDER BY
	  BINARY charact_type,
	  uniCODE ASC;

-- 会使用到的表
SELECT * FROM sys_indent;
SELECT * FROM sys_device;
SELECT * FROM sys_indent_logistics;
SELECT * FROM sys_indent_log;
SELECT * FROM sys_device_repertory; 


SELECT * FROM sys_order WHERE vin_no  LIKE '%JTJH*********9328%' ;

DELETE FROM sys_order WHERE order_sn  in (
'81286535924410478592',
'81286522998312136704',
'81286522944037842944'
)

SELECT * FROM sys_delivery sd ;
SELECT * FROM sys_logistics sl ; 
SELECT * FROM sys_service_mechanic; 
SELECT * FROM sys_area sa WHERE id = 440300; 
SELECT * FROM sys_area sa WHERE area_name = '南山区'; 

SELECT * FROM sys_order_ocr_vin_result WHERE db_vin = 'JTEBX3FJ3BK054563';
SELECT * FROM sys_order_ocr_sn_result WHERE order_id =  437939;















































