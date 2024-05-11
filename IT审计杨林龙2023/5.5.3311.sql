SELECT DATE_FORMAT(created_date, '%Y-%m'),COUNT(*) FROM ddh_rescue_event 
GROUP BY DATE_FORMAT(created_date, '%Y-%m') DESC;

SELECT * FROM ddh_rescue_event;