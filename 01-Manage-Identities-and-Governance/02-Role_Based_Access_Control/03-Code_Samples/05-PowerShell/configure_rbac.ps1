# Variables
$RoleDefinition = "Contributor"
$PrincipalId = "<Principal_ID>"
$Scope = "/subscriptions/<Subscription_ID>"

# Assign Role
New-AzRoleAssignment -ObjectId $PrincipalId -RoleDefinitionName $RoleDefinition -Scope $Scope

Write-Output "Role $RoleDefinition assigned to $PrincipalId."
