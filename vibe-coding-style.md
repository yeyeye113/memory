---
name: vibe-coding-style
description: 用户的编码风格和工作偏好 — Vibe Coding 模式
metadata: 
  node_type: memory
  type: user
  originSessionId: 840ffbbf-47ac-430b-9cd7-3b7869397988
---

用户采用 **Vibe Coding** 工作模式：快速迭代、原型驱动、信任 AI 做技术决策。

**偏好：**
- 中文注释，英文代码
- 函数式优先，按需 OOP
- 语义化命名，不打缩写
- Prettier 默认风格（2 空格、单引号）
- Conventional commits（feat:/fix:/chore:）
- 新项目 Vite + TypeScript，后端 Node.js/Bun，数据库 SQLite/PostgreSQL
- UI：React + Tailwind CSS

**行为准则：**
- 能直接写代码就别长篇解释
- 一次生成完整可运行的代码，不要留 TODO
- 发现问题直接修，不用先请示
- 独立文件操作尽量并行

使用 CC Switch 代理（127.0.0.1:15721）路由到 DeepSeek V4 后端。
