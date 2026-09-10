<!-- AI_GENERATE_START -->
# 前端工程

前端技术基线已确认：React、严格 TypeScript、Vite、React Router、Ant Design、ECharts、TanStack Query、按需 Zustand、CSS Modules，以及 Vitest / React Testing Library / Playwright。行情图初选 Lightweight Charts，KLineChart 保留作对比候选。

当前仍只有目录骨架，没有安装依赖、创建应用或执行构建；准确版本、运行工具和接口细节待确定，无可用启动命令。请先读 [前端架构](../doc/architecture/前端架构.md) 和 [前端规则](../skills/pstock-development/references/frontend-rules.md)。

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
