SELECT * FROM  dj_2023_settlment_order_finance a WHERE LEFT(a.finance_time,7) >= '2023-06'  ORDER	BY	id DESC;
SELECT * FROM  dj_2023_settlment_order a WHERE LEFT(a.finance_time,7) >= '2023-06'  ORDER	BY	id DESC;

-- DELETE  FROM  dj_2023_settlment_order_finance  WHERE LEFT(finance_time,7) >= '2023-06';
-- DELETE  FROM  dj_2023_settlment_order WHERE LEFT(finance_time,7) >= '2023-06';

SELECT * FROM  dj_2023_settlment_order_finance a ORDER	BY	id DESC; -- 6833
SELECT * FROM  dj_2023_settlment_order a ORDER	BY	id DESC; -- 4754

-- UPDATE dj_2023_settlment_order_finance SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
-- UPDATE dj_2023_settlment_order SET device_type = '其他' WHERE product_name LIKE '%无忧卡%';
select * from dj_2023_settlment_order_finance  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-06';
select * from dj_2023_settlment_order  WHERE product_name LIKE '%无忧卡%' AND LEFT(finance_time,7) >= '2023-06';
SELECT * FROM dj_2023_settlment_order WHERE cus_name LIKE '%遵义%' AND LEFT(finance_time,7) >= '2023-06';
SELECT * FROM dj_2023_settlment_order_finance WHERE cus_name LIKE '%遵义%' AND LEFT(finance_time,7) >= '2023-06';
-- 未执行
-- UPDATE dj_2023_settlment_order SET cus_name = '遵义千汇汽车销售服务有限公司' WHERE cus_name = '遵义市千汇汽车销售服务有限公司';
-- UPDATE dj_2023_settlment_order_finance SET cus_name = '遵义千汇汽车销售服务有限公司' WHERE cus_name = '遵义市千汇汽车销售服务有限公司';
SELECT * FROM dj_system_merchant WHERE merchant_name LIKE '%遵义%';

SELECT * FROM dj_2023_settle_details_return WHERE LEFT(settle_time ,7) >= '2023-06';
SELECT * FROM dj_2023_settle_details_record WHERE LEFT(settle_time ,7) >= '2023-06';
SELECT * FROM dj_2023_settle_details WHERE LEFT(settle_time ,7) >= '2023-06';
SELECT * FROM dj_2021_settle_details WHERE LEFT(settle_time ,7) >= '2023-06';

SELECT * FROM dj_2021_settle_details WHERE settle_merchant = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_2021_settle_details_20230714  WHERE settle_merchant = '河北酷嘉汽车服务有限公司' AND `return` = 0;
SELECT * FROM dj_2023_settlment_order WHERE cus_name = '河北酷嘉汽车服务有限公司' AND product_type = '硬件';
SELECT * FROM dj_2022_settlment_order_06plus  WHERE cus_name = '河北酷嘉汽车服务有限公司' AND product_type = '硬件';
SELECT * FROM dj_2022_settlment_order_finance_06plus   WHERE cus_name = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_2021_settlment_order_finance   WHERE cus_name = '河北酷嘉汽车服务有限公司';
SELECT * FROM dj_2022_settlment_order_all   WHERE cus_name = '河北酷嘉汽车服务有限公司' AND product_type = '硬件';

SELECT LEFT(settle_time,4),sum(IFNULL(hw_cost,0) + IFNULL(install_cost, 0) ) as amount FROM dj_2021_settle_details GROUP BY LEFT(settle_time,4);
