select *
from t_tenant;

SELECT *FROM t_user tu WHERE tu.tenant_id  = '50';

SELECT * FROM t_tenant tt WHERE tt.id  = 50;

SELECT * FROM t_vehicle tv WHERE tv.vin = 'LBVKY9104KSP11984'; 
SELECT * FROM t_vehicle_device tvd WHERE tvd.vehicle_id  = 42853; 

select tvd.sn,tvd.*
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
  and td.sn IN (
'96210200002','96210200001');
 
 select * from t_vehicle_device tvd WHERE tvd.sn = '1510927135';
SELECT *FROM t_workorder_documents twd WHERE twd.workorder_id IN (16288,16289);

SELECT tw.partner_order_no ,count(1) AS num  FROM t_workorder tw WHERE tw.del_flag = 0 GROUP BY tw.partner_order_no HAVING num >1;

SELECT order_source FROM t_workorder tw WHERE tw .partner_order_no = 'glsx_1638177700237';

SELECT * FROM t_vehicle tv WHERE tv.workorder_id IN (16288,16289);

SELECT *FROM t_workorder tw WHERE tw.order_source = 'zlgj';
SELECT tw.order_source,count(1) AS num  FROM t_workorder tw GROUP by tw.order_source;

SELECT *FROM t_workorder tw WHERE order_source = 'glsx_nes';

SELECT *FROM t_tenant tt ;

 SELECT * FROM t_role_menu to2 
 
 select * from t_vehicle tv WHERE tv.vin = 'LMGMB1S85P1017623';
 select * from t_vehicle tv WHERE tv.vin = 'LGXCE6DB7J0235559';
SELECT * FROM t_workorder tw WHERE tw.partner_order_no  = '2023071220000001';
SELECT * FROM t_workorder_vehicle twv  WHERE twv.vin = 'LMGMB1S85P1017623';
SELECT * FROM t_workorder_documents twd WHERE twd.workorder_id = 45629; 

select * from t_user tu WHERE tu.username = '利见众仁';
select * from t_user tu WHERE tu.username = '利见众仁';
select * from t_department td WHERE id = 2137;
select * from t_user tu WHERE tu.id = 1055;
 
SELECT
	tv.id,
	tvd.id vdId,
	tv.workorder_id workOrderId,
	tw.partner_order_no bizOrderNo,
	tv.owner_name ownerName,
	tv.vin,
	tw.shop_name AS shopName,
	tvd.sn,
	td.source deviceType,
	CASE
		WHEN td.source = 1 THEN '有线'
		WHEN td.source = 0 THEN '无线'
		ELSE '--'
	END AS deviceTypeStr,
	CASE
		WHEN tv.type_id IS NULL THEN tv.model_name
		ELSE concat(tv.sub_brand_name, '/', tv.series_name, '/', tv.type_name)
	END modelName,
	tv.vehicle_type vehicleType,
	tv.vehicle_usages vehicleUsages,
	tv.settle_flag settleFlag,
	tv.created_date activateTime,
	tv.created_by createdBy,
	'o' AS permitType
FROM
	t_vehicle tv
LEFT JOIN t_vehicle_device tvd ON
	tvd.vehicle_id = tv.id
LEFT JOIN t_workorder tw ON
	tw.id = tv.workorder_id
LEFT JOIN t_device td ON
	td.sn = tvd.sn
LEFT JOIN t_device_location tdl ON
	tdl.sn = tvd.sn
LEFT JOIN t_user tu ON
	tu.id = tv.created_by
WHERE
	tv.del_flag = 0
	AND tvd.bind_status = 1
	AND tvd.del_flag = 0
	AND (
		tv.owner_name LIKE '%SCA688L08JU103665%'
			OR tv.vin LIKE '%SCA688L08JU103665%'
			OR tvd.sn LIKE '%SCA688L08JU103665%'
			OR tv.type_name LIKE '%SCA688L08JU103665%'
			OR tv.model_name LIKE '%SCA688L08JU103665%'
	)
	AND tv.created_by IN (1055)
UNION
SELECT
	tv.id,
	tvd.id vdId,
	tv.workorder_id workOrderId,
	tw.partner_order_no bizOrderNo,
	tv.owner_name ownerName,
	tv.vin,
	tw.shop_name AS shopName,
	tvd.sn,
	td.source deviceType,
	CASE
		WHEN td.source = 1 THEN '有线'
		WHEN td.source = 0 THEN '无线'
		ELSE '--'
	END AS deviceTypeStr,
	CASE
		WHEN tv.type_id IS NULL THEN tv.model_name
		ELSE concat(tv.sub_brand_name, '/', tv.series_name, '/', tv.type_name)
	END modelName,
	tv.vehicle_type vehicleType,
	tv.vehicle_usages vehicleUsages,
	tv.settle_flag settleFlag,
	tv.created_date activateTime,
	tv.created_by createdBy,
	'r' AS permitType
