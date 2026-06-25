---
name: experience-feedback
description: 经验回流系统 — 自动提炼教训、置信度追踪、决策档案
metadata:
  type: feedback
  originSessionId: current
---

# 经验回流系统

让经验自动累积，影响下次决策。

## 1. 会话结束自动提炼

每次会话结束前（或 `/self-review` 时），自动执行：

```
1. 回顾本轮会话的关键决策
2. 提炼 1-3 条非显而易见的经验
3. 分类：错误教训 / 有效模式 / 新发现
4. 写入 session-learnings.md
5. 如果是重要发现 → 同步到 knowledge-graph.md
```

## 2. 置信度追踪器

记录每个重要决策的置信度和结果：

```yaml
# 决策档案格式
- id: D001
  date: 2026-06-26
  context: "选择 Vite 作为前端框架"
  confidence: 0.85
  reasoning: "速度快、生态好、TypeScript 支持"
  outcome: success | failure | pending
  outcome_date: 2026-07-01
  outcome_evidence: "项目构建速度提升 3x"
  lesson: "Vite 确实比 Webpack 快很多"
```

### 置信度校准规则

| 置信度区间 | 含义 | 行为 |
|-----------|------|------|
| 0.9-1.0 | 非常确定 | 直接执行，不解释 |
| 0.7-0.9 | 比较确定 | 执行，简要说明理由 |
| 0.5-0.7 | 有把握但不确定 | 执行，列出风险 |
| 0.3-0.5 | 不太确定 | 询问用户，提供选项 |
| 0.0-0.3 | 非常不确定 | 建议用户自己判断 |

## 3. 决策档案

所有重要决策记录在这里，用于事后复盘：

<!-- 格式:
### D[编号] [决策标题]
- **日期**: YYYY-MM-DD
- **置信度**: 0.XX
- **决策内容**: 做了什么
- **结果**: success/failure/pending
- **教训**: 学到了什么
-->

*暂无记录，等待积累*

## 4. 自动学习触发器

当以下事件发生时，自动触发学习：

| 触发事件 | 学习动作 |
|---------|---------|
| 用户纠正了 AI 的错误 | 提炼错误模式 → error-patterns.md |
| 用户确认了一个好方案 | 提炼有效模式 → effective-patterns.md |
| 预测被验证正确 | 更新置信度档案 |
| 预测被验证错误 | 分析原因，降低类似预测的置信度 |
| 新项目启动 | 更新 knowledge-graph.md |
| 新技术发现 | 更新 AI 记事本 + knowledge-graph.md |

## 5. 置信度分数汇总

```yaml
# 累计统计
total_decisions: 0
by_outcome:
  success: 0
  failure: 0
  pending: 0
by_domain:
  coding: { total: 0, success: 0 }
  architecture: { total: 0, success: 0 }
  tools: { total: 0, success: 0 }
# 平均置信度
avg_confidence: 0.0
# 校准度 (平均置信度 vs 实际成功率)
calibration_gap: 0.0  # 正数=过度自信，负数=过度谦虚
```

## 更新规则

- 每次会话结束 → 追加决策记录
- 每周 → 更新置信度分数汇总
- 每月 → 审计校准度，调整置信度区间

**Related:** [[session-learnings]] [[knowledge-graph]] [[metacognition]]
