select device_type,count(1) from dj_device_details_agg group by device_type;

select device_type,count(1) from dj_2021_settle_details group by device_type;



#

'''
记录仪&车充合并
insert into dj_2021_settle_details (`channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return`)
SELECT `channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return` from 
dj_2022_settle_details_record where settle_time >='2022-09-01';
'''


'''
追踪器合并
insert into dj_2021_settle_details (`channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return`)
SELECT `channel`,`sn`,`iccid`,`device_type`,`material_code`,`delivery_order`,`delivery_time`,`delivery_merchant`,`active_time`,`active_merchant`,`pk_name`,
`pk_period`,`settle_merchant`,`settle_order`,`settle_time`,`pk_price`,`pk_price_tax`,`hw_price`,`hw_price_tax`,`install_price`,`install_price_tax`,`cost`,`flag`,`return` from 
dj_2022_settle_details where settle_time >='2022-09-01';
'''




#SELECT * FROM dj_2021_settle_details where active_merchant = '其他';


#1.统计数量
SELECT 
sum(
case 
when active_time < '2022-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-01-01' then 1
when active_time >= '2022-01-01' and active_time < '2022-02-01' then 1
else 0
end),

sum(
case 
when active_time < '2022-02-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-02-01' then 1
when active_time >= '2022-02-01' and active_time < '2022-03-01' then 1
else 0
end),

sum(
case 
when active_time < '2022-03-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-03-01' then 1
when active_time >= '2022-03-01' and active_time < '2022-04-01' then 1
else 0
end),


sum(
case 
when active_time < '2022-04-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-04-01' then 1
when active_time >= '2022-04-01' and active_time < '2022-05-01' then 1
else 0	
end),


sum(
case 
when active_time < '2022-05-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-05-01' then 1  
when active_time >= '2022-05-01' and active_time < '2022-06-01' then 1
else 0
end),

sum(
case 
when active_time < '2022-06-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-06-01' then 1  
when active_time >= '2022-06-01' and active_time < '2022-07-01' then 1
else 0
end),

sum(
case 
when active_time < '2022-07-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-07-01' then 1  
when active_time >= '2022-07-01' and active_time < '2022-08-01' then 1
else 0
end)

from dj_2021_settle_details where active_time is not null;




