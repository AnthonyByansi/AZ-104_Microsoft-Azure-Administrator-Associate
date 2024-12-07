New-AzADUser -DisplayName "John Doe" -UserPrincipalName "jdoe@example.com" -PasswordProfile @{
    Password = "ComplexPassword123!"
    ForceChangePasswordNextLogin = $false
} -MailNickname "jdoe"
