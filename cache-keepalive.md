---
name: cache-keepalive
description: 缓存保温心跳 — 每 4 分钟保活 prompt cache，防 5 分钟 TTL 过期，目标 85%+ 命中率
metadata: 
  node_type: memory
  type: reference
  originSessionId: b905e1d2-ddd9-428d-9595-9f44d7b9a656
---

**部署规则：**
- 每次新会话开始时用 `CronList` 检查，无心跳则立即 `CronCreate`
- 频率: `*/4 * * * *`（4 分钟一次，留 1 分钟安全垫）
- 模式: session-only（会话关闭自动停止），7 天过期
- 心跳内容: 轻量文字 ping，不做实质计算

**成本:**
- 每次心跳 ~50-80 新 token（其余缓存命中免费）
- 省掉每次冷启动 ~24K token 惩罚

**Related:** [[vibe-coding-style]]
