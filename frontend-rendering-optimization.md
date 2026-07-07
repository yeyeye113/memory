---
name: frontend-rendering-optimization
description: 前端渲染流水线与美术优化系统知识 — CSS/JS/图片/字体/动画全覆盖
metadata:
  node_type: memory
  type: reference
  originSessionId: current
---

# 前端渲染与美术优化

## 核心模型：像素渲染流水线

```
JS → Style → Layout → Paint → Composite
 5阶段，每帧预算16.6ms（实际可用~10ms）
```

### 三种路径

| 路径 | 经过 | 速度 | 触发 |
|------|------|------|------|
| 完整 | JS→Style→Layout→Paint→Composite | 🐢 | 几何属性（width/height/top/left） |
| 跳过布局 | JS→Style→Paint→Composite | 🏃 | 绘制属性（color/box-shadow/background） |
| 仅合成 | JS→Style→Composite | ⚡ | 合成属性（transform/opacity） |

**黄金法则**：动画只动 `transform` 和 `opacity`，保持在合成阶段。

## CSS 优化速查

### 高性能（仅 Composite）
`transform`, `opacity`

### 中性能（Paint，跳过 Layout）
`color`, `background-color`, `box-shadow`, `visibility`

### 低性能（完整 Layout + Paint，避免动画中用）
`width/height`, `top/left/right/bottom`, `margin/padding`, `font-size`, `position`

### 关键属性
- `will-change: transform, opacity` — 提前创建合成层（≤5-6个）
- `contain: layout style paint` — 限制渲染范围
- `content-visibility: auto` — 跳屏外渲染
- `backface-visibility: hidden` — 层优化

## JS 优化

### 布局抖动（Layout Thrashing）
```js
// ❌ 读写交替 → 反复重排
items[i].style.width = box.offsetWidth + 'px';
// ✅ 先批量读，再批量写
const widths = items.map(el => el.offsetWidth);
items.forEach((el, i) => el.style.width = widths[i] + 'px');
```

### 动画驱动
- `requestAnimationFrame` 替代 setTimeout/setInterval
- 虚拟滚动：TanStack Virtual、react-window
- 重计算卸载到 Web Worker

## 图片优化

### 格式选择
| 格式 | 场景 | 压缩率 |
|------|------|--------|
| AVIF | 照片（最佳） | ⭐⭐⭐⭐⭐ |
| WebP | 通用推荐 | ⭐⭐⭐⭐ |
| JPEG | 照片（兼容） | ⭐⭐⭐ |
| SVG | 图标/Logo | 矢量无损 |

### 响应式图片
```html
<picture>
  <source srcset="photo.avif" type="image/avif">
  <source srcset="photo.webp" type="image/webp">
  <img src="photo.jpg" width="800" height="600" alt="格式降级">
</picture>
```

### 懒加载规则
- 关键图片：`loading="eager" fetchpriority="high"`
- 非关键图片：`loading="lazy"`
- 始终设置 `width`/`height` 防 CLS

## 字体优化
- `font-display: swap` — 先系统字体，加载后替换
- WOFF2 格式（比 TTF/OTF 小 30%+）
- `<link rel="preload" as="font" type="font/woff2" crossorigin>`
- 子集化：`unicode-range`

## 动画方案对比
| 方案 | 性能 | 场景 |
|------|------|------|
| CSS @keyframes + transform/opacity | ⭐⭐⭐⭐⭐ | 简单过渡/微交互 |
| CSS transition | ⭐⭐⭐⭐⭐ | 状态切换 |
| Web Animations API | ⭐⭐⭐⭐ | JS控制复杂动画 |
| requestAnimationFrame | ⭐⭐⭐ | 物理动画/滚动驱动 |
| GSAP / Framer Motion | ⭐⭐⭐⭐ | 复杂编排 |
| Lottie | ⭐⭐⭐⭐ | AE导出动画 |

## Core Web Vitals（2024+）
| 指标 | 目标 |
|------|------|
| LCP（最大内容绘制）| < 2.5s |
| INP（交互到下次绘制）| < 200ms |
| CLS（累积布局偏移）| < 0.1 |

## 工具
- Chrome DevTools Performance — 逐帧分析
- Chrome DevTools Layers — 合成层检查
- Lighthouse — 综合审计
- WebPageTest — 真实环境

## 2025趋势
- React Server Components / PPR
- Islands Architecture（Astro）
- Edge SSR / Streaming SSR
- WebAssembly（计算密集任务）
