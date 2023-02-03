select *
from dj_2021_settle_details;

select sum(income)
from dj_2022_settlment_order_finance_06plus
where total > 0;

select sum(hw_price - hw_cost),left(settle_time,4)
from dj_2021_settle_details group by left(settle_time,4);

 SELECT
                DATE_FORMAT(settle_time, '%Y-%m')                                    as monthx,
                COUNT(1)                                                             as total,
                (SUM(case WHEN pk_price is NULL then 0 else pk_price end) +
                 SUM(case when hw_price is NULL then 0 else hw_price end) +
                 SUM(case when install_price is NULL then 0 else install_price end)) as income
         from dj_2021_settle_details
         where settle_time >= '2022-01-01'
           and device_type = 8
         GROUP BY DATE_FORMAT(settle_time, '%Y-%m');

 SELECT
                substr(finance_time, 1, 7)                               as monthx,
                sale_type,
                SUM(case when product_type = '硬件' then total else 0 end) as total,
                SUM(income)                                              as income,
                SUM(cost)
         FROM dj_2022_settlment_order_finance_06plus
         where device_type in ('GPS', 'OBD')
           and product_type in ('硬件', '服务', '安装')
           and business_type = 'SAAS系统订阅服务—旧版本'
           and finance_time >= '2022-01-01'
           and total > 0
         GROUP BY  substr(finance_time, 1, 7)

