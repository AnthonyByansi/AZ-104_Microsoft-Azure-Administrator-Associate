$definition = New-AzPolicyDefinition -Name "EnforceTags" -Policy '{
    "if": {
        "not": {
            "field": "tags",
            "exists": true
        }
    },
    "then": {
        "effect": "modify",
        "details": {
            "field": "tags",
            "value": {
                "Environment": "Production"
            }
        }
    }
}' -Description "Enforce tags on resources" -DisplayName "Enforce Tags Policy"
