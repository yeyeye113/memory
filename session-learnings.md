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

- [2026-06-25] settings.json 被外部重置 — 丢失 hooks 配置，需备份检查
- [2026-06-25] Puppeteer 没装 Chrome — 要截图先 npx puppeteer browsers install chrome
- [2026-06-26] 脏数据污染 — 51%准确率的交易预测数据要果断删
- [2026-06-26] hooks 格式 — 必须是 `{matcher, hooks:[...]}` 嵌套
- [2026-06-26] 死链误判 — `../Desktop/xxx.md` 跨目录引用不算死链，排除含 `..` 的路径

## 有效模式 (从成功中学)

<!-- 格式: - [日期] 场景 → 什么好使 → 为什么 -->

- [2026-06-19] 并行创建独立文件 — 3个memory文件+2个skill同时写，省一半时间（已提炼→P001）
- [2026-06-19] 先建数据结构(memory)→再建触发器(hook)→最后建接口(skill)，依赖清晰
- [2026-06-26] 四系统并行构建 — 知识图谱+经验回流+元认知+记事本规范同时写，3轮完成（已提炼→P005）
- [2026-07-06] GLogger架构 — 静态类用单例+静态方法暴露，init()在main()最早调用用async，catch住永不阻启动；isolate写文件+NDJSON格式

## 更新规则

每次会话结束前（或 `/self-review` 时），追加 1-3 条：
- 只记**非显而易见**的经验（不记"要写分号"这种）
- 优先记：哪里卡了、什么解法出乎意料、主人纠正了什么
- 每条一行，不超过 80 字

**Related:** [[effective-patterns]] [[experience-feedback]] [[metacognition]]
