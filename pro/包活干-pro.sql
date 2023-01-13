select id,
       user_id,
       mail,
       occupation,
       provider_name,
       address_detail,
       address_code,
       IDCard,
       bank_card_no,
       bank_name,
       generate_check_sheet
from sys_manager
where user_id = 4569;

select *
from sys_manager
where provider_name = '南京臻浩-广东';

select merchant_id
from sys_order
where id = 297011;

select *
from sys_manager
where user_id = 9588;

select *
from sys_manager
where user_id = 4569;

select *
from sys_order
where order_sn = '81282451134225903616';

select *
from sys_order_file
where order_id = 309886;

select *
from sys_order_status
where order_id = 297555;

select *
from sys_service_item
where service_code = 'PA001'
limit 1;


select *
from sys_order_audit_status
where order_id = 297555;

select *
from sys_order
where vin_no = 'LDP31B96XNG132902';

SELECT CONCAT_WS('', sa2.area_name, sa1.area_name, sa.area_name) AS fullArea
FROM sys_area sa
         LEFT JOIN sys_area sa1 ON sa.parent_id = sa1.id
         LEFT JOIN sys_area sa2 ON sa1.parent_id = sa2.id
WHERE sa.id = 231086;


select *
from sys_user
where username = '天津鸿盛';

select *
from sys_manager
where provider_name = '天津鸿盛';

select *
from sys_merchant;

select *
from sys_user
where id = 9587;

select *
from sys_user_role
where user_id = 9587;

select *
from sys_role
where id = 1;

select sm.*
from sys_role_menu srm
         left join sys_menu sm on sm.id = srm.menu_id
where srm.role_id = 1;

select *
from sys_order
where vin_no = 'JN8BY2NY6K9180471';
select *
from sys_order
where id = 311565;

select *
from sys_order_device
where order_id = 311565;
select *
from sys_order_device
where device_no = 1620804693;
select *
from sys_order_device
where device_no = 16208046931620;
update sys_order_device
set device_no =1620804693
where id = 268346;

select *
from sys_order_audit_status
where order_id = 311565;
select *
from sys_order_status
where order_id = 311565;

select *
from sys_user
where id = 8903;

select *
from sys_order_file
where id = 915929;

select *
from sys_order_status
where order_id = 299873;

select *
from sys_order_audit_status
where order_id = 299873;

select *
from sys_user
where id in (9736, 7322);

select *
from sys_user
where id = 6392;

select *
from sys_mechanic
where user_id = 6392;

select *
from sys_user_org;

select *
from sys_organization
where id = 3809;

select *
from sys_organization
where id = 557;

select *
from sys_user;

SELECT DISTINCT so.id   id,
                so.NAME NAME,
                so.org_type,
                0       user_id
FROM sys_organization so
WHERE so.parent_id = 0
  AND so.org_status = 1;


select sm.*
from sys_mechanic sm
         left join sys_user su on su.id = sm.user_id
where su.name in ('银川天银张慧');

select sm.*
from sys_mechanic sm
         left join sys_user su on su.id = sm.user_id
