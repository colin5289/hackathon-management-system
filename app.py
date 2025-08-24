from flask import Flask, render_template, request, jsonify, redirect, url_for
import os
from config import DevelopmentConfig
from models import db, Team, TeamMember

# 创建Flask应用实例
app = Flask(__name__)
app.config.from_object(DevelopmentConfig)
app.secret_key = 'your-secret-key-here'  # 在生产环境中请更换为随机密钥

# 初始化数据库
db.init_app(app)

@app.route('/')
def index():
    """主页"""
    return render_template('index.html')

@app.route('/teams')
def teams():
    """参赛队伍列表页面"""
    # 获取所有激活状态的队伍，并预加载成员信息
    teams = Team.query.filter_by(team_status='active').all()
    
    # 为每个队伍添加队长信息
    for team in teams:
        # 获取队长信息
        leader = TeamMember.query.filter_by(team_id=team.team_id, is_leader=True).first()
        team.leader_info = leader
    
    return render_template('teams.html', teams=teams)

@app.route('/about')
def about():
    """关于页面"""
    return render_template('about.html')

@app.route('/api/hello')
def api_hello():
    """API示例"""
    return jsonify({
        'message': 'Hello from Flask!',
        'status': 'success'
    })

@app.route('/api/echo', methods=['POST'])
def api_echo():
    """POST API示例"""
    data = request.get_json()
    return jsonify({
        'echo': data,
        'message': 'Received your data successfully'
    })

@app.errorhandler(404)
def not_found(error):
    """404错误处理"""
    return render_template('404.html'), 404

if __name__ == '__main__':
    # 开发模式运行
    app.run(debug=True, host='0.0.0.0', port=5001)



