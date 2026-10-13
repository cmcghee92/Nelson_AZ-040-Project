# Name: Nelson
# Challenge: 10
# Purpose: Combine nested foreach loops, if, and remote execution scaffold


$targets = @('LON-SVR1.Adatum.com')

foreach ($target in $targets) {
    try {
        $services = @(Invoke-Command -ComputerName $target `
            -ErrorAction Stop -ScriptBlock {
                Get-Service -Name 'EventLog', 'W32Time', 'Spooler' `
                    -ErrorAction Stop
            })
        
        foreach ($service in $services) {
            if ($service.Status -eq 'Running') {
                Write-Output "OK | Target: $target | Service: $($service.Name) | Status: $($service.Status)"
            } else {
                Write-Output "REVIEW | Target: $target | Service: $($service.Name) | Status: $($service.Status)"
            }
        }
    } catch {
        Write-Output "QUERY FAILED: $target | $($_.Exception.Message)"
    }
}