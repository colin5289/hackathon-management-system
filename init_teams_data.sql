-- 初始化teams表数据
-- 插入33条队伍信息

USE hackathon_db;

-- 清空现有数据（如果需要）
-- TRUNCATE TABLE teams;

-- 插入队伍数据
INSERT INTO teams (team_name, team_logo, team_slogan, team_status) VALUES
('极客先锋', '/static/uploads/team_logos/team_001.png', '代码改变世界，创新引领未来', 'registered'),
('黑客联盟', '/static/uploads/team_logos/team_002.png', '突破边界，创造可能', 'confirmed'),
('代码猎人', '/static/uploads/team_logos/team_003.png', '寻找代码中的宝藏', 'competing'),
('数字战士', '/static/uploads/team_logos/team_004.png', '用技术武装自己', 'registered'),
('算法大师', '/static/uploads/team_logos/team_005.png', '算法之美，逻辑之魂', 'confirmed'),
('网络守护', '/static/uploads/team_logos/team_006.png', '守护网络安全，维护数字正义', 'competing'),
('数据魔术师', '/static/uploads/team_logos/team_007.png', '让数据说话，让信息发光', 'registered'),
('云端行者', '/static/uploads/team_logos/team_008.png', '漫步云端，探索无限', 'confirmed'),
('智能工匠', '/static/uploads/team_logos/team_009.png', '用AI打造智能未来', 'competing'),
('代码诗人', '/static/uploads/team_logos/team_010.png', '代码如诗，逻辑如画', 'registered'),
('数字艺术家', '/static/uploads/team_logos/team_011.png', '用技术创造艺术', 'confirmed'),
('算法猎人', '/static/uploads/team_logos/team_012.png', '追逐最优解', 'competing'),
('网络骑士', '/static/uploads/team_logos/team_013.png', '守护网络世界的骑士', 'registered'),
('数据科学家', '/static/uploads/team_logos/team_014.png', '从数据中发现真理', 'confirmed'),
('智能建筑师', '/static/uploads/team_logos/team_015.png', '构建智能系统', 'competing'),
('代码炼金师', '/static/uploads/team_logos/team_016.png', '将代码炼成黄金', 'registered'),
('数字探险家', '/static/uploads/team_logos/team_017.png', '探索数字世界的奥秘', 'confirmed'),
('算法工程师', '/static/uploads/team_logos/team_018.png', '工程化的算法思维', 'competing'),
('网络工程师', '/static/uploads/team_logos/team_019.png', '构建网络基础设施', 'registered'),
('数据工程师', '/static/uploads/team_logos/team_020.png', '让数据流动起来', 'confirmed'),
('智能工程师', '/static/uploads/team_logos/team_021.png', '智能化的工程实践', 'competing'),
('代码工程师', '/static/uploads/team_logos/team_022.png', '工程化的代码实践', 'registered'),
('数字工程师', '/static/uploads/team_logos/team_023.png', '数字化的工程思维', 'confirmed'),
('算法科学家', '/static/uploads/team_logos/team_024.png', '科学化的算法研究', 'competing'),
('网络科学家', '/static/uploads/team_logos/team_025.png', '网络科学的前沿探索', 'registered'),
('数据艺术家', '/static/uploads/team_logos/team_026.png', '数据可视化的艺术', 'confirmed'),
('智能科学家', '/static/uploads/team_logos/team_027.png', '智能科学的研究者', 'competing'),
('代码科学家', '/static/uploads/team_logos/team_028.png', '代码科学的研究者', 'registered'),
('数字科学家', '/static/uploads/team_logos/team_029.png', '数字科学的研究者', 'confirmed'),
('算法艺术家', '/static/uploads/team_logos/team_030.png', '算法美学的追求者', 'competing'),
('网络艺术家', '/static/uploads/team_logos/team_031.png', '网络艺术的创造者', 'registered'),
('数据猎人', '/static/uploads/team_logos/team_032.png', '在数据中寻找价值', 'confirmed'),
('智能猎人', '/static/uploads/team_logos/team_033.png', '在智能中寻找机会', 'competing');

-- 查看插入结果
SELECT COUNT(*) as total_teams FROM teams;
SELECT team_id, team_name, team_logo, team_slogan, team_status, created_at FROM teams ORDER BY team_id;
