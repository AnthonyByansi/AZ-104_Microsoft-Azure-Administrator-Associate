# PowerShell script to configure PIM

Connect-AzureAD
$role = Get-AzureADDirectoryRole | Where-Object { $_.DisplayName -eq "Privileged Identity Administrator" }
New-AzureADMSRoleAssignment -RoleDefinitionId $role.Id -PrincipalId "<user-or-group-id>"
Write-Output "PIM role configured successfully."