FROM
	t_vehicle tv
LEFT JOIN t_vehicle_device tvd ON
	tvd.vehicle_id = tv.id
LEFT JOIN t_workorder tw ON
	tw.id = tv.workorder_id
LEFT JOIN t_device td ON
	td.sn = tvd.sn
LEFT JOIN t_device_location tdl ON
	tdl.sn = tvd.sn
LEFT JOIN t_user tu ON
	tu.id = tv.created_by
WHERE
	tv.del_flag = 0
	AND tvd.bind_status = 1
	AND tvd.del_flag = 0
	AND (
		tv.owner_name LIKE '%SCA688L08JU103665%'
			OR tv.vin LIKE '%SCA688L08JU103665%'
			OR tvd.sn LIKE '%SCA688L08JU103665%'
			OR tv.type_name LIKE '%SCA688L08JU103665%'
			OR tv.model_name LIKE '%SCA688L08JU103665%'
	)
	AND (
		tv.id IN (
			SELECT
				tvp.content_id
			FROM
				t_vehicle_permit tvp
			WHERE
				tvp.del_flag = 0
				AND tvp.receiver_id IN (1055)
					AND tvp.content_type = 0
		)
		OR tv.created_by IN (
			SELECT
				tu2.id
			FROM
				t_user tu2
			WHERE
				tu2.del_flag = 0
				AND tu2.department_id IN (
					SELECT
						tvp.content_id
					FROM
						t_vehicle_permit tvp
					WHERE
						tvp.del_flag = 0
						AND tvp.receiver_id IN (1055)
							AND tvp.content_type = 2
				)
				AND tu2.id NOT IN (1055)
		)
	)
ORDER BY
	activateTime DESC,
	id,
	vdId;

 

SELECT * FROM  t_cust_user_local_auth WHERE account  = 'cgyw';

SELECT tw.shop_name AS shopName,
tw.shop_telephone  AS shopTelephone,
tw.service_time AS serviceTime,
tw.service_address  AS serviceAddress,
tv.owner_name  AS  lesseeName,
tv.vin AS vin 
FROM t_vehicle tv 
left join t_vehicle_device tvd ON tvd.vehicle_id  = tv.id
LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id AND tw.del_flag = 0
LEFT JOIN t_user tu ON tu.id = tv.created_by 
LEFT JOIN t_tenant tt ON tt.id = tu.tenant_id 
WHERE tt.tenant_name  = '湖北襄本网络' AND tvd.sn = '15212240554' 
AND tv.del_flag = 0 AND tvd.del_flag =0 AND tvd.bind_status = 1
AND tu.del_flag = 0 AND tt.del_flag =0;

SELECT * FROM t_vehicle_device tvd WHERE tvd.sn = '45209280301';


SELECT tw.order_source FROM t_workorder tw GROUP BY tw.order_source;

SELECT id, created_date  FROM t_workorder_vehicle WHERE id = 15804; 
SELECT DISTINCT id,  finished_time  FROM t_workorder tw WHERE  tw.status = 2 ;

SELECT tw.service_period ,count(1) AS num 
FROM t_workorder tw 
LEFT JOIN t_vehicle tv ON tv.workorder_id  = tw.id 
LEFT JOIN t_user tu ON tu.id = tv.created_by 
WHERE tu.tenant_id = 44 AND	tv.del_flag = 0 GROUP BY tw.service_period;

SELECT LEFT(tvd.created_date,7)  ,count(tvd.sn) AS num 
FROM t_workorder tw 
LEFT JOIN t_vehicle tv ON tv.workorder_id  = tw.id 
LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id  = tv.id 
LEFT JOIN t_user tu ON tu.id = tv.created_by 
WHERE tu.tenant_id = 44 AND	tv.del_flag = 0 AND LEFT(tvd.created_date,7) >= '2022-11' AND LEFT(tvd.created_date,7) <= '2023-04'
GROUP BY LEFT(tvd.created_date,7);

SELECT LEFT(tv.created_date,7) ,count(tvd.sn) AS num 
FROM t_workorder tw 
LEFT JOIN t_vehicle tv ON tv.workorder_id  = tw.id 
LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id  = tv.id 
LEFT JOIN t_user tu ON tu.id = tv.created_by 
WHERE tu.tenant_id <> 44 AND	tv.del_flag = 0 AND LEFT(tv.created_date,7) >= '2022-11' AND LEFT(tv.created_date,7) <= '2023-04'
GROUP BY LEFT(tv.created_date,7);


SELECT tv.id, tv.vin,tv.del_flag ,tv.created_date ,tv.created_by  ,tw.partner_order_no,tw.created_date ,tw.finished_time  ,tw.del_flag ,tvd.sn
        from t_vehicle tv
                 left join t_vehicle_device tvd on tvd.vehicle_id = tv.id
                 LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id 
        where tv.del_flag = 0
          and tvd.del_flag = 0
          and tvd.bind_status = 1
          AND tvd.sn = 45209280301;

