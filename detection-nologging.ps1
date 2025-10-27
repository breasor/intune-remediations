<#
.SYNOPSIS
    <Short description>

.DESCRIPTION
    <Detailed explanation of detection logic>

.EXAMPLE
    Intune Remediation Detection script

.EXITCODES
    0   Compliant
    1   Non-compliant
#>

$ExitCodes = @{ Compliant=0; NonCompliant=1 }

try {
    # --- Detection Logic ---
    # $isCompliant = <condition>  # true/false

    if ($isCompliant) {
        Write-Output "Compliant"
        exit $ExitCodes.Compliant
    } else {
        Write-Output "Non-compliant"
        exit $ExitCodes.NonCompliant
    }
}
catch {
    Write-Output "Error: $($_.Exception.Message)"
    exit $ExitCodes.NonCompliant
}
