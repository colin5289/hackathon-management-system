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

@app.route('/api/team/<int:team_id>/members')
def get_team_members(team_id):
    """获取指定队伍的所有成员信息"""
    try:
        # 获取队伍信息
        team = Team.query.get_or_404(team_id)
        
        # 获取该队伍的所有成员
        members = TeamMember.query.filter_by(team_id=team_id).order_by(TeamMember.is_leader.desc(), TeamMember.member_id).all()
        
        # 转换为字典格式
        team_data = {
            'team_id': team.team_id,
            'team_name': team.team_name,
            'team_logo': team.team_logo,
            'team_slogan': team.team_slogan,
            'team_description': team.team_description,
            'member_count': len(members),
            'members': []
        }
        
        for member in members:
            member_data = {
                'member_id': member.member_id,
                'member_name': member.member_name,
                'member_photo': member.member_photo,
                'member_email': member.member_email,
                'member_phone': member.member_phone,
                'is_leader': member.is_leader,
                'position': member.position,
                'joined_at': member.joined_at.strftime('%Y-%m-%d') if member.joined_at else None
            }
            team_data['members'].append(member_data)
        
        return jsonify({'success': True, 'data': team_data})
        
    except Exception as e:
        return jsonify({'success': False, 'error': str(e)}), 500

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