where su.name in (
                  '遵义广汇丰田陈敏',
                  '资阳港宏泰瑞彭清楷',
                  '资阳港宏鼎益王春艳',
                  '直营经纪新疆广汇贵州分公司乔实',
                  '直营经纪人虚拟账号(贵州分公司)张洪全',
                  '直营经纪贵州分公司邹晓艳',
                  '直营经纪贵州分公司杨梅',
                  '直营经纪贵州分公司晏阳',
                  '直营经纪贵州分公司许浪',
                  '直营经纪贵州分公司吴杰',
                  '直营经纪贵州分公司王红伟',
                  '直营经纪贵州分公司汪岑冬',
                  '直营经纪贵州分公司田应山',
                  '直营经纪贵州分公司唐小军',
                  '直营经纪贵州分公司冉启波',
                  '直营经纪贵州分公司吕康',
                  '直营经纪贵州分公司李书庭',
                  '直营经纪贵州分公司李鹏',
                  '直营经纪贵州分公司李昌恒',
                  '直营经纪贵州分公司李波',
                  '直营经纪贵州分公司陈倩',
                  '峪关赛亚金屹张丹',
                  '榆林泓易',
                  '榆林奥森',
                  '翼达飞重庆-罗磊',
                  '翼达飞昆明-白如龙',
                  '翼达飞大理-张建雄',
                  '宜宾沃信李泽容',
                  '宜宾申蓉致鑫胡靖',
                  '宜宾申蓉裕祥黄显琼',
                  '宜宾申蓉四维付饶',
                  '宜宾申蓉顺达李丹丹',
                  '宜宾广信苏菲',
                  '宜宾广汇丰田郭丹',
                  '阳江德信蔡蔼玫',
                  '星宸宝宁夏李旭晖',
                  '信阳张磊',
                  '新疆金涛杨兰',
                  '新疆捷众沃尔沃李松',
                  '锡林郭勒盟威力斯',
                  '西宁尚胜名泰薛丽',
                  '西宁邯海朱岳成',
                  '西安庆通',
                  '西安秦川唐都机电',
                  '西安金花宝鼎',
                  '西安汇群',
                  '武玉皓',
                  '武威赛亚汇叶玺',
                  '武威金色丰田秦黄山',
                  '武汉弘正丰李智',
                  '吴忠金富源房丽娟',
                  '乌兰察布市捷通众信',
                  '乌兰察布市捷通众达',
                  '渭南佳燕',
                  '渭南佳圣',
                  '渭南国盛汽',
                  '渭南高新区通辉',
                  '通辽市安程',
                  '苏州翼达飞-王鑫宇',
                  '四川宜宾申蓉文丽',
                  '四川申蓉裕丰石安渠',
                  '四川申蓉宇丰白琼',
                  '四川申蓉雅泰杨辉',
                  '四川申蓉兴泓杨婷',
                  '四川申蓉圣飞邓黎莉',
                  '四川申蓉九兴宋瑜',
                  '四川申蓉汇亚谢惠群',
                  '四川申蓉泓正陈鑫',
                  '四川申蓉泓宇敬艳',
                  '四川申蓉泓盛杨剑',
                  '四川申蓉泓盛温江分公司王静波',
                  '四川申蓉泓捷杜所英',
                  '四川申蓉泓嘉吴怡',
                  '四川申蓉和浩谢婷',
                  '四川申蓉广谷唐霞',
                  '四川合盛段容',
                  '四川港宏新通张洋',
                  '四川港宏西物时代白小英',
                  '四川港宏盛业李霞',
                  '四川港宏盛丰韦玉婷',
                  '四川港宏凯威行吕作元',
                  '四川港宏风神陈莉',
                  '四川港宏鼎鑫钟明英',
                  '四川港宏白兰',
                  '上海融玉曹金龙',
                  '陕西忠伟',
                  '陕西望圣陕西华兴盛世陕西华兴盛誉',
                  '陕西天华',
                  '陕西唐兴',
                  '陕西融鼎科创',
                  '陕西佳益',
                  '陕西佳泰',
                  '陕西佳骏',
                  '陕西佳豪金鼎（榆林）',
                  '陕西佳豪',
                  '陕西华兴新世纪',
                  '陕西华兴咸通',
                  '陕西华兴世通',
                  '陕西华兴时代',
                  '陕西华兴乾通',
                  '陕西福达',
                  '陕西城智',
                  '陕西百佳',
                  '陕西奥本',
                  '青农集团青海三江源韩永琴',
                  '青海-直营经纪人虚拟账号王炜',
                  '青海通瑞董永娟',
                  '青海天汇翼林张晓红',
                  '青海天汇茂林张廷霞',
                  '青海赛亚王龙',
                  '青海赛亚金屹赵文卿',
                  '青海赛亚金晟沙海鸿',
                  '青海赛亚金昊王小乐',
                  '青海赛亚金孚马风霞',
                  '青海赛亚华森李文超',
                  '青海区域总罗海平',
                  '青海捷路苗慧青',
                  '青海嘉运谢玉英',
                  '青海嘉悦张丹',
                  '青海恒远韩晓慧',
                  '青海海众祝新年',
                  '青海海通蒲继平',
                  '青海广誉汇信蔡宗平',
                  '宁夏自立升孙鑫月',
                  '宁夏志成曹金磊',
                  '宁夏-直营经纪人虚拟账号苏志勇',
                  '宁夏赢胜郑欢欢',
                  '宁夏银川上陵丰田安丽',
                  '宁夏怡通张立微',
                  '宁夏怡海刘宁',
                  '宁夏新胜宋青霞',
                  '宁夏吴忠上陵丰田郭文娟',
                  '宁夏万易丰王小娟',
                  '宁夏天利新华夏王磊',
                  '宁夏天汇美立升马麟',
                  '宁夏天汇金奥杨福玲',
                  '宁夏上陵迈轮杨亚星',
                  '宁夏人和雍楠',
                  '宁夏区域总炕菁菁',
                  '宁夏京胜席北晨',
                  '宁夏金顺通张晓燕',
                  '宁夏金富源高佩',
                  '宁夏佳丰吴燕妮',
                  '宁夏弘胜赵艳',
                  '宁夏和众进口邹佳华',
                  '宁夏和锐天福丁芳',
                  '宁夏广誉汇信',
                  '宁夏广通金服马晓菲',
                  '宁夏福立升马佳丽',
                  '宁夏东辉李春雨',
                  '宁夏鼎丰王斌',
                  '宁夏驰川张浩雅',
                  '宁夏奥立升温超',
                  '内蒙古众和',
                  '内蒙古奕昊',
                  '内蒙古亿阳汇丰',
                  '内蒙古亿阳汇达内蒙古亿阳汇众',
                  '内蒙古新奥捷',
                  '内蒙古天银杜晓琴',
                  '内蒙古坤诺',
                  '内蒙古汇易融',
                  '内蒙古汇迪',
                  '内蒙古广汇天诚',
                  '内蒙古广汇汇通',
                  '内蒙古朝晟汽车销售服务有限公司',
                  '内蒙古朝晟',
                  '内蒙古奥立升王丽娜',
                  '内蒙古奥捷之星',
                  '内蒙古奥捷',
                  '凯里经济开发区华通凯跃任晓秋',
                  '凯里汇领汽车龙兴江',
                  '酒泉市吉元方瑞',
                  '酒泉市吉元敦煌分公司李文静',
                  '酒泉赛弛丰田冯敏',
                  '酒泉吉元益达韩文婷',
                  '酒泉吉元信达白华',
                  '酒泉吉元利达魏晋',
                  '酒泉海博程建梅',
                  '嘉峪关万信李明艳',
                  '嘉峪关天汇华奥朱丽丽',
                  '嘉峪关赛亚华通李文婷',
                  '嘉峪关赛亚宏运段伟珍',
                  '汇通信诚租赁榆林分公司汇通信诚租赁内蒙古分公司张欢欢',
                  '汇通信诚上海分公司李洋',
                  '汇通信诚青海分公司马强',
                  '汇通信诚青海分公司金龙',
                  '汇通信诚宁夏分公司马学文',
                  '汇通信诚内蒙古分公司张新楼',
                  '汇通信诚内蒙古分公司吴磊',
                  '汇通信诚内蒙古分公司樊广军',
                  '汇通信诚甘肃分公司颜鲁鹏',
                  '汇通信诚成都分公司张颖',
                  '汇通宁夏分公司陈绍华',
                  '汇通甘肃分公司盛泽文',
                  '汇佳众创成都王诗祎',
                  '湖南润易邓广智',
                  '胡万安成都汇腾汽车',
                  '贵州遵义乾通沪通任玉兰',
                  '贵州遵义乾通沪通-罗梅',
                  '贵州遵义乾通沪华骆礼兰',
                  '贵州遵义乾通东旭张运',
                  '贵州中致远帝利冉芳',
                  '贵州裕丰弘',
                  '贵州乾通田小红',
                  '贵州乾通汽车进出口何颖',
                  '贵州乾通南华赵钢凤',
                  '贵州乾通汇睿李玲玲',
                  '贵州乾通华盛王利平',
                  '贵州乾通东旭张桃',
                  '贵州乾通德奥岳仲谋',
                  '贵州乾通北现贵州华通兴汇邹启英',
                  '贵州联鑫融',
                  '贵州聚融翔母文龙',
                  '贵州华跃刘丹',
                  '贵州华通众源姚敬',
                  '贵州华通众捷高媛',
                  '贵州华通兴汇周红玉',
                  '贵州华通君悦胡显润',
                  '贵州华通华特彭冬梅',
                  '贵州华通华盛贺霞',
                  '贵州华通陈婷',
                  '贵州佰达赵柏锦',
                  '贵州佰达王妤',
                  '甘肃西北汽车朱志林',
                  '甘肃西北康佳',
                  '甘肃赛亚章晓军',
                  '甘肃赛亚华通朱军艳',
                  '甘肃赛亚福瑞王锐',
                  '甘肃区域总刘娟',
                  '甘肃陇赢金服李静',
                  '甘肃兰州-广誉汇信康涛涛',
                  '甘肃酒泉-直营经纪人虚拟账号李文刚',
                  '甘肃金汇通李俊',
                  '甘肃佳和美悦李英',
                  '甘肃华泰昌孙宝霞',
                  '甘肃海丰张波',
                  '甘肃广汇二手车马捷',
                  '甘肃福弘臣罗秀洪',
                  '甘肃宝通魏鹏',
                  '甘肃宝瑞德王艳艳',
                  '东莞分公司区靖君',
                  '东莞分公司罗翠玉',
                  '东莞分公司廖志礼',
                  '东莞分公司冯丽芬',
                  '成都申蓉兴辰罗燕',
                  '成都申科蓉袁萍',
                  '成都凯迪张宗仙',
                  '巴彦淖尔市蒙通',
                  '巴彦淖尔市东信泰达',
                  '阿克苏邦辰'
    );

