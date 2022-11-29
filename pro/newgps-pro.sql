select distinct triggerType
from d_electric_fence_alarm;

select distinct electricFenceType
from d_electric_fence;

select distinct orderSource
from d_vehicle_workorder
where orderType = 'PAZL'
  and status <> 2;

select area, area_id, areaId
from d_vehicle_workorder
where sqbh = 'PAGL-3062391-2022ZLTJ100443710-ZL-01-1122152140505';

select distinct area_id
from d_vehicle_workorder
where orderType = 'PAZL';

select distinct address
from d_vehicle_workorder
where orderType = 'PAZL';

select area, area_id, areaId
from d_vehicle_workorder
where area_id is not null
  and area is not null;

select *
from d_vehicle_workorder
where sqbh = 'PAGL-3060945-2022ZLTJ100443777-ZL-01-1122155320149';

select area, areaId
from d_vehicle_workorder
where sqbh = 'PAZL';

select sqbh, activeTime, workOrderId, createtime
from d_vehicle_workorder
where sqbh = 'PAGL-3060945-2022ZLTJ100443777-ZL-01-1122155320149';

select *
from d_vehicle
where workOrderId = 960335;

select *
from d_track_info
where userId = 3249643;

select *
from d_user
where d_LoginUserId = 498;

select *
from d_vehicle_workorder
where status = 0
  and orderType = 'PAZL';

select area, areaId
from d_vehicle_workorder
where orderType = 'PAZL';
