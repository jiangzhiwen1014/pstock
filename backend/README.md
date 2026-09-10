<!-- AI_GENERATE_START -->
# 后端工程

当前仅初始化目录；语言、框架、数据库与任务工具尚未确认，`src/pstock/` 是逻辑代码包边界，不构成 Python 或其他语言选型。没有启动命令。

先读 [后端架构](../doc/architecture/后端架构.md) 和 [后端规则](../skills/pstock-development/references/backend-rules.md)。

| 目录 | 职责 |
|---|---|
| src/pstock/bootstrap | API 与 worker 入口和依赖装配 |
| src/pstock/modules | 模块内接口、应用用例、领域规则与仓储实现 |
| src/pstock/workflows | 跨模块业务流程协调 |
| src/pstock/integrations | 外部数据、回测、模型、通知适配 |
| src/pstock/infrastructure | 数据库连接、缓存、运行状态等公共设施 |
| src/pstock/jobs | 定时或异步任务触发、重试入口 |
| src/pstock/shared | 金额、时间和标识等公共基础类型 |
| migrations | 数据库结构迁移，选型后才增加真实迁移 |
| tests | 正式维护的后端测试 |

[业务模块索引](src/pstock/modules/README.md) 定义归属。portfolio 已建立四层样板，其他模块按需求创建内部层级。
<!-- AI_GENERATE_END -->
