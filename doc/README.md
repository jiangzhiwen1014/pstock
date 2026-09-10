<!-- AI_GENERATE_START -->
# PStock 文档中心

文档按职责集中在 `doc/`。根目录和工程目录的 README 只作导航及目录说明，不维护独立需求副本。

| 分类 | 入口 | 权威内容 |
|---|---|---|
| 架构 | [架构导航](architecture/README.md) | 全局结构、技术边界、决策及建设顺序 |
| 需求 | [需求索引](requirements/README.md) | 每个需求独立版本的业务目标、规则和验收标准 |
| Sprint | [开发详设索引](sprint/README.md) | 对应需求版本的实现设计、任务与验证记录 |
| 模板 | [项目 Skill](../skills/pstock-development/SKILL.md) | 可复制的需求、详设、任务和验证模板 |

## 版本和状态

目录顺序固定为“需求 ID 与标题 / 三段版本”。例如 `PS-001-个人账户与持仓/1.0.0/`。一个需求升级不带动其他需求升级；详设使用它引用的需求版本，不另起版本计数。

当前只初始化 PS-001、PS-002 的 1.0.0 文档骨架，均未完成需求确认和开发详设；其余历史候选见 [建设顺序](architecture/建设顺序.md)。不创建尚无业务含义的 1.1.0 空版本。

已确认范围：统一 PStock、沪深主板交易、外围研究、前后端分离、业务模块优先、需求独立版本、Claude Code 共用约束。前端技术框架已确认，见 [前端架构](architecture/前端架构.md)。[后端架构](architecture/后端架构.md) 已落实 Python/FastAPI、PostgreSQL、数据库持久任务及后续实时性演进；初期部署在持续在线的 4 核 4G 云服务器，优先消息面、技术面与公司研究。交易模式、资金、周期、回撤、数据预算与精确依赖版本仍待确认。

## 来源与迁移

原规划任务：`01a074bd-261e-7ff1-b621-3e41c5f67605`。本轮沿用已读取的讨论和现有文档，不将历史开源候选当作最新验证结论。

| 原路径 | 当前归属 |
|---|---|
| readme/README.md | 本文档 |
| readme/01-directory-structure.md | [目录结构](architecture/目录结构.md) |
| readme/02-module-boundaries.md | [模块边界](architecture/模块边界.md) |
| readme/03-implementation-roadmap.md | [建设顺序](architecture/建设顺序.md) |

旧 `readme/` 文档迁移后不再维护。业务状态和验收证据只在对应版本记录，Git 记录迁移历史。
<!-- AI_GENERATE_END -->
