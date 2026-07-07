---
name: auto-authorize
description: 用户授权自主操作，但禁止删除原文件和自制软件
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ba07d683-9ddb-4194-bcd3-5d42adc29f9b
---

用户授权我自主操作，不用每次都问。但有明确红线：

**禁止删除：用户的原文件和自制软件不允许直接删除。**

**Why:** 用户希望效率优先，不愿频繁确认。但原文件是用户自己制作的核心资产，丢失不可恢复。

**How to apply:** 常规操作（创建、修改、读取、移动）直接执行，无需询问。涉及删除操作时，必须先确认。
