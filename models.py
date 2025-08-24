"""
数据库模型定义
"""
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Team(db.Model):
    """队伍信息模型"""
    __tablename__ = 'teams'
    
    team_id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='队伍ID，主键')
    team_name = db.Column(db.String(100), nullable=False, unique=True, comment='队伍名称，唯一')
    team_logo = db.Column(db.String(255), nullable=True, comment='队伍logo文件路径')
    team_slogan = db.Column(db.String(200), nullable=True, comment='队伍口号')
    team_description = db.Column(db.Text, nullable=True, comment='队伍介绍')
    team_status = db.Column(
        db.Enum('active', 'inactive', name='team_status_enum'),
        default='active',
        comment='队伍状态：active-激活，inactive-禁用'
    )
    created_at = db.Column(db.TIMESTAMP, default=datetime.utcnow, comment='创建时间')
    updated_at = db.Column(db.TIMESTAMP, default=datetime.utcnow, onupdate=datetime.utcnow, comment='更新时间')
    
    # 定义关系
    members = db.relationship('TeamMember', backref='team', lazy=True, cascade='all, delete-orphan')
    
    def __repr__(self):
        return f'<Team {self.team_name}>'
    
    def to_dict(self):
        """转换为字典格式"""
        return {
            'team_id': self.team_id,
            'team_name': self.team_name,
            'team_logo': self.team_logo,
            'team_slogan': self.team_slogan,
            'team_description': self.team_description,
            'team_status': self.team_status,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None,
            'member_count': len(self.members)
        }
    
    @property
    def leader(self):
        """获取队长"""
        return TeamMember.query.filter_by(team_id=self.team_id, is_leader=True).first()

class TeamMember(db.Model):
    """队伍成员模型"""
    __tablename__ = 'team_members'
    
    member_id = db.Column(db.Integer, primary_key=True, autoincrement=True, comment='成员ID，主键')
    team_id = db.Column(db.Integer, db.ForeignKey('teams.team_id', ondelete='CASCADE', onupdate='CASCADE'), 
                       nullable=False, comment='所属队伍ID，外键')
    member_name = db.Column(db.String(50), nullable=False, comment='成员姓名')
    member_photo = db.Column(db.String(255), nullable=True, comment='成员照片文件路径')
    member_email = db.Column(db.String(100), nullable=False, unique=True, comment='成员邮箱，唯一')
    member_phone = db.Column(db.String(20), nullable=True, comment='成员手机号')
    is_leader = db.Column(db.Boolean, default=False, comment='是否是队长')
    position = db.Column(db.String(50), nullable=True, comment='成员职位/角色')
    joined_at = db.Column(db.TIMESTAMP, default=datetime.utcnow, comment='加入时间')
    
    def __repr__(self):
        return f'<TeamMember {self.member_name}>'
    
    def to_dict(self):
        """转换为字典格式"""
        return {
            'member_id': self.member_id,
            'team_id': self.team_id,
            'member_name': self.member_name,
            'member_photo': self.member_photo,
            'member_email': self.member_email,
            'member_phone': self.member_phone,
            'is_leader': self.is_leader,
            'position': self.position,
            'joined_at': self.joined_at.isoformat() if self.joined_at else None
        }
