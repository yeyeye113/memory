---
name: knowledge-graph
description: 知识图谱索引 — 所有知识源的关联关系，支持跨域查询
metadata:
  type: reference
  originSessionId: current
---

# 知识图谱

所有知识节点及其关联关系。回答问题时先查此图谱，拉出相关节点。

## 节点索引

### Memory 文件
| 节点 ID | 文件 | 核心主题 | 标签 |
|---------|------|---------|------|
| M01 | vibe-coding-style.md | 编码风格、工作偏好 | coding, preference, workflow |
| M02 | cache-keepalive.md | 4分钟保活心跳 | infrastructure, heartbeat |
| M03 | session-learnings.md | 会话经验索引 | learning, meta |
| M04 | error-patterns.md | 常犯错误模式 | debugging, correction |
| M05 | effective-patterns.md | 高效工作模式 | productivity, pattern |
| M06 | knowledge-graph.md | 本文件 — 知识关联 | meta, index |
| M07 | experience-feedback.md | 经验回流 + 置信度追踪 | learning, calibration |
| M08 | metacognition.md | 元认知 — 知识缺口+表现 | meta, self-awareness |
| M09 | notepad-schema.md | AI 记事本结构定义 | notepad, schema |

### AI 记事本条目 (~/Desktop/AI记事本.md)
| 节点 ID | 条目 | 分类 | 标签 |
|---------|------|------|------|
| N01 | Hook stdin/stdout JSON 协议 | 技术方案 | hook, protocol, automation |
| N02 | UI Showcase 15种效果 | 技术方案 | ui, css, showcase |
| N03 | Python subprocess UTF-8 | 工具推荐 | python, encoding, windows |
| N04 | OKLCH/OKLAB 颜色空间 | 工具推荐 | css, color, standard |
| N05 | 自迭代五层模型 | 灵感闪念 | architecture, evolution, meta |

### 项目
| 节点 ID | 项目 | 路径 | 标签 |
|---------|------|------|------|
| P01 | ai漫剧 | ~/Desktop/ai漫剧/ | manga, ai, production |
| P02 | aif辅助 | ~/Desktop/aif辅助/ | agents, skills, workflow |

## 关联边

### 技术关联
- M01 (vibe-coding) → N01 (hook协议): hook 是 vibe coding 自动化的基础设施
- M01 (vibe-coding) → N03 (subprocess): 编码风格中的 Python 实践
- N01 (hook协议) → M02 (cache-keepalive): hook 保活机制依赖 JSON 协议
- N04 (OKLCH) → N02 (UI Showcase): 颜色空间是 UI 效果的底层标准
- N05 (五层模型) → M06 (知识图谱): 五层模型是知识图谱的理论基础

### 学习关联
- M03 (session-learnings) → M04 (error-patterns): 教训提炼为错误模式
- M03 (session-learnings) → M05 (effective-patterns): 成功经验提炼为高效模式
- M07 (experience-feedback) → M03 (session-learnings): 回流系统扩展学习索引
- M08 (metacognition) → M07 (experience-feedback): 元认知依赖置信度数据

### 基础设施关联
- M02 (cache-keepalive) → M01 (vibe-coding): 保活是持续工作的前提
- M09 (notepad-schema) → AI记事本.md: 定义记事本的结构规范

## 查询模板

### "X 相关的一切"
1. 在节点索引中搜索 X 的标签
2. 沿关联边找到所有相关节点
3. 综合所有节点信息回答

### "我之前做过 Y 吗"
1. 搜索所有节点的描述和标签
2. 检查关联边是否有 Y 的记录
3. 返回相关节点和证据

### "Z 和 W 有什么关系"
1. 找到 Z 和 W 的节点
2. 沿关联边 BFS 搜索路径
3. 返回最短关联链

## 更新规则

- 新增 memory 文件时 → 添加节点 + 关联边
- 新增记事本条目时 → 添加节点 + 自动打标签
- 发现新的关联时 → 添加边
- 每月审计一次 → 清理过期节点

**Related:** [[session-learnings]] [[experience-feedback]] [[metacognition]]
