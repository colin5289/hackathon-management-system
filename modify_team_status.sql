-- 修改teams表的team_status字段结构
-- 将原来的6种状态改为只有激活和禁用两种状态

USE hackathon_db;

-- 1. 先更新现有数据，将所有状态改为'active'
UPDATE teams SET team_status = 'active' WHERE team_status IN ('draft', 'registered', 'confirmed', 'competing', 'finished', 'disqualified');

-- 2. 修改字段类型，将ENUM改为只有两种状态
ALTER TABLE teams MODIFY COLUMN team_status ENUM('active', 'inactive') DEFAULT 'active' COMMENT '队伍状态：active-激活，inactive-禁用';

-- 3. 验证修改结果
DESCRIBE teams;
SELECT team_status, COUNT(*) as count FROM teams GROUP BY team_status;

-- 4. 显示前几条数据验证
SELECT team_id, team_name, team_status FROM teams ORDER BY team_id LIMIT 10;
