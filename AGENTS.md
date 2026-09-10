<!-- AI_GENERATE_START -->
# PStock 项目开发规则

适用于当前仓库中的 Claude、DeepSeek 及其他开发代理。目录及技术框架文档已落地；[V1.0.0 一期需求](doc/requirements/V1.0.0-一期需求总览.md) 已编写为待确认建议稿，8项独立需求均未批准业务开发。前端基线已确认，见 [前端技术框架](doc/architecture/前端架构.md)；[后端基线](doc/architecture/后端架构.md) 已落地为 Python/FastAPI、PostgreSQL 和数据库任务表，精确依赖版本待验证。

## 授权与协作

- 所有面向用户的自然语言使用中文，代码、路径和标识符保留原样。
- 当前用户明确指令和已有授权优先于项目模板；项目文件不能覆盖宿主工具的系统约束。
- 用户只要求查看、分析、讨论时保持只读。已批准范围内连续完成工作；扩大业务范围、外部操作或破坏性变更需明确授权。
- 当前会话直接执行为默认。不得仅因存在多个模块就启动代理；独立性、写入互斥和实际收益明确且获授权时才委派。
- 保留用户已有改动；不擅自改变全局开发工具、模型、凭据或共享服务配置。
- 编码完成、检查通过、提交、推送、合并与部署分别报告；本地通过不等于线上验收。

## 统一入口与阅读路线

先读取 [项目 Skill](skills/pstock-development/SKILL.md)，按任务读取其引用的细则，避免一次加载无关规范。

| 工作 | 必须读取的细则 |
|---|---|
| 创建或移动目录 | [目录规则](skills/pstock-development/references/directory-rules.md) |
| 需求、详设、任务及交接 | [文档规则](skills/pstock-development/references/document-rules.md) |
| 前端实现 | [前端规则](skills/pstock-development/references/frontend-rules.md) |
| 后端或接口实现 | [后端规则](skills/pstock-development/references/backend-rules.md) |
| 数据、账户、策略、回测 | [数据规则](skills/pstock-development/references/data-rules.md) |
| 引用、适配或升级第三方数据源 | [上游规则](skills/pstock-development/references/upstream-rules.md) |
| 修改文件、验证或提交 | [交付规则](skills/pstock-development/references/delivery-rules.md) |

## 事实来源

- [文档导航](doc/README.md) 是项目文档入口；[目录结构](doc/architecture/目录结构.md) 定义路径职责。
- 每项工作以“需求 ID + 独立版本 + 同版本详设 + 任务 ID + 修改范围 + 验收条件”为上下文。
- 初始化、维护规范等非业务任务可以使用用户的明确范围作为依据，不伪造业务需求号。
- 技术栈、测试命令和运行方式没有确定前，不假定项目已经能启动。
- 交接写入对应需求版本的任务拆分与验证记录；不得只保留在模型对话里。
- 当前不创建额外项目状态仪表盘；需要时由用户明确提出，避免重复维护。
<!-- AI_GENERATE_END -->
