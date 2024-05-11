SELECT *FROM dj_system_merchant dsm WHERE merchant_name = '北京猎豹商贸有限责任公司';


SELECT * FROM dj_system_merchant where merchant_name in(
'赤峰市冀东本峰汽车销售服务有限公司',
'大连友联电子有限公司',
'廊坊市庞大一众汽车销售服务有限公司',
'乌兰察布庞大弘翔丰田汽车销售服务有限公司',
'西宁中冀汽车销售有限公司',
'新疆政辉贸易有限公司',
'张家口市庞大一众汽车销售有限公司',
'张家口市庞大众腾汽车销售有限公司',
'浙江众联晟通国际贸易有限公司',
'武汉荣方科技有限公司'
);

SELECT * FROM dj_system_merchant where merchant_name in(
'武汉荣方科技有限公司'
);

SELECT * FROM dj_car_maintain;