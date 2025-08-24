-- 初始化team_members表数据
-- 为每个队伍添加1-3个成员

USE hackathon_db;

-- 插入队伍成员数据
INSERT INTO team_members (team_id, member_name, member_photo, member_email, member_phone, is_leader, position, joined_at) VALUES
-- 极客先锋 (team_id: 1) - 3个成员
(1, '张伟', '/static/uploads/member_photos/member_001.png', 'zhangwei@mingyuanyun.com', '13800138001', TRUE, '队长', NOW()),
(1, '李娜', '/static/uploads/member_photos/member_002.png', 'lina@mingyuanyun.com', '13800138002', FALSE, NULL, NOW()),
(1, '王强', '/static/uploads/member_photos/member_003.png', 'wangqiang@mingyuanyun.com', '13800138003', FALSE, NULL, NOW()),

-- 黑客联盟 (team_id: 2) - 2个成员
(2, '陈明', '/static/uploads/member_photos/member_004.png', 'chenming@mingyuanyun.com', '13800138004', TRUE, '队长', NOW()),
(2, '刘芳', '/static/uploads/member_photos/member_005.png', 'liufang@mingyuanyun.com', '13800138005', FALSE, NULL, NOW()),

-- 代码猎人 (team_id: 3) - 3个成员
(3, '赵磊', '/static/uploads/member_photos/member_006.png', 'zhaolei@mingyuanyun.com', '13800138006', TRUE, '队长', NOW()),
(3, '孙丽', '/static/uploads/member_photos/member_007.png', 'sunli@mingyuanyun.com', '13800138007', FALSE, NULL, NOW()),
(3, '周杰', '/static/uploads/member_photos/member_008.png', 'zhoujie@mingyuanyun.com', '13800138008', FALSE, NULL, NOW()),

-- 数字战士 (team_id: 4) - 1个成员
(4, '吴斌', '/static/uploads/member_photos/member_009.png', 'wubin@mingyuanyun.com', '13800138009', TRUE, '队长', NOW()),

-- 算法大师 (team_id: 5) - 3个成员
(5, '郑华', '/static/uploads/member_photos/member_010.png', 'zhenghua@mingyuanyun.com', '13800138010', TRUE, '队长', NOW()),
(5, '冯敏', '/static/uploads/member_photos/member_011.png', 'fengmin@mingyuanyun.com', '13800138011', FALSE, NULL, NOW()),
(5, '朱涛', '/static/uploads/member_photos/member_012.png', 'zhutao@mingyuanyun.com', '13800138012', FALSE, NULL, NOW()),

-- 网络守护 (team_id: 6) - 2个成员
(6, '何超', '/static/uploads/member_photos/member_013.png', 'hechao@mingyuanyun.com', '13800138013', TRUE, '队长', NOW()),
(6, '林静', '/static/uploads/member_photos/member_014.png', 'linjing@mingyuanyun.com', '13800138014', FALSE, NULL, NOW()),

-- 数据魔术师 (team_id: 7) - 3个成员
(7, '罗浩', '/static/uploads/member_photos/member_015.png', 'luohao@mingyuanyun.com', '13800138015', TRUE, '队长', NOW()),
(7, '梁燕', '/static/uploads/member_photos/member_016.png', 'liangyan@mingyuanyun.com', '13800138016', FALSE, NULL, NOW()),
(7, '宋伟', '/static/uploads/member_photos/member_017.png', 'songwei@mingyuanyun.com', '13800138017', FALSE, NULL, NOW()),

-- 云端行者 (team_id: 8) - 1个成员
(8, '谢军', '/static/uploads/member_photos/member_018.png', 'xiejun@mingyuanyun.com', '13800138018', TRUE, '队长', NOW()),

-- 智能工匠 (team_id: 9) - 3个成员
(9, '唐磊', '/static/uploads/member_photos/member_019.png', 'tanglei@mingyuanyun.com', '13800138019', TRUE, '队长', NOW()),
(9, '韩雪', '/static/uploads/member_photos/member_020.png', 'hanxue@mingyuanyun.com', '13800138020', FALSE, NULL, NOW()),
(9, '董强', '/static/uploads/member_photos/member_021.png', 'dongqiang@mingyuanyun.com', '13800138021', FALSE, NULL, NOW()),

-- 代码诗人 (team_id: 10) - 2个成员
(10, '袁杰', '/static/uploads/member_photos/member_022.png', 'yuanjie@mingyuanyun.com', '13800138022', TRUE, '队长', NOW()),
(10, '潘丽', '/static/uploads/member_photos/member_023.png', 'panli@mingyuanyun.com', '13800138023', FALSE, NULL, NOW()),

-- 数字艺术家 (team_id: 11) - 3个成员
(11, '蒋斌', '/static/uploads/member_photos/member_024.png', 'jiangbin@mingyuanyun.com', '13800138024', TRUE, '队长', NOW()),
(11, '韦敏', '/static/uploads/member_photos/member_025.png', 'weimin@mingyuanyun.com', '13800138025', FALSE, NULL, NOW()),
(11, '傅涛', '/static/uploads/member_photos/member_026.png', 'futao@mingyuanyun.com', '13800138026', FALSE, NULL, NOW()),

