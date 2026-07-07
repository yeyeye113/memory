---
name: experience-feedback
description: 经验回流系统 — 自动提炼教训、置信度追踪、决策档案
metadata:
  node_type: memory
  type: feedback
  originSessionId: current
---

# 经验回流系统

让经验自动累积，影响下次决策。

## 1. 自动提炼规则

每次会话结束前：
1. 回顾关键决策
2. 提炼 1-3 条非显而易见的经验
3. 分类：错误教训 / 有效模式 / 新发现
4. 写入 session-learnings.md
5. 重要发现 → 同步到 knowledge-graph.md

## 2. 置信度校准

| 置信度区间 | 含义 | 行为 |
|-----------|------|------|
| 0.9-1.0 | 非常确定 | 直接执行 |
| 0.7-0.9 | 比较确定 | 执行，简要说明理由 |
| 0.5-0.7 | 有把握但不确定 | 执行，列出风险 |
| 0.3-0.5 | 不太确定 | 询问用户 |
| 0.0-0.3 | 非常不确定 | 建议用户自己判断 |

## 3. 自动学习触发器

| 触发事件 | 学习动作 |
|---------|---------|
| 用户纠正了 AI 的错误 | 提炼错误模式 → error-patterns.md |
| 用户确认了好方案 | 提炼有效模式 → effective-patterns.md |
| 预测被验证 | 更新置信度档案 |
| 新项目启动 | 更新 knowledge-graph.md |
| 新技术发现 | 更新 AI 记事本 + knowledge-graph.md |

## 更新规则

- 每次会话 → 提炼经验写入 session-learnings.md
- 每月 → 审计校准度

**Related:** [[session-learnings]] [[knowledge-graph]] [[metacognition]]
