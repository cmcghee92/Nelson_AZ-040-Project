# Name: Nelson
# Challenge: 03
# Purpose: Query service objects and read their properties


$services = @('EventLog', 'W32Time', 'Spooler')
foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName
    Write-Output "Service: $($service.Name) | Status: $($service.Status)"
}