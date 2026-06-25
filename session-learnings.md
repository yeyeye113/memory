---
name: session-learnings
description: 会话经验捕获索引 — 每次会话提炼的教训和有效模式
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1ef24354-42e5-4724-b8e6-753ef7c99bf1
---

# 会话经验库

每次会话结束时提炼 1-3 条关键经验，分两类记录。

## 错误教训 (从失败中学)

<!-- 格式: - [日期] 场景 → 错误行为 → 正确做法 -->

- [2026-06-19] 初始化 — 尚无历史教训，待积累
- [2026-06-19] 自迭代构建 — hook 的 stdin/stdout JSON 协议：读 stdin→处理→print JSON→exit 0
- [2026-06-19] 自迭代构建 — 先审现状（Glob 全目录）再动手，避免盲目建重复的东西
- [2026-06-19] Windows Python 脚本 — emoji 在 gbk 终端报 UnicodeEncodeError，用 ASCII 字符替代
- [2026-06-25] settings.json 可能被外部重置 — 丢失 hooks/UserPromptSubmit/Stop 配置，Notification 恢复了但其他没配
- [2026-06-25] Puppeteer 没装 Chrome 不可用 — 要截图先 npx puppeteer browsers install chrome
- [2026-06-26] 交易预测数据被污染 — 51%准确率的脏数据要果断删，不保留垃圾知识

## 有效模式 (从成功中学)

<!-- 格式: - [日期] 场景 → 什么好使 → 为什么 -->

- [2026-06-19] 初始化 — 尚无成功模式，待积累
- [2026-06-19] 并行创建独立文件 — 3个memory文件+2个skill同时写，省一半时间
- [2026-06-19] 先建数据结构(memory)→再建触发器(hook)→最后建接口(skill)，依赖清晰
- [2026-06-26] 四系统并行构建 — 知识图谱+经验回流+元认知+记事本规范同时写，3轮完成

## 更新规则

每次会话结束前（或 `/self-review` 时），追加 1-3 条：
- 只记**非显而易见**的经验（不记"要写分号"这种）
- 优先记：哪里卡了、什么解法出乎意料、主人纠正了什么
- 每条一行，不超过 80 字

**Related:** [[vibe-coding-style]] [[cache-keepalive]] [[experience-feedback]] [[metacognition]]
