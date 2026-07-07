---
name: metacognition
description: 元认知系统 — 自评分机制、知识缺口检测、表现评估
metadata:
  node_type: memory
  type: meta
  originSessionId: current
---

# 元认知系统

让 AI 知道自己"知道什么、不知道什么"，并通过自评分驱动持续优化。

## 1. 知识缺口检测

| 日期 | 问题 | 领域 | 状态 | 解决方案 |
|------|------|------|------|----------|

（暂无活跃缺口）

## 2. 已解决缺口

| 日期 | 问题 | 领域 | 解决方案 |
|------|------|------|----------|
| 2026-06-26 | Hook 配置丢失修复 | Claude Code | 添加备份检查 |

## 3. 知识边界（最后更新 2026-06-26）

| 领域 | 深度 | 证据 |
|------|------|------|
| Claude Code hooks | 中 | 成功配置 Stop hook，但曾反复犯 schema 格式错误 |
| Vibe Coding 风格 | 中 | 用户确认，已在 CLAUDE.md 中定义 |
| AI 记事本结构 | 中 | 创建并使用 |
| 知识图谱理论 | 中 | 构建了图谱系统 |
| Memory 系统运维 | 深 | 多次清理+去重+重构，踩过多个坑 |

## 4. 错误档案

| 日期 | 错误 | 原因 | 修正 |
|------|------|------|------|
| 2026-06-25 | Hook 配置丢失 | settings.json 被外部重置 | 添加备份检查 |
| 2026-06-25 | Puppeteer Chrome 未安装 | 假设已安装 | 先检查再使用 |

## 更新规则

- 每次会话 → 更新知识缺口、错误档案
- 每月 → 更新知识边界

**Related:** [[experience-feedback]] [[knowledge-graph]] [[session-learnings]]
