#!/usr/bin/env python3
"""
Flask 应用启动脚本
"""

from app import app

if __name__ == '__main__':
    print("正在启动 Flask 应用...")
    print("应用将运行在: http://localhost:5001")
    print("按 Ctrl+C 停止应用")
    app.run(debug=True, host='0.0.0.0', port=5001)
