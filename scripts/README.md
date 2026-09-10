<!-- AI_GENERATE_START -->
# 项目检查

在项目根目录执行（Git、PowerShell 7，或支持 UTF-8 脚本的 PowerShell 环境）：

```powershell
pwsh -NoProfile -File scripts/check-project.ps1
```

脚本只读检查，不修改工作树：

- 必需的前后端、模块与文档目录。
- Markdown 本地文件/目录链接、Claude 入口导入。
- 需求与详设同 ID、标题、独立版本对应；必要文件和正文 ID/版本。
- Markdown、PowerShell、gitkeep、gitignore 的基本注解格式。

成功返回 0，缺失或不一致返回 1。它不检查网络链接、Markdown 锚点、业务正确性、模型真实加载、其他语言全部语法或严格格式文件的审计。

当前用户指定的全局 AI 注解脚本仍须对本次实际变更文件运行；严格格式文件在根 ai-changes-audit.md 按路径登记，详见 [交付规则](../skills/pstock-development/references/delivery-rules.md)。
<!-- AI_GENERATE_END -->
