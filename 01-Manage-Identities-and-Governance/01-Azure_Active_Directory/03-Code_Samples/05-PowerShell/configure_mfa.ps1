$policy = New-AzADMSConditionalAccessPolicy -DisplayName "MFA for All Users" -State Enabled -GrantControls @{
    BuiltInControls = @("mfa")
} -Conditions @{
    Users = @{
        IncludeUsers = @("All")
    }
}
