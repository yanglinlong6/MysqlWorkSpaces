select userId,date_format(activeDate, '%Y-%m-%d'),activeCity,devType 
from t_pap_first_active_pos_info where activeDate > '2021-12-01' AND activeProvince = '河南省';


SELECT *FROM t_pap_first_active_pos_info;