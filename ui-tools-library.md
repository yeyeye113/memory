---
name: ui-tools-library
description: 前端 UI 优化工具库，包含 Tailwind/DaisyUI/Framer Motion/Zustand 等高星库
metadata: 
  node_type: memory
  type: reference
  originSessionId: 87f81377-3be0-4fed-9996-797822d93d63
---

# UI 优化工具库

路径：`C:\Users\眠\.claude\ui-tools\`

## 已安装核心库

| 类别 | 库 | 用途 |
|---|---|---|
| CSS框架 | Tailwind CSS, DaisyUI, Radix UI | 样式 + 组件 |
| 动画 | Framer Motion, GSAP, tw-animate-css | 交互动画 |
| 状态 | Zustand, Jotai, ahooks | 状态管理 |
| 表单 | React Hook Form, Zod | 表单验证 |
| 图标 | Lucide React | 图标库 |
| 通知 | Sonner, React Hot Toast | Toast提示 |
| 拖拽 | @dnd-kit | 拖拽排序 |
| 虚拟列表 | @tanstack/react-virtual | 大列表优化 |
| 代码高亮 | Prism React Renderer | 代码展示 |

## 快速使用

```jsx
// 状态管理
import { create } from 'zustand'

// 动画
import { motion } from 'framer-motion'

// 类名合并
import { cn } from 'clsx'
```

**Why:** 为主人优化前端 UI 时快速调用，不需要每次重新安装
**How to apply:** 直接 require/import 使用，或参考 README.md 示例