#
A script module offers auto-discovery (PowerShell finds it automatically), reusability across multiple scripts/sessions, 
and separates the function logic from the test/invocation code, keeping the environment clean.
#


function Get-CorpOSInfo {
    [CmdletBinding()]
    param(
        [string]$ComputerName
    )
    
    Write-Verbose "Connecting to $ComputerName"
    Get-CimInstance -ComputerName $ComputerName -ClassName Win32_OperatingSystem
}



Get-CorpOSInfo -ComputerName LON-SVR1
Get-CorpOSInfo -ComputerName LON-DC1 -Verbose