update sys_mechanic
set mechanic_status = 'sys_user_status_pass_check'
WHERE id in (1828
    );

update sys_mechanic sm left join sys_user su on su.id = sm.user_id
set sm.mechanic_status = 'sys_user_status_pass_check'
where su.name in (
                  '遵义广汇丰田陈敏',
                  '资阳港宏泰瑞彭清楷',
                  '资阳港宏鼎益王春艳',
                  '直营经纪新疆广汇贵州分公司乔实',
                  '直营经纪人虚拟账号(贵州分公司)张洪全',
                  '直营经纪贵州分公司邹晓艳',
                  '直营经纪贵州分公司杨梅',
                  '直营经纪贵州分公司晏阳',
                  '直营经纪贵州分公司许浪',
                  '直营经纪贵州分公司吴杰',
                  '直营经纪贵州分公司王红伟',
                  '直营经纪贵州分公司汪岑冬',
                  '直营经纪贵州分公司田应山',
                  '直营经纪贵州分公司唐小军',
                  '直营经纪贵州分公司冉启波',
                  '直营经纪贵州分公司吕康',
                  '直营经纪贵州分公司李书庭',
                  '直营经纪贵州分公司李鹏',
                  '直营经纪贵州分公司李昌恒',
                  '直营经纪贵州分公司李波',
                  '直营经纪贵州分公司陈倩',
                  '峪关赛亚金屹张丹',
                  '榆林泓易',
                  '榆林奥森',
                  '翼达飞重庆-罗磊',
                  '翼达飞昆明-白如龙',
                  '翼达飞大理-张建雄',
                  '宜宾沃信李泽容',
                  '宜宾申蓉致鑫胡靖',
                  '宜宾申蓉裕祥黄显琼',
                  '宜宾申蓉四维付饶',
                  '宜宾申蓉顺达李丹丹',
                  '宜宾广信苏菲',
                  '宜宾广汇丰田郭丹',
                  '阳江德信蔡蔼玫',
                  '星宸宝宁夏李旭晖',
                  '信阳张磊',
                  '新疆金涛杨兰',
                  '新疆捷众沃尔沃李松',
                  '锡林郭勒盟威力斯',
                  '西宁尚胜名泰薛丽',
                  '西宁邯海朱岳成',
                  '西安庆通',
                  '西安秦川唐都机电',
                  '西安金花宝鼎',
                  '西安汇群',
                  '武玉皓',
                  '武威赛亚汇叶玺',
                  '武威金色丰田秦黄山',
                  '武汉弘正丰李智',
                  '吴忠金富源房丽娟',
                  '乌兰察布市捷通众信',
                  '乌兰察布市捷通众达',
                  '渭南佳燕',
                  '渭南佳圣',
                  '渭南国盛汽',
                  '渭南高新区通辉',
                  '通辽市安程',
                  '苏州翼达飞-王鑫宇',
                  '四川宜宾申蓉文丽',
                  '四川申蓉裕丰石安渠',
                  '四川申蓉宇丰白琼',
                  '四川申蓉雅泰杨辉',
                  '四川申蓉兴泓杨婷',
                  '四川申蓉圣飞邓黎莉',
                  '四川申蓉九兴宋瑜',
                  '四川申蓉汇亚谢惠群',
                  '四川申蓉泓正陈鑫',
                  '四川申蓉泓宇敬艳',
                  '四川申蓉泓盛杨剑',
                  '四川申蓉泓盛温江分公司王静波',
                  '四川申蓉泓捷杜所英',
                  '四川申蓉泓嘉吴怡',
                  '四川申蓉和浩谢婷',
                  '四川申蓉广谷唐霞',
                  '四川合盛段容',
                  '四川港宏新通张洋',
                  '四川港宏西物时代白小英',
                  '四川港宏盛业李霞',
                  '四川港宏盛丰韦玉婷',
                  '四川港宏凯威行吕作元',
                  '四川港宏风神陈莉',
                  '四川港宏鼎鑫钟明英',
                  '四川港宏白兰',
                  '上海融玉曹金龙',
                  '陕西忠伟',
                  '陕西望圣陕西华兴盛世陕西华兴盛誉',
                  '陕西天华',
                  '陕西唐兴',
                  '陕西融鼎科创',
                  '陕西佳益',
                  '陕西佳泰',
                  '陕西佳骏',
                  '陕西佳豪金鼎（榆林）',
                  '陕西佳豪',
                  '陕西华兴新世纪',
                  '陕西华兴咸通',
                  '陕西华兴世通',
                  '陕西华兴时代',
                  '陕西华兴乾通',
                  '陕西福达',
                  '陕西城智',
                  '陕西百佳',
                  '陕西奥本',
                  '青农集团青海三江源韩永琴',
                  '青海-直营经纪人虚拟账号王炜',
                  '青海通瑞董永娟',
                  '青海天汇翼林张晓红',
                  '青海天汇茂林张廷霞',
                  '青海赛亚王龙',
                  '青海赛亚金屹赵文卿',
                  '青海赛亚金晟沙海鸿',
                  '青海赛亚金昊王小乐',
                  '青海赛亚金孚马风霞',
                  '青海赛亚华森李文超',
                  '青海区域总罗海平',
                  '青海捷路苗慧青',
                  '青海嘉运谢玉英',
                  '青海嘉悦张丹',
                  '青海恒远韩晓慧',
                  '青海海众祝新年',
                  '青海海通蒲继平',
                  '青海广誉汇信蔡宗平',
                  '宁夏自立升孙鑫月',
                  '宁夏志成曹金磊',
                  '宁夏-直营经纪人虚拟账号苏志勇',
                  '宁夏赢胜郑欢欢',
                  '宁夏银川上陵丰田安丽',
                  '宁夏怡通张立微',
                  '宁夏怡海刘宁',
                  '宁夏新胜宋青霞',
                  '宁夏吴忠上陵丰田郭文娟',
                  '宁夏万易丰王小娟',
                  '宁夏天利新华夏王磊',
                  '宁夏天汇美立升马麟',
                  '宁夏天汇金奥杨福玲',
                  '宁夏上陵迈轮杨亚星',
                  '宁夏人和雍楠',
                  '宁夏区域总炕菁菁',
                  '宁夏京胜席北晨',
                  '宁夏金顺通张晓燕',
                  '宁夏金富源高佩',
                  '宁夏佳丰吴燕妮',
                  '宁夏弘胜赵艳',
                  '宁夏和众进口邹佳华',
                  '宁夏和锐天福丁芳',
                  '宁夏广誉汇信',
                  '宁夏广通金服马晓菲',
                  '宁夏福立升马佳丽',
                  '宁夏东辉李春雨',
                  '宁夏鼎丰王斌',
                  '宁夏驰川张浩雅',
                  '宁夏奥立升温超',
                  '内蒙古众和',
                  '内蒙古奕昊',
                  '内蒙古亿阳汇丰',
                  '内蒙古亿阳汇达内蒙古亿阳汇众',
                  '内蒙古新奥捷',
                  '内蒙古天银杜晓琴',
                  '内蒙古坤诺',
                  '内蒙古汇易融',
                  '内蒙古汇迪',
                  '内蒙古广汇天诚',
                  '内蒙古广汇汇通',
                  '内蒙古朝晟汽车销售服务有限公司',
                  '内蒙古朝晟',
                  '内蒙古奥立升王丽娜',
                  '内蒙古奥捷之星',
                  '内蒙古奥捷',
                  '凯里经济开发区华通凯跃任晓秋',
                  '凯里汇领汽车龙兴江',
                  '酒泉市吉元方瑞',
                  '酒泉市吉元敦煌分公司李文静',
                  '酒泉赛弛丰田冯敏',
                  '酒泉吉元益达韩文婷',
                  '酒泉吉元信达白华',
                  '酒泉吉元利达魏晋',
                  '酒泉海博程建梅',
                  '嘉峪关万信李明艳',
                  '嘉峪关天汇华奥朱丽丽',
                  '嘉峪关赛亚华通李文婷',
                  '嘉峪关赛亚宏运段伟珍',
                  '汇通信诚租赁榆林分公司汇通信诚租赁内蒙古分公司张欢欢',
                  '汇通信诚上海分公司李洋',
                  '汇通信诚青海分公司马强',
                  '汇通信诚青海分公司金龙',
                  '汇通信诚宁夏分公司马学文',
                  '汇通信诚内蒙古分公司张新楼',
                  '汇通信诚内蒙古分公司吴磊',
                  '汇通信诚内蒙古分公司樊广军',
                  '汇通信诚甘肃分公司颜鲁鹏',
                  '汇通信诚成都分公司张颖',
                  '汇通宁夏分公司陈绍华',
                  '汇通甘肃分公司盛泽文',
                  '汇佳众创成都王诗祎',
                  '湖南润易邓广智',
                  '胡万安成都汇腾汽车',
                  '贵州遵义乾通沪通任玉兰',
                  '贵州遵义乾通沪通-罗梅',
                  '贵州遵义乾通沪华骆礼兰',
                  '贵州遵义乾通东旭张运',
                  '贵州中致远帝利冉芳',
                  '贵州裕丰弘',
                  '贵州乾通田小红',
                  '贵州乾通汽车进出口何颖',
                  '贵州乾通南华赵钢凤',
                  '贵州乾通汇睿李玲玲',
                  '贵州乾通华盛王利平',
                  '贵州乾通东旭张桃',
                  '贵州乾通德奥岳仲谋',
                  '贵州乾通北现贵州华通兴汇邹启英',
                  '贵州联鑫融',
                  '贵州聚融翔母文龙',
                  '贵州华跃刘丹',
                  '贵州华通众源姚敬',
                  '贵州华通众捷高媛',
                  '贵州华通兴汇周红玉',
                  '贵州华通君悦胡显润',
                  '贵州华通华特彭冬梅',
                  '贵州华通华盛贺霞',
                  '贵州华通陈婷',
                  '贵州佰达赵柏锦',
                  '贵州佰达王妤',
                  '甘肃西北汽车朱志林',
                  '甘肃西北康佳',
                  '甘肃赛亚章晓军',
                  '甘肃赛亚华通朱军艳',
                  '甘肃赛亚福瑞王锐',
                  '甘肃区域总刘娟',
                  '甘肃陇赢金服李静',
                  '甘肃兰州-广誉汇信康涛涛',
                  '甘肃酒泉-直营经纪人虚拟账号李文刚',
                  '甘肃金汇通李俊',
                  '甘肃佳和美悦李英',
                  '甘肃华泰昌孙宝霞',
                  '甘肃海丰张波',
                  '甘肃广汇二手车马捷',
                  '甘肃福弘臣罗秀洪',
                  '甘肃宝通魏鹏',
                  '甘肃宝瑞德王艳艳',
                  '东莞分公司区靖君',
                  '东莞分公司罗翠玉',
                  '东莞分公司廖志礼',
                  '东莞分公司冯丽芬',
                  '成都申蓉兴辰罗燕',
                  '成都申科蓉袁萍',
                  '成都凯迪张宗仙',
                  '巴彦淖尔市蒙通',
                  '巴彦淖尔市东信泰达',
                  '阿克苏邦辰'
    );

