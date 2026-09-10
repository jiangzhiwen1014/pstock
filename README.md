<!-- AI_GENERATE_START -->
# PStock

个人持续投研与投资决策工作台，交易范围为已开通权限的沪深主板，外围市场用于研究。统一数据、账户、研究证据和决策记录，由用户做最终决定。

**当前状态：项目目录、文档骨架与开发约束已初始化。前后端技术框架及 V1.0.0 一期需求建议稿已形成；需求待确认，没有可运行的前后端业务应用。**

## 入口

| 入口 | 内容 |
|---|---|
| [V1.0.0 一期需求](doc/requirements/V1.0.0-一期需求总览.md) | 一期范围、8项独立需求、规则及验收 |
| [文档中心](doc/README.md) | 架构、按需求独立版本管理的需求与开发详设 |
| [前端技术框架](doc/architecture/前端架构.md) | 已确认选型、状态管理、图表封装、建设与验收计划 |
| [后端技术框架](doc/architecture/后端架构.md) | Python/FastAPI、PostgreSQL、持久任务与实时性演进 |
| [前端工程](frontend/README.md) | 业务模块、页面、组件、请求与状态的目录职责 |
| [后端工程](backend/README.md) | 模块内部四层、跨模块流程、外部接入、后台任务 |
| [项目规则](AGENTS.md) | 授权、协作、规则引用与交接 |
| [项目 Skill](skills/pstock-development/SKILL.md) | 按任务读取开发、文档、数据和交付规范 |
| [项目检查](scripts/README.md) | 目录、链接、文档对应和注解检查 |

需求采用 `doc/requirements/PS-编号-标题/1.0.0/`，对应详设采用 `doc/sprint/PS-编号-标题/1.0.0/`。版本属于单个需求，不是产品发布版本。

从仓库根目录启动 Claude Code；[CLAUDE.md](CLAUDE.md) 导入通用规则和项目 Skill。换用 DeepSeek 后仍使用这套项目规则。模型连接、服务地址和凭据由开发工具管理，不写入仓库。
<!-- AI_GENERATE_END -->
