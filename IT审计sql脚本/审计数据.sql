select *
from dj_2021_settle_details;

select sum(income)
from dj_2022_settlment_order_finance_06plus
where total > 0;

select sum(hw_price - hw_cost),left(settle_time,4)
from dj_2021_settle_details group by left(settle_time,4);