select *
from sys_user
where username = '银川天银张慧';

select *
from sys_user
where username = 'caixy';

select *
from sys_user
where name = '杨振亮';

select *
from sys_user_org
where user_id = 776
  and org_id = 1187;

SELECT u.id,
       u.org_id                                   orgId,
       so.name                                    orgName,
       u.user_status                              userStatus,
       u.NAME,
       u.password                                 password,
       u.phone_number                             phoneNumber,
       sm.district                                district,
       sm.address                                 address,
       u.create_time                              createTime,
       GROUP_CONCAT(sdd.data_value SEPARATOR '/') serviceItems,
       GROUP_CONCAT(sdd.data_key)                 serviceKey,
       sm.service_type                            serviceType,
       sm.IDCard,
       sm.mechanic_status                         mechanicStatus,
       sm.work_time_start                         workTimeStart,
       sm.work_time_end                           workTimeEnd,
       sm.dispatch_type                           dispatchType,
       sm.send_type                               sendType,
       sm.bank_card_no         as                 bankCardNo,
       sm.real_name            as                 realName,
       sm.bank_province_code   as                 bankProvinceCode,
       sm.bank_city_code       as                 bankCityCode,
       sm.bank_district_code   as                 bankDistrictCode,
       sm.bank_province        as                 bankProvince,
       sm.bank_district        as                 bankDistrict,
       sm.bank_city            as                 bankCity,
       sm.bank_name            as                 bankName,
       sm.generate_check_sheet as                 generateCheckSheet,
       ssm.service_id          as                 serviceId,
       sp.provider_name        as                 serviceName