SELECT tvd.sn FROM t_vehicle tv LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id 
WHERE tv.del_flag = 0 AND tvd.del_flag = 0 AND tvd.bind_status = 1 
AND tv.created_by IN (SELECT t_user.id FROM t_user WHERE t_user.department_id IN (2061, 2066, 2075, 2076, 2083, 2085, 2086, 2087, 2088, 2089, 2093, 2095, 2096, 2098, 2099, 2101, 2105, 2106, 2107, 2108, 2110, 2111, 2117, 2118, 1611, 1612, 1613, 2125, 1614, 1615, 1616, 1617, 1618, 1619, 2131, 1620, 2132, 1621, 2133, 1622, 2134, 1623, 2135, 1624, 2136, 1625, 2137, 1626, 1627, 1628, 2140, 1629, 2141, 1630, 1631, 1632, 1633, 1634, 2146, 1635, 1636, 2148, 1637, 2149, 1638, 2150, 1639, 2151, 1640, 1641, 1642, 1643, 1644, 2156, 1645, 1646, 1647, 1648, 1649, 2161, 1650, 1651, 2163, 1652, 2164, 1653, 1654, 1655, 1656, 1657, 1658, 1659, 1660, 1661, 1662, 1663, 1664, 1665, 1666, 1667, 1668, 1669, 1670, 1671, 1672, 1673, 1674, 1675, 1676, 1677, 1678, 1679, 1680, 1681, 1682, 1683, 1684, 1685, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706, 1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1716, 1717, 1718, 1719, 1720, 1721, 1722, 1723, 1724, 1727, 1728, 1729, 1730, 1731, 1744, 1745, 1746, 1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755, 1756, 1757, 1758, 1759, 1760, 1761, 1762, 1763, 1764, 1765, 1766, 1767, 1768, 1769, 1770, 1771, 1772, 1773, 1774, 1775, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785, 1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799, 1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1811, 1812, 1813, 1814, 1815, 1816, 1817, 1818, 1819, 1820, 1821, 1822, 1823, 1824, 1825, 1838, 1839, 1840, 1842, 1843, 1844, 1845, 1846, 1847, 1849, 1850, 1851, 1852, 1853, 1854, 1855, 1856, 1859, 1865, 1866, 1870, 1871, 1872, 1873, 1874, 1875, 1876, 1877, 1878, 1879, 1880, 1881, 1882, 1883, 1884, 1885, 1886, 1887, 1900, 1917, 1918, 1924, 1928, 1952, 2015, 2016, 2040)) 
UNION SELECT tvd.sn FROM t_vehicle tv LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id WHERE tv.del_flag = 0 AND tvd.del_flag = 0 AND tvd.bind_status = 1 AND (tv.id IN (SELECT tvp.content_id FROM t_vehicle_permit tvp WHERE tvp.del_flag = 0 AND tvp.receiver_id IN (1048) AND tvp.content_type = 0) OR tv.created_by IN (SELECT tu2.id FROM t_user tu2 WHERE tu2.del_flag = 0 AND tu2.department_id IN (SELECT tvp.content_id FROM t_vehicle_permit tvp WHERE tvp.del_flag = 0 AND tvp.receiver_id IN (1048) AND tvp.content_type = 2) AND tu2.id NOT IN (1024, 1025, 1537, 1026, 1027, 1030, 1543, 1032, 1033, 1035, 1547, 1036, 1037, 1038, 1039, 1040, 1041, 1044, 1556, 1045, 1046, 1558, 1048, 1049, 1053, 1055, 1056, 1570, 1577, 1067, 1069, 1070, 1584, 1073, 1074, 1075, 1076, 1077, 1078, 1079, 1591, 1080, 1081, 1082, 1594, 1083, 1084, 1596, 1085, 1086, 1087, 1088, 1089, 1090, 1091, 1092, 1093, 1094, 1606, 1095, 1096, 1097, 1609, 1098, 1610, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1107, 1108, 1109, 1621, 1110, 1111, 1112, 1113, 1114, 1626, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1123, 1124, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1644, 1133, 1134, 1135, 1647, 1136, 1137, 1138, 1139, 1140, 1146, 1147, 1659, 1148, 1149, 1150, 1151, 1152, 1153, 1154, 1155, 1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166, 1678, 1167, 1168, 1680, 1169, 1681, 1170, 1682, 1171, 1683, 1685, 1176, 1177, 1178, 1179, 1691, 1180, 1181, 1182, 1183, 1695, 1184, 1696, 1185, 1186, 1187, 1188, 1189, 1190, 1191, 1192, 1704, 1193, 1705, 1194, 1706, 1195, 1196, 1197, 1709, 1198, 1199, 1711, 1200, 1201, 1202, 1203, 1715, 1204, 1716, 1205, 1717, 1206, 1207, 1208, 1209, 1721, 1210, 1211, 1212, 1724, 1213, 1725, 1214, 1726, 1215, 1727, 1216, 1728, 1217, 1729, 1218, 1219, 1731, 1220, 1732, 1221, 1222, 1734, 1223, 1224, 1225, 1737, 1226, 1738, 1227, 1228, 1740, 1229, 1742, 1231, 1743, 1232, 1233, 1234, 1235, 1236, 1237, 1238, 1242, 1248, 1252, 1253, 1256, 1260, 1261, 1262, 1264, 1269, 1270, 1271, 1272, 1277, 1278, 1279, 1280, 1305, 1319, 1326, 1337, 1338, 1358, 1432, 1463, 1476, 1491, 1499, 1518, 1531, 1022, 1023, 1535)));

