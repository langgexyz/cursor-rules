# Cursor Rules - 团队统一规范

极简规范库，3个核心文件，层次分明。所有规范统一放在 `cursor-rules/` 文件夹。

## 📦 文件说明

| 文件 | 说明 | 适用范围 |
|------|------|---------|
| `core-rules.mdc` | 核心原则 - AI工作哲学 | 所有项目通用 |
| `workflow-rules.mdc` | 工作流程 - 具体方法论 | 所有项目通用 |
| `tech-rules.mdc` | 技术规范 - 编码标准 | 所有项目通用 |
| `project-spec.template.mdc` | 项目规范模板（抽象框架） | 复制到根目录使用 |
| `.cursorrules` | Cursor 入口文件 | 每个项目一份 |
| `init.sh` | 🆕 一键初始化脚本 | 快速配置规范 |

## 📖 规范结构

```
核心原则（core-rules.mdc）
    ↓ 指导
工作流程（workflow-rules.mdc）
    ↓ 约束
技术规范（tech-rules.mdc）
    ↓ 应用
项目规范（project-spec.mdc）
```

## 🚀 快速开始

### 🎯 一键初始化（推荐）

```bash
# 方式1：在项目根目录执行
bash cursor-rules/init.sh

# 方式2：进入 cursor-rules 文件夹执行
cd cursor-rules && bash init.sh
```

脚本会自动：
1. 复制 `.cursorrules` 到项目根目录
2. 复制 `project-spec.template.mdc` 为 `project-spec.mdc`
3. 如果文件已存在，会提示是否覆盖

### 📦 安装到新项目

#### 方案1：Git Submodule（推荐）

```bash
# 1. 添加规范库为子模块
git submodule add <repo-url> cursor-rules

# 2. 运行初始化脚本
bash cursor-rules/init.sh

# 3. 编辑项目规范
vim project-spec.mdc  # 填写你的项目信息

# 4. 更新规范时
git submodule update --remote cursor-rules
```

#### 方案2：直接复制

```bash
# 1. 复制整个 cursor-rules 文件夹到项目
cp -r cursor-rules /path/to/your/project/

# 2. 运行初始化脚本
bash cursor-rules/init.sh

# 3. 编辑项目规范
vim project-spec.mdc
```

### 文件结构

```
your-project/
├── cursor-rules/           # 规范文件夹（submodule 或复制）
│   ├── .cursorrules       # Cursor 入口文件（需复制到根目录）
│   ├── core-rules.mdc
│   ├── workflow-rules.mdc
│   ├── tech-rules.mdc
│   └── project-spec.template.mdc
├── .cursorrules           # 复制自 cursor-rules/.cursorrules
├── project-spec.mdc       # 复制自 template 并编辑
└── ...
```

## 📝 规范内容

### core-rules.mdc（核心原则）
- AI工作哲学："用户很懒"理念
- 六大原则：主动性、完整性、透明性、责任感、结果导向、规则优先
- 禁止的工作模式
- AI的工作职责

### workflow-rules.mdc（工作流程）
- Bug排查流程（逐层验证法）
- 代码修改流程（5层完整性检查）
- 验证流程（优先级和输出格式）
- Git工作流（边改边暂存）
- Git提交规范（原子提交）
- 代码质量标准

### tech-rules.mdc（技术规范）
- TypeScript类型安全规范
- React开发规范
- API设计规范
- 测试规范
- 性能优化规范
- 安全规范

### project-spec.template.mdc（项目模板）
- 项目概述
- 技术栈配置
- 开发环境
- 业务规则
- 数据结构
- 部署流程

## 🔄 更新规范

当规范有更新时，各项目同步最新版本即可。

## 📌 版本管理

使用 Git 标签管理版本：
```bash
git tag v1.0.0 -m "初始版本"
git tag v2.0.0 -m "重构：按层次划分为3个文件"
```

## 💡 最佳实践

1. **通用规范不要改** - core-rules.mdc、workflow-rules.mdc、tech-rules.mdc 保持一致
2. **项目规范独立维护** - 每个项目的 project-spec.mdc 自己维护
3. **入口文件放根目录** - .cursorrules 必须在项目根目录，Cursor 才能识别
4. **定期同步更新** - 规范有更新时，及时同步到各项目
5. **理解层次关系** - 核心原则 → 工作流程 → 技术规范，层层递进

## 🆚 v2.0 重构说明

**v1.0 结构**（有边界模糊问题）：
```
core-rules.mdc (AI原则 + Git规范 + 代码质量)
dev-rules.mdc  (Bug排查 + 验证 + TypeScript + React + API...)
```

**v2.0 结构**（清晰的层次划分）：
```
core-rules.mdc     (核心原则 - 不变的哲学)
workflow-rules.mdc (工作流程 - 做事方法)
tech-rules.mdc     (技术规范 - 编码标准)
```

**改进**：
- 职责单一：每个文件只关注一个层面
- 边界清晰：不再有内容重复和交叉
- 易于维护：修改技术规范不影响核心原则
- 易于扩展：新增技术栈只需修改 tech-rules.mdc
