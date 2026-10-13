# Name: Nelson
# Challenge: 02
# Purpose: Build domain qualified names using string expansion


$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
$domain = 'Adatum.com'

foreach ($computer in $computers) {
    $fqdn = "$computer.$domain"
    Write-Output $fqdn
}