SELECT * FROM t_vehicle_log WHERE vehicle_id = 38499; 

SELECT *FROM t_user tu  WHERE tu.id IN (1137,1529);

SELECT * FROM t_tenant tt WHERE tt.id = 1;

SELECT * FROM t_workorder tw WHERE tw.status = 5; 
ALTER TABLE t_workorder modify `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '工单状态：0默认，1已派单，2已完成，3已取消，4已删除, 5待审核';

SELECT * FROM  t_workorder tw WHERE finished_time IS NULL AND del_flag = 0 AND status = 2;
SELECT * FROM  t_workorder tw WHERE  status = 3;
SELECT * FROM t_user tu WHERE tu.account  = 'zlgj'; 
SELECT * FROM t_tenant tt ;

SELECT *FROM t_vehicle_device tvd WHERE tvd.sn in(93305090205, 96305050322);
SELECT * FROM t_workorder tw WHERE tw.partner_order_no = '2023071311000013';

SELECT *FROM t_workorder_documents twd WHERE twd.workorder_id = 45664;

SELECT twd.* FROM t_workorder_documents twd left JOIN t_workorder tw ON tw.id = twd.workorder_id WHERE tw.order_source = 'zlgj';

select tw.partner_order_no as appcode, tv.owner_name as username, tv.vin as vin, tvd.sn as imei,
 (CASE td.source WHEN 1 THEN '有线' WHEN 0 THEN '无线' ELSE '' END) as equipment,tvd.sn
from t_vehicle_device tvd 
 left join t_device td on td.sn = tvd.sn
left join t_vehicle tv on tv.id = tvd.vehicle_id
left join t_workorder tw on tw.id = tv.workorder_id
left join t_user tu on tv.created_by = tu.id
 where tu.tenant_id = 44  and tv.del_flag = 0  and tvd.del_flag = 0  and tvd.bind_status = 1  and tw.del_flag = 0  
and tw.status = 2 ;

SELECT * FROM t_alarm_track_stujudge tats ; 

SELECT * FROM t_vehicle tv WHERE vin = '1G1YB2D70J5104128' AND del_flag = 0; 


SELECT * FROM t_vehicle_device tvd  WHERE del_flag  = 0 AND bind_status = 1; 

SELECT * FROM t_vehicle_device tvd WHERE tvd.vehicle_id IN (16539,44250); 
SELECT * FROM t_device ;


SELECT tw.partner_order_no ,tv.vin ,tw.created_date,tu.username FROM t_workorder tw 
LEFT JOIN t_vehicle tv ON tv.workorder_id = tw.id 
LEFT JOIN t_user tu ON tu.id = tw.updated_by 
LEFT JOIN t_user tu2 ON tu2.id = tv.created_by  
WHERE tv.del_flag = 0 AND tu2.tenant_id = 44 
AND tw.created_date > '2023-01-01';

SELECT * FROM  t_workorder tw WHERE tw.created_date > '2023-07-27';


SELECT * FROM t_user ;
SELECT * FROM t_dev_split;

SELECT * FROM t_device td WHERE td.sn IN ('91266600001','91266600002','92166600001','92266600002');	
-- DELETE 
SELECT * FROM t_vehicle_device tvd WHERE tvd.sn IN ('15212080903');	
-- 'Testfv13932000210'
SELECT * FROM t_vehicle tv WHERE tv.vin = 'WP1AG2921DLA61358';
SELECT tw.* FROM t_workorder tw LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id  WHERE twv.vin = 'Testfv13932000210';



SELECT * FROM t_workorder tw WHERE tw.partner_order_no = 'AP2021081693517';
UPDATE t_workorder SET finished_time = '2023-10-26 15:49:32' WHERE id = 21914;
SELECT * FROM t_workorder tw WHERE tw.partner_order_no = '2022121909000050';
SELECT * FROM t_workorder tw WHERE tw.order_source  = 'zlgj';

EXPLAIN  SELECT id, vid, vin, split_flag as splitFlag, begin_time as beginTime, created_date as createdDate 
FROM t_dev_split WHERE vid = 40932
AND del_flag = 0 ORDER BY id DESC;

SELECT * FROM t_workorder tw LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id WHERE twv.vin = 'ZAWEC1479CLA00327';
SELECT * FROM t_workorder tw WHERE tw.partner_order_no = 'AP2023103092415';
SELECT * FROM t_vehicle tv WHERE tv.workorder_id = 47368;AP2023091386330

UPDATE t_workorder SET finished_time = '2023-08-15 18:00:00' WHERE id = 47368;

SELECT * FROM t_device td ;

SELECT * FROM t_user tu WHERE tu.account  = 'LTZL'; 

SELECT * FROM  t_message_log WHERE content LIKE '%AP2023091386330%';

select * from t_poi_fence;

-- DROP TABLE t_poi_fence;

SELECT * FROM t_vehicle_device ;
SELECT * FROM t_vehicle_log ;

CREATE TABLE `t_poi_fence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `poi_name` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'poi名称',
  `poi_type` tinyint(2) DEFAULT '0' COMMENT 'POI类型 1:黑区圆心，2:二押点，3:异常聚集点',
  `lnglat` text COLLATE utf8_bin COMMENT '经纬度坐标',
  `enable_status` tinyint(4) DEFAULT '1' COMMENT '状态 0=关闭 1=开启',
  `remark` varchar(500) DEFAULT NULL COMMENT '描述(备注)',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  KEY `idx_tef_created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='POI列表';

alter table t_poi_fence add `remark` varchar(500) DEFAULT NULL COMMENT '描述(备注)' after enable_status;

select m.menu_no menuNo,m.parent_id parentId,m.menu_name menuName,m.order_num orderNum,
        m.type,m.front_route frontRoute,m.icon
        from t_menu m,t_role_menu rm
        where m.menu_no = rm.menu_id
        and m.del_flag = 0
        and rm.del_flag = 0
        and m.enable_status = 1;
       
SELECT * FROM t_device_freq WHERE sn = '93309190133';     
SELECT * FROM t_device td WHERE td.sn = '96307050160'; 

SELECT * FROM  t_cust_user;
SELECT * FROM  t_cust_user_local_account WHERE username  LIKE  '%银邦%';
SELECT*
        from t_cust_user
        where rel_user_id = 1940
        and del_flag = 0
        limit 1;
UPDATE t_cust_user SET rel_user_id =  1940 WHERE id = 503;   
SELECT * FROM t_user tu WHERE tu.account  = '银邦777';   
SELECT * from t_cust_user;

SELECT * FROM t_cust_user_local_auth WHERE account = '银邦777';
SELECT * FROM t_cust_user_local_account WHERE auth_id=503;
SELECT * FROM t_cust_user_auth_rel WHERE auth_id = 503;
SELECT * FROM t_cust_user_auth_rel WHERE user_id = 503;
SELECT * from t_cust_user WHERE id = 503;

select * from t_cust_user_third_auth WHERE id = 1;
select * from t_cust_user_wechat_account;
SELECT * FROM t_cust_user_auth_rel;

# pc端删除账号
SELECT * FROM t_user tu WHERE tu.account  = '银邦777';  
SELECT * from t_cust_user WHERE rel_user_id  = 1862;
SELECT * FROM t_cust_user_auth_rel WHERE user_id = 503 AND auth_type ='local';
SELECT * FROM t_cust_user_local_auth WHERE id = 503; # 上面的auth_id
SELECT * FROM t_cust_user_local_account WHERE auth_id=503;



SELECT * FROM t_cust_user_shared_data;
SELECT * FROM t_cust_user_third_auth WHERE openid = '0b1wFJll2D0Qbc4FEell28Vubs2wFJlB';
SELECT * FROM t_cust_user_wechat_account;


SELECT * FROM t_cust_user_auth_rel;

SELECT * FROM t_user_path;

SELECT * FROM t_user tu WHERE tu.account  = 'zlgj'; 	

SELECT *FROM t_menu tm ;

SELECT * FROM t_electric_fence; 

UPDATE t_electric_fence SET source = 1 WHERE 1=1; 
SELECT *FROM t_user tu WHERE tu.id = 1661;

SELECT * FROM t_device td WHERE td.sn = '93310080353';	

SELECT * FROM t_vehicle tv  WHERE workorder_id IS NOT NULL ; 
SELECT * FROM t_workorder tw ; 
SELECT DISTINCT order_source  FROM t_workorder tw ;
SELECT * FROM t_user tu WHERE tu.account  = '宁波康易融';	
SELECT * FROM t_cust_user_local_auth tcula WHERE tcula.account = '宁波康易融';
SELECT * FROM t_cust_user_local_account tcula WHERE tcula.auth_id IN (1027,1028);
SELECT * FROM t_cust_user_auth_rel tcual WHERE  tcual.auth_id IN (1027,1028);
SELECT * FROM t_cust_user tcu WHERE tcu.id IN (1027,1028);
SELECT * FROM t_user tu WHERE tu.id = 1590;

UPDATE t_cust_user SET rel_user_id = 2095 WHERE id = 131;

DELETE FROM t_cust_user_local_auth WHERE id IN (1027);
DELETE FROM t_cust_user_local_account WHERE id IN (1027);
DELETE FROM t_cust_user_auth_rel WHERE user_id  IN (1027);
DELETE FROM t_cust_user WHERE id IN (1027);

SELECT * FROM t_cust_user_auth_rel WHERE id  IN (877,878,879,880,881,882,883); 

SELECT * FROM t_cust_user_local_auth WHERE id IN (483,484,485,486,487);
SELECT * FROM t_cust_user_local_account WHERE id IN (483,484,485,486,487);
SELECT * FROM t_cust_user_auth_rel WHERE user_id  IN (483,484,485,486,487);
SELECT * FROM t_cust_user WHERE id IN (483,484,485,486,487);

SELECT * FROM t_cust_user a LEFT JOIN t_cust_user_auth_rel b ON a.id = b.user_id 
WHERE b.user_id IS NULL ;

SELECT *FROM t_alarm_electric_fence taef ;
SELECT source ,count(1) FROM t_electric_fence tef GROUP BY source;

SELECT * FROM t_electric_fence tef WHERE source IS NULL ;

UPDATE t_electric_fence SET source = 1 WHEN source IS NULL ;
SELECT tw.partner_order_no  ,twv.vin ,tu.username ,tu.account ,tw.finished_time 
FROM t_workorder tw LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id 
LEFT JOIN t_user tu ON tu.id = tw.updated_by 
WHERE tw.del_flag = 0 AND tw.status = 2; 

SELECT * FROM  t_electric_fence;

select * from t_alarm_electric_fence taef ;
select * from t_device td WHERE sn = '21409208744';
select * from t_vehicle_device tvd  WHERE sn = '96312110064';
select * from t_workorder_vehicle_device twvd WHERE twvd.sn = '93311150755';
select * from t_vehicle tv WHERE tv.id = 58485;
select * from t_vehicle_device tvd  WHERE tvd.vehicle_id  = 58485;
select * from t_workorder tw WHERE tw.id = 52716;
select * from t_device_location tdl WHERE sn = '93311150755';
select * from t_workorder_vehicle_device WHERE sn = '93311150755';
select * from t_workorder_vehicle_device twvd WHERE twvd.workorder_id = 52716;

SELECT * FROM t_device_journey tdj WHERE sn IN (
SELECT sn FROM t_vehicle_device tvd WHERE tvd.created_date  >= '2024-01-01'
) ORDER BY end_time  DESC ;


SELECT tdj.sn,tdj.begin_time  FROM t_device_journey tdj 
LEFT JOIN t_vehicle_device tvd ON tvd.sn = tdj.sn 
WHERE tvd.created_date >= '2024-01-01'
ORDER BY end_time DESC ;

select count(1)  from t_device_journey tdj ;


SELECT DISTINCT sn  FROM t_electric_oil_mileage teom WHERE teom.begin_time >= '2024-01-01' ORDER BY sn desc;
SELECT *   FROM t_electric_oil_mileage teom WHERE teom.sn = '96312110688';

select * from t_workorder tw WHERE tw.partner_order_no = 'AP2024011104420';
select * from t_vehicle tv WHERE tv.workorder_id = 55050;

UPDATE t_workorder SET finished_time = '2024-01-12 14:30:00' WHERE id = 55050 ;

SELECT * FROM t_alarm_warn_analyse;

select tawa.id,
tawa.device_noes,
tawa.vehicle_id,
tawa.deal_status,
tawa.alarm_level,
tawa.alarm_explain,
tawa.alarm_suggest,
tawa.alarm_time,
tv.vin,
tv.owner_name,
tv.created_date,
tw.partner_order_no,
tw.shop_name
from t_vehicle tv
inner join t_alarm_warn_analyse tawa on tv.id = tawa.vehicle_id
left join t_workorder tw on tv.workorder_id = tw.id
WHERE tv.del_flag = 0
order by tawa.alarm_level, tv.created_date, tawa.id;

SELECT * FROM t_alarm_warn_analyse;

SELECT * FROM t_device_journey WHERE sn = '8700922797';
SELECT * FROM t_device_journey_overview;

SELECT count(1) FROM t_device_journey;
SELECT sn,WEEK(begin_time) AS week_number, COUNT(*) AS count
FROM t_device_journey
GROUP BY sn,WEEK(begin_time)
ORDER BY week_number;

SELECT count(1) FROM t_device_journey;
SELECT sn,WEEK(begin_time) AS week_number, COUNT(*) AS count
FROM t_device_journey
WHERE sn = '96310210956'
GROUP BY WEEK(begin_time)
ORDER BY week_number;

SELECT DATE(begin_time) AS day,
        COUNT(*) AS dayNum
        FROM t_device_journey
        WHERE sn = '96310210956'
        GROUP BY day
        ORDER BY day;

SELECT * FROM t_device_journey tdj WHERE sn = '96310210956'; 

SELECT DISTINCT vehicle_id  FROM t_alarm_ warn_analyse;
SELECT * FROM t_alarm_warn_analyse WHERE alarm_type IS NULL ;

SELECT * FROM t_alarm_warn_analyse WHERE deal_status = 2;

SHOW CREATE TABLE t_device_journey;

CREATE TABLE `t_device_journey_statistics_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '里程主键ID',
  `sn` varchar(32) DEFAULT NULL COMMENT '设备序列号',
  `vd_id` int(11) DEFAULT NULL COMMENT '车辆、设备关系id',
  `begin_time` datetime DEFAULT NULL COMMENT '里程开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '里程结束时间',
  `begin_address` varchar(64) DEFAULT NULL COMMENT '里程开始地址',
  `end_address` varchar(64) DEFAULT NULL COMMENT '里程结束地址',
  `mileage` int(11) DEFAULT NULL COMMENT '行驶里程km',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除 0=正常 -1=删除',
  `created_date` datetime DEFAULT NULL COMMENT '创建时间|入库时间',
  `created_by` int(11) DEFAULT NULL COMMENT '创建人用户id',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updated_by` int(11) DEFAULT NULL COMMENT '更新人用户id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `journey_uniq` (`sn`,`begin_time`),
  KEY `idx_begin_time` (`begin_time`),
  KEY `idx_vd_id` (`vd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31196469 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新e盾|里程表';

