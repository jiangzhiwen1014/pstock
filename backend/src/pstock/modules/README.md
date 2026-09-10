<!-- AI_GENERATE_START -->
# 后端业务模块

- `profile/`：投资档案与权限。
- `market_data/`：统一数据与质量。
- `research/`：公司与行业研究。
- `influence/`：外围传导与证据。
- `strategy/`：因子与策略版本。
- `portfolio/`：账户、现金与持仓。
- `risk/`：组合风险与约束。
- `decision/`：投资理由与行动条件。
- `simulation/`：回测与持续模拟。
- `monitoring/`：变化监控与提醒。
- `review/`：长期复盘。

portfolio 已建立 api/application/domain/infrastructure 四层样板。其他模块仅保留目录；真实、模拟及回测账目必须隔离。跨模块通过公开应用接口协作。
<!-- AI_GENERATE_END -->
