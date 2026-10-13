# Name: Nelson
# Challenge: 07
# Purpose: Apply foreach and if to AD user objects and two counters


Import-Module ActiveDirectory
$users = @(Get-ADUser -Filter * -Server LON-DC1.Adatum.com)
$enabledCount = 0
$disabledCount = 0

foreach ($user in $users) {
    if ($user.Enabled) {
        Write-Output "Enabled: $($user.SamAccountName)"
        $enabledCount++
    } else {
        Write-Output "Disabled: $($user.SamAccountName)"
        $disabledCount++
    }
}

Write-Output "Total captured users: $($users.Count)"
Write-Output "Enabled count: $enabledCount"
Write-Output "Disabled count: $disabledCount"