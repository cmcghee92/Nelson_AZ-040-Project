# Name: Nelson
# Challenge: 04
# Purpose: Loop through a returned collection and maintain a counter
# Run on: LON-CL1

$allServices = @(Get-Service)
$total = 0

foreach ($service in $allServices) {
    Write-Output $service.Name
    $total = $total + 1
}

Write-Output "Total services: $total"