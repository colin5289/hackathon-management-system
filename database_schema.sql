-- 黑客大赛管理系统数据库表结构
-- 数据库: hackathon_db

USE hackathon_db;

-- 创建队伍信息表
CREATE TABLE teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '队伍ID，主键',
    team_name VARCHAR(100) NOT NULL UNIQUE COMMENT '队伍名称，唯一',
    team_logo VARCHAR(255) DEFAULT NULL COMMENT '队伍logo文件路径',
    team_slogan VARCHAR(200) DEFAULT NULL COMMENT '队伍口号',
    team_description TEXT DEFAULT NULL COMMENT '队伍介绍',
    team_status ENUM('draft', 'registered', 'confirmed', 'competing', 'finished', 'disqualified') 
                DEFAULT 'draft' COMMENT '队伍状态',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    INDEX idx_team_name (team_name),
    INDEX idx_team_status (team_status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队伍信息表';

-- 创建队伍成员表
CREATE TABLE team_members (
    member_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '成员ID，主键',
    team_id INT NOT NULL COMMENT '所属队伍ID，外键',
    member_name VARCHAR(50) NOT NULL COMMENT '成员姓名',
    member_photo VARCHAR(255) DEFAULT NULL COMMENT '成员照片文件路径',
    member_email VARCHAR(100) NOT NULL UNIQUE COMMENT '成员邮箱，唯一',
    member_phone VARCHAR(20) DEFAULT NULL COMMENT '成员手机号',
    is_leader BOOLEAN DEFAULT FALSE COMMENT '是否是队长',
    position VARCHAR(50) DEFAULT NULL COMMENT '成员职位/角色',
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
    
    FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_team_id (team_id),
    INDEX idx_member_email (member_email),
    INDEX idx_is_leader (is_leader)
    
    -- 注意：队长唯一约束在MySQL中需要特殊处理，因为不能对BOOLEAN+NULL组合建唯一索引
    -- 我们通过应用层逻辑来保证每个队伍只有一个队长
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='队伍成员表';

-- 显示创建的表结构
SHOW TABLES;
DESCRIBE teams;
DESCRIBE team_members;