SELECT * FROM t_vehicle_device tvd WHERE bind_status  = 1 AND del_flag = 0; 
SELECT * FROM t_device;
SELECT
	tvd.sn ,td.source 
FROM
	t_vehicle_device tvd
	LEFT JOIN t_device td ON td.sn = tvd.sn 
WHERE
	tvd.del_flag = 0
	AND td.del_flag = 0
	AND td.source = 1
	AND tvd.vehicle_id = 2440
	AND tvd.bind_status = 1
ORDER BY tvd.created_date LIMIT 1;

SELECT * FROM t_vehicle tv WHERE tv.vin = 'LGBH52E05JY862764';
SELECT * FROM t_vehicle tv WHERE tv.vin = 'LSGER5354NW098880';
SELECT * FROM t_workorder tw WHERE tw.partner_order_no  = 'AP2024031311491'; 
SELECT * FROM t_workorder tw WHERE tw.id = 57325;

SELECT * FROM t_workorder_vehicle_device twvd WHERE twvd.workorder_id = 57323;

SELECT * FROM t_vehicle_device tvd WHERE tvd.sn IN ('96312110090','93312010081');
SELECT * FROM t_alarm_warn_analyse;
SELECT * FROM t_alarm_track_stujudge tats ;
SELECT * FROM t_vehicle;

