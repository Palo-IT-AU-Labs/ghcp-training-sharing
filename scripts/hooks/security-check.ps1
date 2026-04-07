$ErrorActionPreference = "Stop"

$input = [Console]::In.ReadToEnd() | ConvertFrom-Json
$toolName = $input.toolName
$toolArgs = $input.toolArgs | ConvertFrom-Json

# Block dangerous shell commands
if ($toolName -eq "bash") {
    $command = $toolArgs.command

    $dangerousPatterns = @(
        'rm -rf /', 'sudo ', 'mkfs\.', 'format ',
        'DROP TABLE', 'TRUNCATE TABLE'
    )

    foreach ($pattern in $dangerousPatterns) {
        if ($command -match $pattern) {
            @{
                permissionDecision = "deny"
                permissionDecisionReason = "Blocked: destructive system command detected"
            } | ConvertTo-Json -Compress
            exit 0
        }
    }
}

# Restrict file edits to allowed directories
if ($toolName -in @("edit", "create")) {
    $filePath = $toolArgs.path

    if ($filePath -and $filePath -notmatch '^(src/|test/|docs/)') {
        @{
            permissionDecision = "deny"
            permissionDecisionReason = "Edits restricted to src/, test/, and docs/ directories"
        } | ConvertTo-Json -Compress
        exit 0
    }
}

# Allow everything else (no output = allow)
