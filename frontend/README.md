<!-- AI_GENERATE_START -->
# 前端工程

当前仅初始化目录；框架、语言、构建与测试工具尚未确认，无启动命令。请先读 [前端架构](../doc/architecture/前端架构.md) 和 [前端规则](../skills/pstock-development/references/frontend-rules.md)。

| 目录 | 职责 |
|---|---|
| src/app | 应用初始化、路由、全局装配 |
| src/layouts | 页面骨架与导航布局 |
| src/modules | 按业务模块组织页面、组件、接口、状态和类型 |
| src/shared | 确有跨模块使用的公共组件与工具 |
| src/infrastructure | 请求客户端、会话及基础设施适配 |
| src/assets、public | 工程资源与直接提供的静态资源 |
| tests | 正式维护的前端测试 |

`src/modules/portfolio/` 已建立 pages、components、api、state、types 分层。其他模块在开发时按需增加。详情见 [业务模块索引](src/modules/README.md)。
<!-- AI_GENERATE_END -->