SELECT * FROM t_device_stay_often;	
SELECT * FROM t_user tu ;
SELECT * FROM t_tenant tt ;
SELECT * FROM t_organization to2 ;
SELECT * FROM t_role tr ;
SELECT * FROM t_role_tenant trt ;
SELECT * FROM t_user_role_relation turr ;
SELECT * FROM t_user_path tup ; 
SELECT * FROM t_role_menu trm ;
SELECT * FROM t_menu tm ;
SELECT * FROM t_menu_permission tmp ;

SELECT * FROM t_workorder tw ;
SELECT * FROM t_workorder_vehicle twv ;
SELECT * FROM t_workorder_vehicle_device twvd ;
SELECT * FROM t_vehicle tv ;
SELECT * FROM t_vehicle_device tvd ;
SELECT * FROM t_device td ;
SELECT * FROM t_device_location tdl ;

SELECT CONCAT(LEFT(tv.owner_name, 1), '**',RIGHT(tv.owner_name, 1)) AS owner_name ,CONCAT(LEFT(tv.vin, 4), '*********',RIGHT(tv.vin, 4)) AS vin ,model_name,CONCAT(LEFT(tv.license_plate, 1), '****',RIGHT(tv.license_plate, 2)) AS license_plate ,CONCAT(LEFT(tv.owner_tel, 4), '****',RIGHT(tv.owner_tel, 4)) AS owner_tel ,CONCAT(LEFT(twv.engine_no, 2), '***',RIGHT(twv.engine_no, 2)) AS engine_no,CONCAT(LEFT(tvd.sn, 3), '****',RIGHT(tvd.sn, 3)) AS sn FROM t_vehicle tv 
LEFT JOIN t_vehicle_device tvd ON tvd.vehicle_id = tv.id
LEFT JOIN t_workorder tw ON tw.id = tv.workorder_id 
LEFT JOIN t_workorder_vehicle twv ON twv.workorder_id = tw.id 
WHERE tvd.sn IS NOT NULL AND tv.owner_tel IS NOT NULL AND model_name IS NOT NULL 
AND engine_no IS NOT NULL LIMIT 100;

