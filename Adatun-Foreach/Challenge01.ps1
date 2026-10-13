# Name: Nelson
# Challenge: 01
# Purpose: List the lab computers using a foreach loop


$computers = @('LON-CL1', 'LON-DC1', 'LON-SVR1')
foreach ($computer in $computers) {
    Write-Output "Computer: $computer"
}