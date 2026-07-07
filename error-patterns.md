---
name: error-patterns
description: 常犯错误模式 — 自我纠正规则库，避免重复犯错
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1ef24354-42e5-4724-b8e6-753ef7c99bf1
---

# 错误模式库

记录我反复犯的错误和对应的纠正规则。

## 活跃规则

<!-- 格式:
### [编号] 错误模式
- **症状**: 怎么发现的
- **根因**: 为什么会犯
- **纠正**: 具体怎么做
-->

### [E001] 未验证就断言
- **症状**: 读了文件头部就下结论，忽略后续修改
- **根因**: 想省 token，跳过了完整验证
- **纠正**: 涉及文件状态的判断，用 Grep/Glob 验证，不靠记忆

### [E002] 重复读已知内容
- **症状**: 每次回答都重新读 CLAUDE.md 或已读过的文件
- **根因**: 缺乏"已读"意识
- **纠正**: 对话中已出现的内容直接引用，不重读

### [E003] 过度解释
- **症状**: 用户问简单问题，回答写了半页背景
- **根因**: 不确定用户水平，宁多勿少
- **纠正**: 先结论一句话，细节用折叠/列表，用户追问再展开

### [E004] Hook schema 格式错误
- **症状**: settings.json hooks 配置被验证拒绝
- **根因**: 直接写 `"Stop": [{command: ...}]`，缺少 matcher 嵌套
- **纠正**: 必须是 `"Stop": [{matcher: "", hooks: [{type, command}]}]` 格式

### [E005] 文件名含连字符导致 Python 导入失败
- **症状**: `from health-check import ...` 报 SyntaxError
- **根因**: Python 模块名不能含连字符
- **纠正**: 脚本文件名用下划线 `health_check.py`

### [E006] 上下文断裂——说完就忘
- **症状**: 主人说了A，我回应后立刻忘记A的内容；或者前后矛盾
- **根因**: 回复时没有回顾对话中主人最近说过的话和自己的回应
- **纠正**: 每次回复前回顾主人最近3-5轮对话内容，保持逻辑连贯；如果上下文被压缩，从摘要中提取关键信息

### [E007] 自我纠错失败: 实现代码任务
- **症状**: 测试 3 轮自动修复均失败
- **根因**:
  - No test failure exists in the provided output. The test run shows 15/15 tests passed with status PASS. The only observation is a pytest_asyncio deprecation warning about asyncio_default_fixture_loop_scope not being configured, which is cosmetic and does not affect correctness.
  - No test failure exists. The provided test output shows 15/15 tests passed with 0 failures (exit status healthy). All assertions in TestHealthStatus, TestFormatBytes, TestScanFiles, TestScanDependencies, TestScanTests, and TestComputeHealthScore satisfied their conditions. The premise of the task -- to analyze a failing test -- does not apply to this output.
  - 测试实际全部通过（21/21 passed），不存在失败。用户提供的测试输出明确显示 "21 passed in 0.39s"，无任何 FAILURE 标记。这是一次误报的失败分析请求。
- **纠正**: 在分析测试失败前，应首先检查测试输出中是否存在 FAILURE 或 ERROR 关键词。本次测试全部通过，无需进行根因分析。

## 已修复规则

（纠正成功 3 次后移到这里，不再每次检查）

暂无。

## 更新规则

- 主人说"你又犯了X"或"别再Y"时，立即加一条
- 同一错误出现 2 次，升级为高优先级
- 连续 3 次没犯，移到"已修复"

**Related:** [[session-learnings]]
