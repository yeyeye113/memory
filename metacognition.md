---
name: metacognition
description: 元认知系统 — 知识缺口检测、表现评估、自我意识
metadata:
  type: meta
  originSessionId: current
---

# 元认知系统

让 AI 知道自己"知道什么、不知道什么"。

## 1. 知识缺口检测

记录用户问了但 AI 没有相关信息的问题：

```yaml
# 知识缺口格式
- id: G001
  date: 2026-06-26
  question: "用户问了 X，但我没有相关信息"
  domain: "trading | coding | architecture | tools | ..."
  priority: high | medium | low
  status: open | learning | resolved
  resolution: "补充了什么知识"
  resolved_date: 2026-07-01
```

### 缺口优先级规则

| 优先级 | 条件 | 行为 |
|--------|------|------|
| high | 用户反复问同一领域 | 立即补充知识 |
| medium | 问了一次但很关键 | 下次会话前补充 |
| low | 问了一次但不太重要 | 积累到 5 个再批量补充 |

## 2. 表现评估

### 周度统计

```yaml
# 每周自动生成
week: 2026-W26
metrics:
  total_queries: 0
  corrected_by_user: 0  # 被用户纠正的次数
  correct_predictions: 0  # 预测正确的次数
  wrong_predictions: 0  # 预测错误的次数
  knowledge_gaps_found: 0  # 发现的知识缺口
  knowledge_gaps_filled: 0  # 填补的知识缺口
  avg_confidence: 0.0  # 平均置信度
  actual_accuracy: 0.0  # 实际准确率
```

### 趋势分析

```yaml
# 每月汇总
month: 2026-06
trend:
  accuracy_change: +5%  # 准确率变化
  confidence_calibration: improving | stable | degrading
  top_gap_domain: "trading"  # 知识缺口最多的领域
  top_strength_domain: "coding"  # 表现最好的领域
```

## 3. 自我意识清单

### 我知道什么（知识边界）

| 领域 | 深度 | 最后更新 | 证据 |
|------|------|---------|------|
| Claude Code 配置 | 深 | 2026-06-26 | 多次成功配置 hooks |
| Vibe Coding 风格 | 深 | 2026-06-19 | 用户确认 |
| AI 记事本结构 | 中 | 2026-06-25 | 创建并使用 |
| 知识图谱理论 | 中 | 2026-06-26 | 构建了图谱系统 |

### 我不知道什么（知识缺口）

| 领域 | 缺口描述 | 优先级 | 状态 |
|------|---------|--------|------|
| *暂无记录* | | | |

### 我做错了什么（错误档案）

| 日期 | 错误 | 原因 | 修正 |
|------|------|------|------|
| 2026-06-25 | Hook 配置丢失 | settings.json 被外部重置 | 添加备份检查 |
| 2026-06-25 | Puppeteer Chrome 未安装 | 假设已安装 | 先检查再使用 |

## 4. 置信度校准器

定期检查：AI 的置信度 vs 实际准确率

```python
# 校准度计算
calibration_gap = avg_confidence - actual_accuracy

if calibration_gap > 0.1:
    print("⚠️ 过度自信：置信度比实际高 10%+，需要下调")
elif calibration_gap < -0.1:
    print("⚠️ 过度谦虚：置信度比实际低 10%+，可以上调")
else:
    print("✅ 校准良好：置信度和实际基本匹配")
```

## 5. 自动学习循环

```
每次会话
  → 检测知识缺口（用户问了但我不知道）
  → 记录错误（用户纠正了我）
  → 更新置信度（预测验证结果）
  → 更新知识边界（学到新东西）
  → 每周生成表现报告
  → 每月调整置信度校准
```

## 更新规则

- 每次会话 → 更新知识缺口、错误档案
- 每周 → 生成表现统计
- 每月 → 调整置信度校准、更新知识边界

**Related:** [[experience-feedback]] [[knowledge-graph]] [[session-learnings]]
