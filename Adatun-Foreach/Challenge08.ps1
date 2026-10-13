# Name: Nelson
# Challenge: 08
# Purpose: Use a Boolean result from Test-Connection to classify each computer


$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
$domain = 'Adatum.com'
$replyCount = 0

foreach ($computer in $computers) {
    $fqdn = "$computer.$domain"
    $ping = Test-Connection -ComputerName $fqdn -Count 1 -Quiet -ErrorAction SilentlyContinue
    
    if ($ping) {
        Write-Output "ICMP reply: $fqdn"
        $replyCount++
    } else {
        Write-Output "No ICMP reply: $fqdn"
    }
}

Write-Output "Total ICMP replies: $replyCount"