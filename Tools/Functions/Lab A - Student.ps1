function Get-CorpOSInfo {
    [CmdletBinding()]
    param(
        [string]$ComputerName
    )
    
    Get-CimInstance -ComputerName $ComputerName -ClassName Win32_OperatingSystem
}

# Task 4: Test invocation
Get-CorpOSInfo -ComputerName "lon-dc1.adatum.com"