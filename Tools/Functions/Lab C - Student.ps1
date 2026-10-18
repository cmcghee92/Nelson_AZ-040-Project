function Get-CorpOSInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Please enter a valid LON computer name (e.g., LON-DC1 or LON-SVR1)")]
        [ValidatePattern("LON-\w{2,3}\d{1,2}")]
        [Alias("HostName")]
        [string]$ComputerName
    )
    
    Write-Verbose "Connecting to $ComputerName"
    Get-CimInstance -ComputerName $ComputerName -ClassName Win32_OperatingSystem
}

Get-CorpOSInfo -ComputerName LON-DC1       # Succeeds
Get-CorpOSInfo -HostName LON-DC1           # Succeeds (Alias)
Get-CorpOSInfo -HostName localhost         # Fails validation (Correct)
Get-CorpOSInfo                             # Prompts for input. Type "!?" to see the HelpMessage.