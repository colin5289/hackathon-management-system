#!/usr/bin/env python3
"""
生成33张团队logo图片
使用PIL库创建简单的200x200px PNG图片
"""

from PIL import Image, ImageDraw, ImageFont
import os
import random

def create_team_logo(team_name, filename, color_scheme):
    """创建团队logo"""
    # 创建200x200的图片
    img = Image.new('RGBA', (200, 200), color_scheme['background'])
    draw = ImageDraw.Draw(img)
    
    # 绘制圆形背景
    circle_bbox = (20, 20, 180, 180)
    draw.ellipse(circle_bbox, fill=color_scheme['circle'])
    
    # 绘制边框
    draw.ellipse(circle_bbox, outline=color_scheme['border'], width=3)
    
    # 尝试使用系统字体，如果失败则使用默认字体
    try:
        # 根据队伍名称长度调整字体大小
        if len(team_name) <= 3:
            font_size = 36
        elif len(team_name) <= 4:
            font_size = 32
        else:
            font_size = 28
            
        font = ImageFont.truetype("/System/Library/Fonts/PingFang.ttc", font_size)
    except:
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 32)
        except:
            font = ImageFont.load_default()
    
    # 计算文字位置（居中）
    bbox = draw.textbbox((0, 0), team_name, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    x = (200 - text_width) // 2
    y = (200 - text_height) // 2
    
    # 绘制文字
    draw.text((x, y), team_name, fill=color_scheme['text'], font=font)
    
    # 保存图片
    img.save(filename, 'PNG')
    print(f"✅ 创建logo: {filename}")

def main():
    """主函数"""
    # 确保目录存在
    logo_dir = "static/uploads/team_logos"
    os.makedirs(logo_dir, exist_ok=True)
    
    # 预定义的颜色方案
    color_schemes = [
        {'background': (240, 248, 255), 'circle': (100, 149, 237), 'border': (70, 130, 180), 'text': (255, 255, 255)},  # 蓝色系
        {'background': (255, 248, 220), 'circle': (255, 165, 0), 'border': (255, 140, 0), 'text': (255, 255, 255)},      # 橙色系
        {'background': (240, 255, 240), 'circle': (34, 139, 34), 'border': (0, 100, 0), 'text': (255, 255, 255)},        # 绿色系
        {'background': (255, 240, 245), 'circle': (199, 21, 133), 'border': (139, 0, 139), 'text': (255, 255, 255)},     # 紫色系
        {'background': (255, 245, 238), 'circle': (220, 20, 60), 'border': (139, 0, 0), 'text': (255, 255, 255)},        # 红色系
        {'background': (245, 245, 245), 'circle': (105, 105, 105), 'border': (64, 64, 64), 'text': (255, 255, 255)},     # 灰色系
        {'background': (255, 250, 240), 'circle': (218, 165, 32), 'border': (184, 134, 11), 'text': (255, 255, 255)},    # 金色系
    ]
    
    # 队伍名称列表
    team_names = [
        "极客先锋", "黑客联盟", "代码猎人", "数字战士", "算法大师",
        "网络守护", "数据魔术师", "云端行者", "智能工匠", "代码诗人",
        "数字艺术家", "算法猎人", "网络骑士", "数据科学家", "智能建筑师",
        "代码炼金师", "数字探险家", "算法工程师", "网络工程师", "数据工程师",
        "智能工程师", "代码工程师", "数字工程师", "算法科学家", "网络科学家",
        "数据艺术家", "智能科学家", "代码科学家", "数字科学家", "算法艺术家",
        "网络艺术家", "数据猎人", "智能猎人"
    ]
    
    print("🎨 开始生成团队logo...")
    
    # 为每个队伍生成logo
    for i, team_name in enumerate(team_names, 1):
        filename = os.path.join(logo_dir, f"team_{i:03d}.png")
        color_scheme = random.choice(color_schemes)
        create_team_logo(team_name, filename, color_scheme)
    
    print(f"\n🎉 完成！共生成 {len(team_names)} 张logo")
    print(f"📁 保存位置: {os.path.abspath(logo_dir)}")

if __name__ == "__main__":
    main()
