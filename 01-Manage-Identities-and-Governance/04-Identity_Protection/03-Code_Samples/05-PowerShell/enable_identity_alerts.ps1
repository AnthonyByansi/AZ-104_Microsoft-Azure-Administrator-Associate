# PowerShell script to enable identity alerts

Connect-AzAccount
New-AzActionGroup -Name "IdentityAlerts" -ShortName "IdAlert" -ResourceGroupName "<resource-group>" `
    -ReceiverEmail "admin@yourdomain.com"
Write-Output "Identity alerts enabled successfully."
