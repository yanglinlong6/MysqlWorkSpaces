SELECT max(svrtime) FROM  dj_car_maintain;
SELECT * FROM dj_car_collision; 
SELECT count(1) FROM  dj_car_collision WHERE collision_time < '2023-01-01';
SELECT * FROM dj_car_collision WHERE stand_no = 'LFV2B20S5J5263985';
SELECT * FROM dj_car_maintain WHERE svrtime < '2023-01-01' ORDER BY id DESC;
SELECT * FROM dj_car_shop_warning WHERE trigger_time < '2023-01-01' ORDER BY id DESC;

SELECT DATE_FORMAT(trigger_time, '%Y-%m'),COUNT(*) FROM dj_car_shop_warning 
GROUP BY DATE_FORMAT(trigger_time, '%Y-%m') DESC;

SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC;