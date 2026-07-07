---
name: future-sim-project
description: 未来模拟引擎项目配置（端口、API、依赖）
metadata:
  type: project
---

# 未来模拟引擎项目

**项目路径**: `e:/lixian/future-sim`
**端口**: 3000
**框架**: Vite + React + TypeScript + Tailwind CSS

## 关键配置

### vite.config.ts
```typescript
server: {
  port: 3000,
  host: true,
  open: true
}
```

### 已知问题修复
- `npm install esbuild --save-dev` 解决构建时 esbuild 缺失问题

## 组件扩展
- Button 组件支持 `loading` prop（带旋转图标）

## i18n 翻译
- 3种语言：en-US、ja-JP、ko-KR
- 支付页面关键 key：`pay.paid`、`pay.expired`、`pay.scanning`、`pay.scanReminder`、`recharge.choosePlan`

## 启动命令
```bash
cd e:/lixian/future-sim && npm run dev
```

**Why:** 项目启动后可能需要快速定位配置和修复历史
**How to apply:** 端口冲突时修改 vite.config.ts；i18n 翻译问题查看 messages/*.ts
