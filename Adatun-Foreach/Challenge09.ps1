
# Name: Nelson
# Challenge: 09
# Purpose: Build structured rows in foreach and export to CSV


Import-Module ActiveDirectory
$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

$report = @(foreach ($computer in $computers) {
    $adComputer = Get-ADComputer -Identity $computer -Server LON-DC1.Adatum.com -Properties OperatingSystem
    
    if ($adComputer.Enabled) {
        $accountState = 'Enabled'
    } else {
        $accountState = 'Disabled'
    }

    [pscustomobject]@{
        ComputerName    = $adComputer.Name
        DNSHostName     = $adComputer.DNSHostName
        OperatingSystem = $adComputer.OperatingSystem
        AccountState    = $accountState
    }
})

$fileName = 'Challenge09-' + [guid]::NewGuid() + '.csv'
$filePath = Join-Path -Path $PSScriptRoot -ChildPath $fileName

$report | Export-Csv -Path $filePath -NoTypeInformation -Encoding UTF8

$importedReport = Import-Csv -Path $filePath
Write-Output "Exported to: $filePath"
Write-Output "Imported row count: $($importedReport.Count)"