FROM sys_user_org suo
         LEFT JOIN sys_organization so ON suo.org_id = so.id
         LEFT JOIN sys_user u ON u.org_id = so.id
         LEFT JOIN sys_mechanic sm ON sm.user_id = u.id
         LEFT JOIN sys_user_services sus ON sm.user_id = sus.user_id
         LEFT JOIN sys_dict_data sdd ON sus.service_key = sdd.data_key
         LEFT JOIN sys_service_mechanic ssm ON ssm.mechanic_id = u.id
         LEFT JOIN sys_user su ON su.id = ssm.service_id
         LEFT JOIN sys_manager sp ON sp.user_id = ssm.service_id
WHERE suo.user_id = 1388
  AND u.user_type = 3;

select *
from sys_order
where order_sn = '81283829481958928384';

select *
from sys_order
where order_sn = '81283825474938990592';

update sys_order
set active_status = 9
where order_sn in (
                   '81283829481958928384',
                   '81283825474938990592'
    );


select *
from sys_order
where vin_no = 'LSVCH6A4XDN016125';

select vin_no
from sys_order
where work_order_no = 1105836711;

select *
from sys_order
where order_sn = '81287426900063809536';

select *
from sys_order_file
where order_id = 305193;

select so.work_order_no, so.vin_no, so.vin_hash, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_merchant
where shop_name in ('汇通信诚租赁有限公司甘肃分公司', '内蒙古朝晟汽车销售服务有限公司', '苏州翼达飞汽车服务有限公司');

