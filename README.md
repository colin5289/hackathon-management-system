# 🏆 黑客大赛管理系统

基于Flask框架开发的公司内部年度黑客大赛赛程管理和评委评分系统。

## ✨ 功能特性

- **队伍管理**: 参赛队伍信息管理，支持队伍logo、口号、介绍等
- **成员管理**: 队伍成员信息管理，包含照片、联系方式等
- **状态管理**: 队伍状态管理（激活/禁用）
- **响应式界面**: 现代化UI设计，支持多设备访问
- **数据库支持**: 基于MySQL的数据存储

## 🛠️ 技术栈

- **后端**: Python Flask
- **数据库**: MySQL
- **ORM**: Flask-SQLAlchemy
- **前端**: HTML5, CSS3, JavaScript
- **UI框架**: Bootstrap 5
- **图标**: Font Awesome

## 📁 项目结构

```
hackathon/
├── app.py                  # Flask主应用文件
├── config.py              # 配置文件
├── models.py              # 数据库模型
├── requirements.txt       # Python依赖
├── static/                # 静态文件
│   ├── css/              # 样式文件
│   ├── js/               # JavaScript文件
│   └── uploads/          # 上传文件
│       ├── team_logos/   # 队伍logo
│       └── member_photos/ # 成员照片
├── templates/             # HTML模板
└── README.md             # 项目说明
```

## 🚀 快速开始

### 环境要求

- Python 3.7+
- MySQL 5.7+
- pip

### 安装步骤

1. **克隆仓库**
   ```bash
   git clone https://github.com/colin5289/hackathon-management-system.git
   cd hackathon-management-system
   ```

2. **安装依赖**
   ```bash
   pip install -r requirements.txt
   ```

3. **配置数据库**
   - 创建MySQL数据库
   - 修改 `config.py` 中的数据库连接信息
   - 执行数据库初始化脚本

4. **运行应用**
   ```bash
   python app.py
   ```

5. **访问应用**
   打开浏览器访问: http://localhost:5001

## 📊 数据库设计

### 队伍信息表 (teams)
- 队伍ID、名称、logo、口号、介绍、状态等

### 成员信息表 (team_members)
- 成员ID、姓名、照片、邮箱、电话、队长标识等

## 🌐 主要页面

- **首页**: 系统概览和导航
- **参赛队伍**: 队伍列表展示
- **关于页面**: 系统信息

## 🔧 开发说明

### 添加新功能
1. 在 `models.py` 中定义数据模型
2. 在 `app.py` 中添加路由
3. 在 `templates/` 中创建页面模板
4. 更新 `static/` 中的样式和脚本

### 代码提交
```bash
git add .
git commit -m "描述您的修改"
git push origin master
```

## 📝 更新日志

### v1.0.0 (2024-08-25)
- ✅ 基础Flask应用架构
- ✅ 队伍和成员数据模型
- ✅ 数据库初始化脚本
- ✅ 队伍列表展示页面
- ✅ 响应式UI设计

## 🤝 贡献指南

欢迎提交Issue和Pull Request来改进这个项目！

## 📄 许可证

本项目采用MIT许可证。

## 👨‍💻 作者

[您的姓名] - 黑客大赛管理系统开发团队

---

⭐ 如果这个项目对您有帮助，请给我们一个Star！
