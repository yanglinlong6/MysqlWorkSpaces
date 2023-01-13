DELETE
from dj_2022_settle_details
where settle_time >= '2022-09-01';
DELETE
from dj_2022_settle_details_record
where settle_time >= '2022-09-01';
DELETE
from dj_2021_settle_details
where settle_time >= '2022-09-01';
DELETE
from dj_2022_settle_details_return
where settle_time >= '2022-09-01';


update dj_2022_settlment_order_06plus
set match_total=NULL,
    `status`=0
where finance_time >= '2022-09-01';

#回购退货数据
#update dj_2021_settle_details set `return` = 0 where sn in (SELECT sn from dj_2022_settle_details_return where settle_time >= '2022-09-01')