select *
from sys_merchant
where user_id = 2181;


select *
from sys_resource_matching
where merchant_id in (9337, 3449, 1835);
select *
from sys_resource_matching
where merchant_id in (2181);

delete
from sys_resource_matching
where id in (316,
             456,
             560,
             561,
             703
    );


select *
from sys_user_service_items
where user_id in (9337, 3449, 1835)
  and match_status = 'sys_user_status_bound';

update sys_user_service_items
set match_status = 'sys_user_status_unbound_service'
where id in (78458, 77282, 77650);

select *
from sys_user_service_items
where id in (78458, 77282, 77650);

select *
from sys_user
where password = '67973faf7760b8665de96d107e6647e5';


select *
from sys_service_item
where service_code in (003, 004);

select *
from sys_order;

select *
from sys_role;

select *
from sys_user
where id = 9143;

select *
from sys_service_item
where is_audit = 1;

select so.work_order_no, so.vin_no, so.mechanic_address, su.name
from sys_order so
         left join sys_user su on su.id = so.mechanic_id
#          left join sys_mechanic sm on sm.user_id = su.id
where order_source = 'PAZL'
  and active_status = 8;

select *
from sys_area
where parent_id = 310100

select *
from sys_order
where work_order_no = 'PAGL-3207416-2023ZLTJ100505721-ZL-01-0112151146365';

select *
from sys_order_status
where order_id = 313363;

select *
from sys_order_audit_status
where order_id = 313363;

update sys_order
set audit_status = 3
where id = 313363;
INSERT INTO glsx_car_service.sys_order_audit_status (order_id, audit_status, reason, remark, create_time, create_by)
VALUES (313363, 3, '', '', sysdate(), 9887);
