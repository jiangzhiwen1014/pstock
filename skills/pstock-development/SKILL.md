---
name: pstock-development
description: 在 PStock 仓库初始化或调整目录、维护独立版本需求与详设、实现前后端功能和交接验证时，应用项目结构、数据边界及交付约束；不负责修改开发工具的模型连接和凭据。
---
<!-- AI_GENERATE_START -->
# PStock 项目开发 Skill

先读根 [AGENTS.md](../../AGENTS.md)。此 Skill 是项目细则的唯一入口，适用于 Claude、DeepSeek 及其他执行者，不要求安装本机私有技能。

## 工作方式

1. 根据当前用户指令判断只读讨论或已授权修改；已授权范围内持续完成，不重复请求相同确认。
2. 业务任务明确需求 ID、独立版本、同版本详设、任务 ID、写入范围和验收条件。需求与详设为骨架/草案时不能自行当作已批准开发任务。
3. 初始化及规则维护使用本次已批准范围作为依据，不伪造业务需求。
4. 按下面的路由只读相关细则；一个阶段用一套流程，领域细则只补充约束。
5. 修改前登记实际文件，完成适用检查，再更新任务与验证记录；修改代码后不能沿用旧验证结论。
6. 按当前授权完成提交或推送等动作，不把实现完成自动等同于发布授权。

## 细则路由

| 触发工作 | 细则 |
|---|---|
| 创建、迁移或重构目录 | [目录规则](references/directory-rules.md) |
| 写需求、详设、拆任务、换模型交接 | [文档规则](references/document-rules.md) |
| 前端页面、组件、状态或客户端 | [前端规则](references/frontend-rules.md) |
| 后端接口、事务、任务或仓储 | [后端规则](references/backend-rules.md) |
| 数据接入、策略、账户、模拟、收益 | [数据规则](references/data-rules.md) |
| 引用、提取或升级第三方数据源 | [上游规则](references/upstream-rules.md) |
| 任何文件修改、检查、交付或提交 | [交付规则](references/delivery-rules.md) |

## 可复用文档模板

- [需求说明](assets/templates/需求说明模板.md)
- [验收标准](assets/templates/验收标准模板.md)
- [开发详设](assets/templates/开发详设模板.md)
- [任务拆分](assets/templates/任务拆分模板.md)
- [验证记录](assets/templates/验证记录模板.md)

复制模板时填入真实 ID 与独立版本，文件名带 ID。模板不是已批准业务需求；不为凑完整度编造规则、接口、测试或结果。
<!-- AI_GENERATE_END -->
