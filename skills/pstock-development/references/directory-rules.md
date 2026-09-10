<!-- AI_GENERATE_START -->
# 目录规则

目录职责以 [目录结构](../../../doc/architecture/目录结构.md) 为准。

- 根 frontend 与 backend 是唯一业务工程入口，不另建重复 src/frontend、apps/web 等同用途目录。
- 模块内保留专用代码；模块公开接口稳定后才能被其他模块引用，禁止深层导入和跨模块直接改表。
- 前端基础请求归 infrastructure，模块 API 归 modules/模块/api；业务数值在后端计算。
- 后端模块内分层；公共技术设施与模块仓储区分；供应商细节归 integrations。
- 文档归 doc，模板和执行规则归 skills，不把业务需求正文复制到 Skill。
- 目录名用英文语义名称；需求目录用固定 ID 加中文标题；版本目录必须为无前导零的 major.minor.patch。
- 已有模块有相同职责时优先扩展，新增共享模块或变更边界须在架构与详设中记录。
- .gitkeep 只保留空目录；增加真实文件时删除该目录占位文件。正式测试分别归 frontend/tests、backend/tests、tests/e2e。
- 一次性探测和日志归 D:\test\pstock\任务，运行数据和密钥归仓库外。
<!-- AI_GENERATE_END -->
