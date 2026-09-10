# AI_GENERATE_START
[CmdletBinding()]
param([string]$Repository = (Split-Path -Parent $PSScriptRoot))

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $Repository).Path
$errors = [Collections.Generic.List[string]]::new()
$linkCount = 0
$versionCount = 0

function Require-Path([string]$Relative, [string]$Type = 'Any') {
    if (-not (Test-Path -LiteralPath (Join-Path $root $Relative) -PathType $Type)) {
        $errors.Add("Missing path: $Relative")
    }
}

try {
    foreach ($path in @('README.md','AGENTS.md','CLAUDE.md','frontend/README.md','backend/README.md',
        'doc/README.md','doc/architecture/README.md','doc/requirements/README.md','doc/sprint/README.md',
        'skills/pstock-development/SKILL.md')) { Require-Path $path 'Leaf' }
    foreach ($path in @('frontend/src/app','frontend/src/layouts','frontend/src/modules','frontend/src/shared',
        'frontend/src/infrastructure','frontend/src/assets','frontend/public','frontend/tests',
        'backend/src/pstock/bootstrap','backend/src/pstock/modules','backend/src/pstock/workflows',
        'backend/src/pstock/integrations','backend/src/pstock/infrastructure','backend/src/pstock/jobs',
        'backend/src/pstock/shared','backend/migrations','backend/tests','tests/e2e','deploy',
        'doc/architecture/decisions','skills/pstock-development/references','skills/pstock-development/assets/templates')) {
        Require-Path $path 'Container'
    }
    foreach ($module in @('profile','market_data','research','influence','strategy','portfolio','risk',
        'decision','simulation','monitoring','review')) {
        Require-Path "frontend/src/modules/$module" 'Container'
        Require-Path "backend/src/pstock/modules/$module" 'Container'
    }
    foreach ($layer in @('pages','components','api','state','types')) {
        Require-Path "frontend/src/modules/portfolio/$layer" 'Container'
    }
    foreach ($layer in @('api','application','domain','infrastructure')) {
        Require-Path "backend/src/pstock/modules/portfolio/$layer" 'Container'
    }
    if (Test-Path -LiteralPath (Join-Path $root 'readme')) { $errors.Add('Legacy readme directory still exists.') }

    $listed = @(& git -c core.quotepath=false -C $root ls-files --cached --others --exclude-standard)
    if ($LASTEXITCODE -ne 0) { throw 'Cannot enumerate Git files.' }
    $paths = @($listed | Sort-Object -Unique | Where-Object {
        Test-Path -LiteralPath (Join-Path $root $_) -PathType Leaf
    })
    if ($paths.Count -eq 0) { throw 'No project files found.' }
    foreach ($relative in $paths) {
        $full = Join-Path $root $relative
        $ext = [IO.Path]::GetExtension($relative).ToLowerInvariant()
        $name = [IO.Path]::GetFileName($relative)
        if ($ext -notin @('.md','.ps1') -and $name -notin @('.gitkeep','.gitignore')) { continue }
        $content = Get-Content -LiteralPath $full -Raw -Encoding UTF8
        foreach ($token in @('AI_GENERATE_START','AI_GENERATE_END')) {
            $valid = [regex]::Matches($content, "(?m)^\s*(?:#|<!--)\s*$token\s*(?:-->)?\s*$")
            $all = [regex]::Matches($content, "(?m)^\s*(?:#|<!--)\s*$token[^\r\n]*")
            if ($valid.Count -ne 1 -or $all.Count -ne 1) { $errors.Add("Invalid marker $token : $relative") }
        }
        if ($content.IndexOf('AI_GENERATE_START') -gt $content.LastIndexOf('AI_GENERATE_END')) {
            $errors.Add("Reversed markers: $relative")
        }
        if ($ext -ne '.md') { continue }
        foreach ($match in [regex]::Matches($content, '\]\(([^)\r\n]+)\)')) {
            $target = $match.Groups[1].Value.Trim()
            if ($target -match '^[a-zA-Z][a-zA-Z0-9+.-]*:' -or $target.StartsWith('#')) { continue }
            $target = [Uri]::UnescapeDataString(($target -split '#',2)[0].Trim('<','>'))
            $resolved = [IO.Path]::GetFullPath((Join-Path (Split-Path $full) $target))
            $prefix = $root + [IO.Path]::DirectorySeparatorChar
            if (-not ($resolved.Equals($root,[StringComparison]::OrdinalIgnoreCase) -or
                $resolved.StartsWith($prefix,[StringComparison]::OrdinalIgnoreCase))) {
                $errors.Add("Link leaves repository: $relative -> $target")
            } elseif (-not (Test-Path -LiteralPath $resolved)) {
                $errors.Add("Broken link: $relative -> $target")
            }
            $linkCount++
        }
    }

    $claudePath = Join-Path $root 'CLAUDE.md'
    if (Test-Path -LiteralPath $claudePath) {
        $claudeText = Get-Content -LiteralPath $claudePath -Raw -Encoding UTF8
        foreach ($import in @('AGENTS.md','skills/pstock-development/SKILL.md')) {
            $pattern = '(?m)^@' + [regex]::Escape($import) + '\s*$'
            if ($claudeText -notmatch $pattern) { $errors.Add("Missing Claude import: $import") }
            Require-Path $import 'Leaf'
        }
    }

    $reqRoot = Join-Path $root 'doc/requirements'
    $sprintRoot = Join-Path $root 'doc/sprint'
    if ((Test-Path $reqRoot) -and (Test-Path $sprintRoot)) {
        $requirements = @(Get-ChildItem -LiteralPath $reqRoot -Directory)
        $sprints = @(Get-ChildItem -LiteralPath $sprintRoot -Directory)
        $seen = @{}
        foreach ($req in $requirements) {
            if ($req.Name -notmatch '^(PS-\d{3})-.+$') {
                $errors.Add("Invalid requirement directory: $($req.Name)")
                continue
            }
            $id = $Matches[1]
            if ($seen.ContainsKey($id)) { $errors.Add("Duplicate requirement ID: $id") }
            $seen[$id] = $true
            $sprint = Join-Path $sprintRoot $req.Name
            Require-Path "doc/requirements/$($req.Name)/README.md" 'Leaf'
            Require-Path "doc/sprint/$($req.Name)/README.md" 'Leaf'
            $versions = @(Get-ChildItem -LiteralPath $req.FullName -Directory)
            if ($versions.Count -eq 0) { $errors.Add("No requirement version: $($req.Name)") }
            foreach ($version in $versions) {
                $ver = $version.Name
                if ($ver -notmatch '^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$') {
                    $errors.Add("Invalid independent version: $($req.Name)/$ver")
                    continue
                }
                $versionCount++
                $reqBase = "doc/requirements/$($req.Name)/$ver"
                $sprintBase = "doc/sprint/$($req.Name)/$ver"
                foreach ($suffix in @('需求说明','验收标准')) { Require-Path "$reqBase/$id-$suffix.md" 'Leaf' }
                foreach ($suffix in @('开发详设','任务拆分','验证记录')) { Require-Path "$sprintBase/$id-$suffix.md" 'Leaf' }
                foreach ($metadataPath in @("$reqBase/$id-需求说明.md","$sprintBase/$id-开发详设.md")) {
                    $metadataFull = Join-Path $root $metadataPath
                    if (-not (Test-Path -LiteralPath $metadataFull)) { continue }
                    $body = Get-Content -LiteralPath $metadataFull -Raw -Encoding UTF8
                    if ($body -notmatch ('(?m)^\|\s*需求 ID\s*\|\s*'+[regex]::Escape($id)+'\s*\|')) {
                        $errors.Add("Requirement ID metadata mismatch: $metadataPath")
                    }
                    if ($body -notmatch ('(?m)^\|\s*需求独立版本\s*\|\s*'+[regex]::Escape($ver)+'\s*\|')) {
                        $errors.Add("Version metadata mismatch: $metadataPath")
                    }
                }
            }
            if (Test-Path -LiteralPath $sprint -PathType Container) {
                foreach ($version in @(Get-ChildItem -LiteralPath $sprint -Directory)) {
                    if (-not (Test-Path -LiteralPath (Join-Path $req.FullName $version.Name) -PathType Container)) {
                        $errors.Add("Sprint version without requirement: $($req.Name)/$($version.Name)")
                    }
                }
            }
        }
        foreach ($sprint in $sprints) {
            if (-not (Test-Path -LiteralPath (Join-Path $reqRoot $sprint.Name) -PathType Container)) {
                $errors.Add("Sprint without requirement: $($sprint.Name)")
            }
        }
    }
    if ($errors.Count -gt 0) {
        foreach ($failure in $errors) { Write-Output "FAIL: $failure" }
        exit 1
    }
    Write-Output "PASS: $($paths.Count) project files; $linkCount local links; $versionCount independent requirement versions."
    Write-Output 'PASS: directory layout, Claude imports, supported text markers and requirement/sprint correspondence.'
    exit 0
} catch {
    Write-Output "FAIL: $($_.Exception.Message)"
    exit 1
}
# AI_GENERATE_END
