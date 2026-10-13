# Name: Nelson
# Challenge: 05
# Purpose: Use the Active Directory module to query lab computer accounts


Import-Module ActiveDirectory
$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')

foreach ($computer in $computers) {
    $adComputer = Get-ADComputer -Identity $computer -Server LON-DC1.Adatum.com -Properties OperatingSystem
    Write-Output "Name: $($adComputer.Name) | DNSHostName: $($adComputer.DNSHostName) | OS: $($adComputer.OperatingSystem)"
}