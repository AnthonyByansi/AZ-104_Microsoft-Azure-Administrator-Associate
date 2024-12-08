#!/bin/bash
# Enable PIM for a tenant

az login
az ad role-assignment create \
    --assignee "<user-or-group-id>" \
    --role "Privileged Identity Administrator" \
    --scope "/subscriptions/<subscription-id>"
echo "PIM enabled successfully."
