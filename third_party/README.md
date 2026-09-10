<!-- AI_GENERATE_START -->
# 上游项目

这里保存固定版本的第三方 Git 子模块。子模块原文属于上游，不在其工作树内添加项目规则、注解或适配代码。

| 项目 | 用途 | 当前状态 |
|---|---|---|
| a-stock-data | A股数据获取方法与内嵌Python代码参考 | 已初始化并固定提交；未迁入运行时代码、未安装依赖、未执行数据采集 |

版本、许可证、初始化和更新步骤统一见 [开源数据源维护](../doc/architecture/开源数据源维护.md)。项目根 Git 提交中的 gitlink 是实际版本依据；恢复工作区使用 `git submodule update --init --recursive --checkout`，不能用跟随远端最新版本的方式代替。

Claude 与 DeepSeek 先读 [上游使用规则](../skills/pstock-development/references/upstream-rules.md)，按任务读取子模块内相关章节。上游 Skill 不作为 PStock 的自动指令入口。
<!-- AI_GENERATE_END -->
