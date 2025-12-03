#!/bin/bash

# Cursor Rules 初始化脚本
# 用途：在新项目中快速配置 Cursor AI 规范

set -e

echo "🚀 Cursor Rules 初始化脚本"
echo "================================"
echo ""

# 检测当前位置
if [ -f "core-rules.mdc" ]; then
    # 在 cursor-rules 文件夹内执行
    CURSOR_RULES_DIR="."
    PROJECT_ROOT=".."
    echo "📍 检测到在 cursor-rules 文件夹内执行"
else
    # 在项目根目录执行
    CURSOR_RULES_DIR="cursor-rules"
    PROJECT_ROOT="."
    echo "📍 检测到在项目根目录执行"
fi

# 检查是否存在 cursor-rules 文件夹
if [ ! -d "$CURSOR_RULES_DIR" ]; then
    echo "❌ 错误：找不到 cursor-rules 文件夹"
    echo "   请确保在项目根目录或 cursor-rules 文件夹内执行此脚本"
    exit 1
fi

echo ""
echo "📋 将要执行的操作："
echo "   1. 复制 .cursorrules 到项目根目录"
echo "   2. 复制 project-spec.template.mdc 到项目根目录"
echo "   3. 重命名为 project-spec.mdc"
echo ""

# 询问是否继续
read -p "是否继续？(y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ 已取消"
    exit 0
fi

echo ""
echo "开始初始化..."
echo ""

# 1. 复制 .cursorrules
if [ -f "$PROJECT_ROOT/.cursorrules" ]; then
    echo "⚠️  .cursorrules 已存在，是否覆盖？"
    read -p "   覆盖现有文件？(y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp "$CURSOR_RULES_DIR/.cursorrules" "$PROJECT_ROOT/.cursorrules"
        echo "✅ 已覆盖 .cursorrules"
    else
        echo "⏭️  跳过 .cursorrules"
    fi
else
    cp "$CURSOR_RULES_DIR/.cursorrules" "$PROJECT_ROOT/.cursorrules"
    echo "✅ 已创建 .cursorrules"
fi

# 2. 复制 project-spec.template.mdc
if [ -f "$PROJECT_ROOT/project-spec.mdc" ]; then
    echo "⚠️  project-spec.mdc 已存在，跳过创建"
    echo "   如需重新创建，请手动删除后重新运行脚本"
else
    cp "$CURSOR_RULES_DIR/project-spec.template.mdc" "$PROJECT_ROOT/project-spec.mdc"
    echo "✅ 已创建 project-spec.mdc"
fi

echo ""
echo "================================"
echo "✨ 初始化完成！"
echo ""
echo "📝 下一步："
echo "   1. 编辑 project-spec.mdc，填写项目信息"
echo "   2. 删除模板中的示例内容"
echo "   3. 删除不需要的章节"
echo ""
echo "💡 提示："
echo "   - project-spec.mdc 是给 AI 看的，写清楚核心信息即可"
echo "   - 可以根据项目需要自由增删章节"
echo ""
echo "🎉 开始愉快地使用 Cursor AI 吧！"

