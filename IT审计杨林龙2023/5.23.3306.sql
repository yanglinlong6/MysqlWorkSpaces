SELECT * FROM dj_car_maintain;
SELECT max(svrtime) FROM  dj_car_maintain;
SELECT * FROM dj_car_maintain WHERE svrtime < '2023-01-01' ORDER BY id DESC;
SELECT * FROM dj_car_shop_warning WHERE trigger_time < '2023-01-01' ORDER BY id DESC;

SELECT DATE_FORMAT(trigger_time, '%Y-%m'),COUNT(*) FROM dj_car_shop_warning 
GROUP BY DATE_FORMAT(trigger_time, '%Y-%m') DESC;


SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC;

SELECT DATE_FORMAT(svrtime, '%Y-%m'),COUNT(*) FROM dj_car_maintain 
GROUP BY DATE_FORMAT(svrtime, '%Y-%m') DESC;