SELECT * FROM  t_tenant WHERE id  = 145;

SELECT * FROM t_tenant WHERE id = 44; # 租户(组织表)
SELECT * FROM t_department WHERE id = 1613;
SELECT * FROM t_organization WHERE tenant_id = 44 AND superior_id = 1611; # 组织层级表
SELECT * FROM t_user; # 用户表
SELECT * FROM t_user_path; # 用户层级表
SELECT * FROM t_role; # 角色表
SELECT * FROM t_role_tenant; # 角色和组织关联表
SELECT * FROM t_user_role_relation; # 角色和用户关联表
SELECT * FROM t_role_menu; # 角色和菜单关联表
SELECT * FROM t_menu; # 菜单表
SELECT * FROM t_menu_permission; # 菜单权限表

SELECT * FROM t_workorder;  # 工单表
SELECT * FROM t_workorder_vehicle; # 工单车辆信息表
SELECT * FROM t_workorder_vehicle_device; # 未激活(待审核时)工单车辆绑定设备信息表
SELECT * FROM t_vehicle; # 车辆表
SELECT * FROM t_vehicle_device; # 车辆设备绑定关系表
SELECT * FROM t_device;  # 设备表
SELECT * FROM t_device_location; # 设备定位表


select tvd.sn    AS sn,
               td.source AS source
        from t_vehicle_device tvd
                 LEFT JOIN t_device td ON td.sn = tvd.sn
        where tvd.vehicle_id = 39867
          AND tvd.bind_status = 1
          AND td.del_flag = 0
          and tvd.del_flag = 0
        order by tvd.created_date;
       
