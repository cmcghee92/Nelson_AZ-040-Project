# Name: Nelson
# Challenge: 06
# Purpose: Introduce if and else without changing service configuration


$services = @('EventLog', 'W32Time', 'Spooler')
$reviewCount = 0

foreach ($serviceName in $services) {
    $service = Get-Service -Name $serviceName
    if ($service.Status -eq 'Running') {
        Write-Output "OK: $($service.Name)"
    } else {
        Write-Output "REVIEW: $($service.Name) | Status: $($service.Status)"
        $reviewCount++
    }
}

Write-Output "Total services marked REVIEW: $reviewCount"