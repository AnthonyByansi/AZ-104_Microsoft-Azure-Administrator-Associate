#!/bin/bash
# Configure identity alerts using Action Groups

az monitor action-group create \
    --resource-group "<resource-group>" \
    --name "IdentityAlerts" \
    --short-name "IdAlert" \
    --action email admin@yourdomain.com
echo "Identity alerts configured successfully."