SELECT
            YEAR(begin_time) AS yearInt,
            WEEK(begin_time,1) AS weekInt,
            SUM(mileage)/1000 AS weekNum
        FROM t_device_journey
        WHERE sn = 15211160816
          AND del_flag = 0
        GROUP BY yearInt, weekInt
        ORDER BY yearInt, weekInt;
       
SELECT *FROM t_device_journey WHERE  sn = 15211160816;     
SELECT * FROM t_device_location tdl WHERE sn = '87201120233'; 	
SELECT * FROM t_vehicle_device tvd WHERE sn = '87201120233';
SELECT * FROM t_device td ; 
       

SELECT * from t_workorder_vehicle
        where del_flag = 0
        and workorder_id = 59123;
       
SELECT * from t_workorder_vehicle_device
        where del_flag = 0
        and workorder_id = 59123;  

SELECT * FROM t_workorder tw WHERE id  =  59123;
SELECT * FROM t_workorder tw WHERE partner_order_no  =  'AP2024050616685';

SELECT * from t_vehicle where workorder_id = 59123;  

SELECT * FROM  t_vehicle_device tvd WHERE tvd.vehicle_id IN (69503,69504);

DELETE FROM t_vehicle WHERE id = 69503;
DELETE FROM t_vehicle_device WHERE id IN (116913,116914);

SELECT * FROM t_tenant; -- 租户(组织表)
SELECT * FROM t_department; -- 部门表
SELECT * FROM t_organization; -- 组织层级表
SELECT * FROM t_user; -- 用户表
SELECT * FROM t_user_path; -- 用户层级表
SELECT * FROM t_role; -- 角色表
SELECT * FROM t_role_tenant; -- 角色和组织关联表
SELECT * FROM t_user_role_relation; -- 角色和用户关联表
SELECT * FROM t_role_menu; -- 角色和菜单关联表
SELECT * FROM t_menu; -- 菜单表
SELECT * FROM t_menu_permission; -- 菜单权限表

SELECT * FROM t_workorder; -- 工单表
SELECT * FROM t_workorder_vehicle; -- 工单车辆信息表
SELECT * FROM t_workorder_vehicle_device; -- 未激活(待审核时)工单车辆绑定设备信息表
SELECT * FROM t_vehicle; -- 车辆表
SELECT * FROM t_vehicle_device; -- 车辆设备绑定关系表
SELECT * FROM t_device; -- 设备表
SELECT * FROM t_device_location; -- 设备定位表

SELECT * FROM t_user tu ; 
SELECT * FROM t_cust_user_local_auth ; -- 本地用户表
SELECT * FROM t_cust_user_local_account ; -- 用户本地账户表
SELECT * FROM t_cust_user_auth_rel ; -- 用户登录认证关联表
SELECT * FROM t_cust_user ; -- C端客户表

SELECT * FROM t_user tu WHERE id  = 1;
SELECT * FROM t_cust_user_local_auth  WHERE id = 1;
SELECT * FROM t_cust_user_third_auth; 
SELECT * FROM t_cust_user_wechat_account; 
SELECT * FROM t_cust_user_auth_rel ;

       