-- 算法猎人 (team_id: 12) - 1个成员
(12, '沈超', '/static/uploads/member_photos/member_027.png', 'shenchao@mingyuanyun.com', '13800138027', TRUE, '队长', NOW()),

-- 网络骑士 (team_id: 13) - 3个成员
(13, '卢浩', '/static/uploads/member_photos/member_028.png', 'luhao@mingyuanyun.com', '13800138028', TRUE, '队长', NOW()),
(13, '姚燕', '/static/uploads/member_photos/member_029.png', 'yaoyan@mingyuanyun.com', '13800138029', FALSE, NULL, NOW()),
(13, '方伟', '/static/uploads/member_photos/member_030.png', 'fangwei@mingyuanyun.com', '13800138030', FALSE, NULL, NOW()),

-- 数据科学家 (team_id: 14) - 2个成员
(14, '石军', '/static/uploads/member_photos/member_031.png', 'shijun@mingyuanyun.com', '13800138031', TRUE, '队长', NOW()),
(14, '崔雪', '/static/uploads/member_photos/member_032.png', 'cuixue@mingyuanyun.com', '13800138032', FALSE, NULL, NOW()),

-- 智能建筑师 (team_id: 15) - 3个成员
(15, '谭磊', '/static/uploads/member_photos/member_033.png', 'tanlei@mingyuanyun.com', '13800138033', TRUE, '队长', NOW()),
(15, '陆敏', '/static/uploads/member_photos/member_034.png', 'lumin@mingyuanyun.com', '13800138034', FALSE, NULL, NOW()),
(15, '汪强', '/static/uploads/member_photos/member_035.png', 'wangqiang2@mingyuanyun.com', '13800138035', FALSE, NULL, NOW()),

-- 代码炼金师 (team_id: 16) - 1个成员
(16, '范杰', '/static/uploads/member_photos/member_036.png', 'fanjie@mingyuanyun.com', '13800138036', TRUE, '队长', NOW()),

-- 数字探险家 (team_id: 17) - 3个成员
(17, '江斌', '/static/uploads/member_photos/member_037.png', 'jiangbin2@mingyuanyun.com', '13800138037', TRUE, '队长', NOW()),
(17, '钱敏', '/static/uploads/member_photos/member_038.png', 'qianmin@mingyuanyun.com', '13800138038', FALSE, NULL, NOW()),
(17, '田涛', '/static/uploads/member_photos/member_039.png', 'tiantao@mingyuanyun.com', '13800138039', FALSE, NULL, NOW()),

-- 算法工程师 (team_id: 18) - 2个成员
(18, '史超', '/static/uploads/member_photos/member_040.png', 'shichao@mingyuanyun.com', '13800138040', TRUE, '队长', NOW()),
(18, '白燕', '/static/uploads/member_photos/member_041.png', 'baiyan@mingyuanyun.com', '13800138041', FALSE, NULL, NOW()),

-- 网络工程师 (team_id: 19) - 3个成员
(19, '邹浩', '/static/uploads/member_photos/member_042.png', 'zouhao@mingyuanyun.com', '13800138042', TRUE, '队长', NOW()),
(19, '孟雪', '/static/uploads/member_photos/member_043.png', 'mengxue@mingyuanyun.com', '13800138043', FALSE, NULL, NOW()),
(19, '毛伟', '/static/uploads/member_photos/member_044.png', 'maowei@mingyuanyun.com', '13800138044', FALSE, NULL, NOW()),

-- 数据工程师 (team_id: 20) - 1个成员
(20, '尹军', '/static/uploads/member_photos/member_045.png', 'yinjun@mingyuanyun.com', '13800138045', TRUE, '队长', NOW()),

-- 智能工程师 (team_id: 21) - 3个成员
(21, '贾磊', '/static/uploads/member_photos/member_046.png', 'jialei@mingyuanyun.com', '13800138046', TRUE, '队长', NOW()),
(21, '夏敏', '/static/uploads/member_photos/member_047.png', 'xiamin@mingyuanyun.com', '13800138047', FALSE, NULL, NOW()),
(21, '钟强', '/static/uploads/member_photos/member_048.png', 'zhongqiang@mingyuanyun.com', '13800138048', FALSE, NULL, NOW()),

-- 代码工程师 (team_id: 22) - 2个成员
(22, '黎杰', '/static/uploads/member_photos/member_049.png', 'lijie@mingyuanyun.com', '13800138049', TRUE, '队长', NOW()),
(22, '易雪', '/static/uploads/member_photos/member_050.png', 'yixue@mingyuanyun.com', '13800138050', FALSE, NULL, NOW()),

