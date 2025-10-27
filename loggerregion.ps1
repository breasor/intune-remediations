#region Logger (IntuneLite)
$Global:QHLogRoot = 'C:\ProgramData\Microsoft\IntuneManagementExtension\Logs'

function Initialize-Logger {
    param([string]$ScriptName = (Split-Path -Leaf $PSCommandPath))
    try {
        if (-not (Test-Path $Global:QHLogRoot)) { New-Item -Path $Global:QHLogRoot -ItemType Directory -Force | Out-Null }
        $date = Get-Date -Format 'yyyy-MM-dd'
        $Global:QHLogFile = Join-Path $Global:QHLogRoot ("{0}-{1}.log" -f $ScriptName,$date)
        if (-not (Test-Path $Global:QHLogFile)) { New-Item -Path $Global:QHLogFile -ItemType File -Force | Out-Null }
    } catch { $Global:QHLogFile = $null }
}

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet('Info','Warn','Error','Debug')][string]$Level = 'Info'
    )
    $ts = (Get-Date).ToString('yyyy-MM-ddTHH:mm:ss.ffffK')
    $prefix = switch ($Level) {
        'Info'  { '🟢 [INFO] ' }
        'Warn'  { '🟡 [WARN] ' }
        'Error' { '🔴 [ERROR] ' }
        'Debug' { '🐛 [DEBUG] ' }
    }
    $line = "$ts $prefix$Message"
    Write-Output $line
    if ($Global:QHLogFile) { try { $line | Out-File -FilePath $Global:QHLogFile -Append -Encoding utf8 } catch {} }
}
#endregion
