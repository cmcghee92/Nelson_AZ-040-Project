function Get-CorpOSInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true, HelpMessage="Please enter a valid LON computer name (e.g., LON-DC1 or LON-SVR1)")]
        [ValidatePattern("LON-\w{2,3}\d{1,2}")]
        [Alias("HostName")]
        [string[]]$ComputerName
    )
    
    foreach ($computer in $ComputerName) {
        Write-Verbose "Connecting to $computer"
        Get-CimInstance -ComputerName $computer -ClassName Win32_OperatingSystem
    }
}



Get-CorpOSInfo -ComputerName LON-DC1, LON-SVR1
Get-CorpOSInfo -ComputerName LON-DC1, LON-SVR1 -Verbose