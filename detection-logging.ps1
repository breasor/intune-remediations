<#
.SYNOPSIS
    <Short description>
#>

$ExitCodes = @{ Compliant=0; NonCompliant=1 }

#region INCLUDE_LOGGER
# (Insert Logger region here)
#endregion

try {
    Initialize-Logger; Write-Log -Message "Detection start." -Level Info
    # $isCompliant = <condition>
    if ($isCompliant) {
        Write-Log -Message "Compliant." -Level Info
        exit $ExitCodes.Compliant
    } else {
        Write-Log -Message "Non-compliant." -Level Warn
        exit $ExitCodes.NonCompliant
    }
}
catch {
    Write-Log -Message "Error: $($_.Exception.Message)" -Level Error
    exit $ExitCodes.NonCompliant
}
