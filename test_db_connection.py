#!/usr/bin/env python3
"""
测试数据库连接脚本
"""
import sys
from flask import Flask
from config import DevelopmentConfig
from models import db, Team, TeamMember

def test_database_connection():
    """测试数据库连接"""
    # 创建Flask应用
    app = Flask(__name__)
    app.config.from_object(DevelopmentConfig)
    
    # 初始化数据库
    db.init_app(app)
    
    with app.app_context():
        try:
            # 测试连接
            db.engine.connect()
            print("✅ 数据库连接成功!")
            
            # 测试查询
            team_count = Team.query.count()
            member_count = TeamMember.query.count()
            
            print(f"📊 当前数据库状态:")
            print(f"   - 队伍数量: {team_count}")
            print(f"   - 成员数量: {member_count}")
            
            # 测试表结构
            print(f"📋 表结构验证:")
            print(f"   - teams表: 存在")
            print(f"   - team_members表: 存在")
            
            return True
            
        except Exception as e:
            print(f"❌ 数据库连接失败: {e}")
            return False

if __name__ == '__main__':
    success = test_database_connection()
    sys.exit(0 if success else 1)
