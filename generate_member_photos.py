#!/usr/bin/env python3
"""
生成75张成员照片
使用PIL库创建简单的300x400px PNG图片
"""

from PIL import Image, ImageDraw, ImageFont
import os
import random

def create_member_photo(member_name, filename, color_scheme):
    """创建成员照片"""
    # 创建300x400的图片
    img = Image.new('RGBA', (300, 400), color_scheme['background'])
    draw = ImageDraw.Draw(img)
    
    # 绘制头像圆形区域
    circle_bbox = (50, 50, 250, 250)
    draw.ellipse(circle_bbox, fill=color_scheme['avatar'])
    draw.ellipse(circle_bbox, outline=color_scheme['border'], width=3)
    
    # 绘制头像内的字母（姓名首字母）
    avatar_center_x = 150
    avatar_center_y = 150
    avatar_radius = 100
    
    # 获取姓名首字母
    first_char = member_name[0] if member_name else 'M'
    
    try:
        # 根据姓名长度调整字体大小
        font_size = 80
        font = ImageFont.truetype("/System/Library/Fonts/PingFang.ttc", font_size)
    except:
        try:
            font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 80)
        except:
            font = ImageFont.load_default()
    
    # 计算文字位置（居中）
    bbox = draw.textbbox((0, 0), first_char, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    x = avatar_center_x - text_width // 2
    y = avatar_center_y - text_height // 2
    
    # 绘制头像内的文字
    draw.text((x, y), first_char, fill=color_scheme['text'], font=font)
    
    # 绘制姓名
    try:
        name_font_size = 24
        name_font = ImageFont.truetype("/System/Library/Fonts/PingFang.ttc", name_font_size)
    except:
        try:
            name_font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 24)
        except:
            name_font = ImageFont.load_default()
    
    # 计算姓名位置（居中）
    name_bbox = draw.textbbox((0, 0), member_name, font=name_font)
    name_width = name_bbox[2] - name_bbox[0]
    name_x = (300 - name_width) // 2
    name_y = 320
    
    # 绘制姓名
    draw.text((name_y, name_y), member_name, fill=color_scheme['name'], font=name_font)
    
    # 保存图片
    img.save(filename, 'PNG')
    print(f"✅ 创建照片: {filename}")

def main():
    """主函数"""
    # 确保目录存在
    photo_dir = "static/uploads/member_photos"
    os.makedirs(photo_dir, exist_ok=True)
    
    # 预定义的颜色方案
    color_schemes = [
        {'background': (240, 248, 255), 'avatar': (100, 149, 237), 'border': (70, 130, 180), 'text': (255, 255, 255), 'name': (70, 130, 180)},  # 蓝色系
        {'background': (255, 248, 220), 'avatar': (255, 165, 0), 'border': (255, 140, 0), 'text': (255, 255, 255), 'name': (255, 140, 0)},      # 橙色系
        {'background': (240, 255, 240), 'avatar': (34, 139, 34), 'border': (0, 100, 0), 'text': (255, 255, 255), 'name': (0, 100, 0)},        # 绿色系
        {'background': (255, 240, 245), 'avatar': (199, 21, 133), 'border': (139, 0, 139), 'text': (255, 255, 255), 'name': (139, 0, 139)},     # 紫色系
        {'background': (255, 245, 238), 'avatar': (220, 20, 60), 'border': (139, 0, 0), 'text': (255, 255, 255), 'name': (139, 0, 0)},        # 红色系
        {'background': (245, 245, 245), 'avatar': (105, 105, 105), 'border': (64, 64, 64), 'text': (255, 255, 255), 'name': (64, 64, 64)},     # 灰色系
        {'background': (255, 250, 240), 'avatar': (218, 165, 32), 'border': (184, 134, 11), 'text': (255, 255, 255), 'name': (184, 134, 11)},    # 金色系
    ]
    
    # 成员姓名列表（从数据库查询结果整理）
    member_names = [
        "张伟", "李娜", "王强", "陈明", "刘芳", "赵磊", "孙丽", "周杰", "吴斌", "郑华",
        "冯敏", "朱涛", "何超", "林静", "罗浩", "梁燕", "宋伟", "谢军", "唐磊", "韩雪",
        "董强", "袁杰", "潘丽", "蒋斌", "韦敏", "傅涛", "沈超", "卢浩", "姚燕", "方伟",
        "石军", "崔雪", "谭磊", "陆敏", "汪强", "范杰", "江斌", "钱敏", "田涛", "史超",
        "白燕", "邹浩", "孟雪", "毛伟", "尹军", "贾磊", "夏敏", "钟强", "黎杰", "易雪",
        "武斌", "贺敏", "常涛", "龙超", "段浩", "雷燕", "侯伟", "万军", "段雪", "汤磊",
        "向敏", "古强", "文杰", "乐斌", "关敏", "莫涛", "房超", "喻雪", "水浩", "窦燕",
        "章伟", "云军", "苏磊", "葛敏", "奚强"
    ]
    
    print("📸 开始生成成员照片...")
    
    # 为每个成员生成照片
    for i, member_name in enumerate(member_names, 1):
        filename = os.path.join(photo_dir, f"member_{i:03d}.png")
        color_scheme = random.choice(color_schemes)
        create_member_photo(member_name, filename, color_scheme)
    
    print(f"\n🎉 完成！共生成 {len(member_names)} 张成员照片")
    print(f"📁 保存位置: {os.path.abspath(photo_dir)}")

if __name__ == "__main__":
    main()