-- 数字工程师 (team_id: 23) - 3个成员
(23, '武斌', '/static/uploads/member_photos/member_051.png', 'wubin2@mingyuanyun.com', '13800138051', TRUE, '队长', NOW()),
(23, '贺敏', '/static/uploads/member_photos/member_052.png', 'hemin@mingyuanyun.com', '13800138052', FALSE, NULL, NOW()),
(23, '常涛', '/static/uploads/member_photos/member_053.png', 'changtao@mingyuanyun.com', '13800138053', FALSE, NULL, NOW()),

-- 算法科学家 (team_id: 24) - 1个成员
(24, '龙超', '/static/uploads/member_photos/member_054.png', 'longchao@mingyuanyun.com', '13800138054', TRUE, '队长', NOW()),

-- 网络科学家 (team_id: 25) - 3个成员
(25, '段浩', '/static/uploads/member_photos/member_055.png', 'duanhao@mingyuanyun.com', '13800138055', TRUE, '队长', NOW()),
(25, '雷燕', '/static/uploads/member_photos/member_056.png', 'leiyan@mingyuanyun.com', '13800138056', FALSE, NULL, NOW()),
(25, '侯伟', '/static/uploads/member_photos/member_057.png', 'houwei@mingyuanyun.com', '13800138057', FALSE, NULL, NOW()),

-- 数据艺术家 (team_id: 26) - 2个成员
(26, '万军', '/static/uploads/member_photos/member_058.png', 'wanjun@mingyuanyun.com', '13800138058', TRUE, '队长', NOW()),
(26, '段雪', '/static/uploads/member_photos/member_059.png', 'duanxue@mingyuanyun.com', '13800138059', FALSE, NULL, NOW()),

-- 智能科学家 (team_id: 27) - 3个成员
(27, '汤磊', '/static/uploads/member_photos/member_060.png', 'tanglei2@mingyuanyun.com', '13800138060', TRUE, '队长', NOW()),
(27, '向敏', '/static/uploads/member_photos/member_061.png', 'xiangmin@mingyuanyun.com', '13800138061', FALSE, NULL, NOW()),
(27, '古强', '/static/uploads/member_photos/member_062.png', 'guqiang@mingyuanyun.com', '13800138062', FALSE, NULL, NOW()),

-- 代码科学家 (team_id: 28) - 1个成员
(28, '文杰', '/static/uploads/member_photos/member_063.png', 'wenjie@mingyuanyun.com', '13800138063', TRUE, '队长', NOW()),

-- 数字科学家 (team_id: 29) - 3个成员
(29, '乐斌', '/static/uploads/member_photos/member_064.png', 'lebin@mingyuanyun.com', '13800138064', TRUE, '队长', NOW()),
(29, '关敏', '/static/uploads/member_photos/member_065.png', 'guanmin@mingyuanyun.com', '13800138065', FALSE, NULL, NOW()),
(29, '莫涛', '/static/uploads/member_photos/member_066.png', 'motao@mingyuanyun.com', '13800138066', FALSE, NULL, NOW()),

-- 算法艺术家 (team_id: 30) - 2个成员
(30, '房超', '/static/uploads/member_photos/member_067.png', 'fangchao@mingyuanyun.com', '13800138067', TRUE, '队长', NOW()),
(30, '喻雪', '/static/uploads/member_photos/member_068.png', 'yuxue@mingyuanyun.com', '13800138068', FALSE, NULL, NOW()),

-- 网络艺术家 (team_id: 31) - 3个成员
(31, '水浩', '/static/uploads/member_photos/member_069.png', 'shuihao@mingyuanyun.com', '13800138069', TRUE, '队长', NOW()),
(31, '窦燕', '/static/uploads/member_photos/member_070.png', 'douyan@mingyuanyun.com', '13800138070', FALSE, NULL, NOW()),
(31, '章伟', '/static/uploads/member_photos/member_071.png', 'zhangwei2@mingyuanyun.com', '13800138071', FALSE, NULL, NOW()),

-- 数据猎人 (team_id: 32) - 1个成员
(32, '云军', '/static/uploads/member_photos/member_072.png', 'yunjun@mingyuanyun.com', '13800138072', TRUE, '队长', NOW()),

-- 智能猎人 (team_id: 33) - 3个成员
(33, '苏磊', '/static/uploads/member_photos/member_073.png', 'sulei@mingyuanyun.com', '13800138073', TRUE, '队长', NOW()),
(33, '葛敏', '/static/uploads/member_photos/member_074.png', 'gemin@mingyuanyun.com', '13800138074', FALSE, NULL, NOW()),
(33, '奚强', '/static/uploads/member_photos/member_075.png', 'xiqiang@mingyuanyun.com', '13800138075', FALSE, NULL, NOW());

-- 查看插入结果
SELECT COUNT(*) as total_members FROM team_members;
SELECT team_id, COUNT(*) as member_count FROM team_members GROUP BY team_id ORDER BY team_id;
SELECT member_id, team_id, member_name, member_email, is_leader FROM team_members ORDER BY member_id LIMIT 10;
