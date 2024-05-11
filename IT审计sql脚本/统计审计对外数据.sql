select count(*) from dj_device_details where settle_time between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_system_merchant where created_date between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_car_collision where created_date between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_car_maintain where created_date between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_car_shop_warning where created_date between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_car_shop_warning where created_date between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';

select count(*) from dj_device_details_return where settle_time between '2020-01-01 00:00:00' and '2022-12-31 23:59:59';


select * from dj_system_merchant ;

set @yearStart = '2017-01-01';
set @yearEnd = '2018-01-01';
SELECT count(DISTINCT active_merchant) from dj_2021_settle_details where active_merchant <> '' and
((active_time < @yearStart and DATE_ADD(active_time,INTERVAL pk_period MONTH) > @yearEnd) or
active_time >= @yearStart and active_time < @yearEnd);


select count(1) as num,left(created_date,4) from dj_system_merchant group by left(created_date,4);

select count(1) as num from dj_system_merchant where left(created_date,4) <='2022';

select count(1) as num,left(active_time,4) from dj_2021_settle_details group by left(active_time,4);


SELECT
sum(
case
when active_time < '2018-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2018-01-01' then 1
when active_time >= '2018-01-01' and active_time < '2019-01-01' then 1
else 0
end),
sum(
case
when active_time < '2019-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2019-01-01' then 1
when active_time >= '2019-01-01' and active_time < '2020-01-01' then 1
else 0
end),
sum(
case
when active_time < '2020-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2020-01-01' then 1
when active_time >= '2020-01-01' and active_time < '2021-01-01' then 1
else 0
end),
sum(
case
when active_time < '2021-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2021-01-01' then 1
when active_time >= '2021-01-01' and active_time < '2022-01-01' then 1
else 0
end),
sum(
case
when active_time < '2022-01-01' and DATE_ADD(active_time,INTERVAL pk_period MONTH) > '2022-01-01' then 1
when active_time >= '2022-01-01' and active_time < '2023-01-01' then 1
else 0
end)
from dj_2021_settle_details where active_time is not null;

set @yearStart = '2022-01-01';
set @yearEnd = '2023-01-01';
SELECT count(DISTINCT active_merchant) from dj_2021_settle_details where active_merchant <> '' and
((active_time < @yearStart and DATE_ADD(active_time,INTERVAL pk_period MONTH) > @yearEnd) or
active_time >= @yearStart and active_time < @yearEnd);