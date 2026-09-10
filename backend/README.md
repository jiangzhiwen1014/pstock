<!-- AI_GENERATE_START -->
# 后端工程

技术基线为 Python + FastAPI + PostgreSQL + SQLAlchemy/Psycopg + Alembic，API 与 worker 共用 `src/pstock/`。初期一个 API 进程、一个后台执行槽，任务状态存入数据库，暂不引入 Redis/RQ。当前只有目录和文档，没有依赖清单、业务源码或可执行启动命令；精确版本待工程初始化验证。

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
| migrations | Alembic 数据库迁移，需求详设批准后才增加真实脚本 |
| tests | 正式维护的后端测试 |

[业务模块索引](src/pstock/modules/README.md) 定义归属。portfolio 已建立四层样板，其他模块按需求创建内部层级。
<!-- AI_GENERATE_END -->
