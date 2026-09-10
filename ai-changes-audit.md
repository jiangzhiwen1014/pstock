<!-- AI_GENERATE_START -->
# AI变更审计

| 精确路径 | 类型与处理 | 验证方式 |
|---|---|---|
| third_party/a-stock-data | Git mode 160000的gitlink，不是可插入注释的文本；引用上游原版提交。子模块内文件未由AI改写，不添加标记以保留原版及许可证 | 核对父仓库gitlink、子模块HEAD、上游来源URL及干净状态；版本见维护文档 |

`.gitmodules` 使用Git配置支持的行注释标记；其他本次创建或修改的普通文本均包含合法文件边界标记。注解验证仅针对父仓库实际修改的文件，子模块gitlink按上表独立验证，不递归改写第三方原文。
<!-- AI_GENERATE_END -->
