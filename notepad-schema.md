---
name: notepad-schema
description: AI 记事本结构定义 — 自动分类、关联、衰减的规范
metadata:
  node_type: memory
  type: reference
  originSessionId: current
---

# AI 记事本结构定义

定义 AI 记事本的分类体系和结构规范。

## 分类体系

### 一级分类

| 分类 | 说明 | 条目类型 |
|------|------|---------|
| 技术方案 | 具体实现方案、代码思路、解决方案 | hook、协议、算法、架构 |
| 产品方向 | 产品策略、用户需求、商业模式 | 需求、策略、竞品 |
| 架构设计 | 系统架构、模块划分、技术选型 | 框架、模式、选型 |
| 工具推荐 | 好用的工具、库、框架、服务 | 库、工具、服务、技巧 |
| 学习计划 | 要学的技术、要看的资料、要研究的领域 | 课程、文章、研究 |
| 灵感闪念 | 未成型的想法、有趣的联想、跨领域灵感 | 想法、类比、问题 |

### 二级标签（自动打标）

```yaml
# 标签体系
tags:
  # 技术领域
  - frontend    # 前端
  - backend     # 后端
  - ai          # AI/ML
  - devops      # 运维
  - database    # 数据库

  # 项目类型
  - hook        # Claude Code hook
  - automation  # 自动化
  - ui          # UI/UX
  - protocol    # 协议设计

  # 状态
  - proven      # 已验证有效
  - experimental # 实验中
  - archived    # 已归档

  # 关联
  - related:M01 # 关联到 memory 文件
  - related:N01 # 关联到其他记事本条目
```

## 条目格式

```markdown
### [YYYY-MM-DD HH:MM] 标题

**分类**: 技术方案/产品方向/架构设计/工具推荐/学习计划/灵感闪念
**标签**: tag1, tag2, tag3
**关联**: related:N01, related:M01
**置信度**: 0.XX (如果是决策类)
**状态**: proven/experimental/archived

内容描述...

**为什么好**: 好在哪里
**怎么用**: 具体使用场景
**复用**: 下次怎么触发
```

## 衰减机制

```yaml
# 衰减规则
decay_rules:
  - trigger: "30天未被引用"
    action: "标记为 archived"
    effect: "查询时降权 50%"

  - trigger: "60天未被引用"
    action: "移入归档区"
    effect: "不再主动展示"

  - trigger: "90天未被引用"
    action: "可选删除"
    effect: "仅保留备份"

# 引用计数
reference_count:
  - 每次被 memory 文件引用 → +1
  - 每次被会话中提及 → +1
  - 每次被关联到其他条目 → +1
```

## 冲突检测

```yaml
# 冲突规则
conflict_rules:
  - trigger: "新条目和旧条目在同一分类下描述相反"
    action: "标记冲突，提醒用户"
    format: "⚠️ 冲突: 新条目 'X' 和旧条目 'Y' 描述矛盾，请确认"

  - trigger: "新条目标记为 proven，但关联条目标记为 archived"
    action: "提示检查一致性"
    format: "⚠️ 一致性: 新条目 'X' 关联的 'Y' 已归档，请确认是否需要更新"
```

## 查询方式

- 按分类查：搜 `**分类**: 技术方案`
- 按标签查：搜 `tag1, tag2`
- 按时间查：搜 `### [2026-06-`
- 按状态查：搜 `**状态**: proven`
- 按关联查：搜 `related:N01`

## 更新规则

- 新增条目 → 自动打标签 + 检测冲突
- 每月 → 执行衰减机制
- 每季度 → 审计分类体系，调整标签

**Related:** [[knowledge-graph]]，对应文件: ~/Desktop/AI记事本.md
