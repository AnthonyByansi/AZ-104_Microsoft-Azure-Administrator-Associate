# PowerShell script for identity protection setup

Connect-AzureAD
Set-AzureADMSRiskPolicy -PolicyType "UserRiskPolicy" -Enable $true -Notification $true
Write-Output "Identity Protection configured successfully."
