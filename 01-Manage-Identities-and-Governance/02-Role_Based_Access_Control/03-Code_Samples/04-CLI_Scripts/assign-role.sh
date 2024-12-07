#!/bin/bash

# Variables
ROLE="Contributor"
PRINCIPAL_ID="<Principal_ID>"
SCOPE="/subscriptions/<Subscription_ID>/"

# Assign Role
az role assignment create --assignee $PRINCIPAL_ID --role $ROLE --scope $SCOPE

echo "Role $ROLE assigned to $PRINCIPAL_ID."
