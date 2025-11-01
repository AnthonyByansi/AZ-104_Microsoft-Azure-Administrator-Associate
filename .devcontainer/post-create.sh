#!/bin/bash
set -e

echo "Setting up AZ-104 Learning Environment..."

# Update system
echo "Updating package lists..."
sudo apt-get update -qq

# Install common utilities
echo "Installing utilities..."
sudo apt-get install -y -qq \
    curl \
    wget \
    git \
    jq \
    vim \
    nano \
    httpie \
    tree \
    unzip \
    zip \
    ca-certificates \
    gnupg \
    lsb-release

# Install Azure PowerShell modules
echo "Installing Azure PowerShell modules..."
pwsh -Command "Install-Module -Name Az -Repository PSGallery -Force -AllowClobber -Scope CurrentUser"
pwsh -Command "Install-Module -Name Az.Tools.Predictor -Repository PSGallery -Force -AllowClobber -Scope CurrentUser"
pwsh -Command "Install-Module -Name PSReadLine -Repository PSGallery -Force -AllowClobber -Scope CurrentUser"

# Install Python packages for Azure
echo "Installing Python packages..."
pip3 install --upgrade pip
pip3 install --quiet \
    azure-cli \
    azure-identity \
    azure-mgmt-compute \
    azure-mgmt-network \
    azure-mgmt-resource \
    azure-mgmt-storage \
    azure-storage-blob \
    azure-cosmos \
    azure-keyvault-secrets \
    azure-monitor-query \
    requests \
    python-dotenv \
    pyyaml \
    pandas \
    matplotlib

# Install Azure Functions Core Tools
echo "Installing Azure Functions Core Tools..."
wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update -qq
sudo apt-get install -y -qq azure-functions-core-tools-4

# Install Bicep CLI (if not already installed by Azure CLI feature)
echo "Ensuring Bicep is installed..."
az bicep install 2>/dev/null || true
az bicep upgrade 2>/dev/null || true

# Install additional Azure CLI extensions
echo "Installing Azure CLI extensions..."
az extension add --name azure-devops --yes 2>/dev/null || true
az extension add --name application-insights --yes 2>/dev/null || true
az extension add --name log-analytics --yes 2>/dev/null || true
az extension add --name account --yes 2>/dev/null || true
az extension add --name resource-graph --yes 2>/dev/null || true
az extension add --name front-door --yes 2>/dev/null || true

# Install Node.js packages for Azure
echo "Installing Node.js packages..."
npm install -g --silent \
    @azure/functions \
    azure-storage \
    @azure/cosmos

# Install terraform-docs for documentation
echo "Installing terraform-docs..."
wget -q https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz
tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz
sudo mv terraform-docs /usr/local/bin/
rm terraform-docs-v0.16.0-linux-amd64.tar.gz

# Install tflint
echo "Installing tflint..."
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# Set up bash aliases and functions
echo "Configuring shell aliases..."
cat >> ~/.bashrc << 'EOF'

# Azure CLI Aliases
alias azl='az login'
alias azls='az account list -o table'
alias azs='az account set --subscription'
alias azg='az group list -o table'
alias azvm='az vm list -o table'
alias azweb='az webapp list -o table'
alias azstorage='az storage account list -o table'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'

# Kubernetes aliases
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'

# Terraform aliases
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# Helpful functions
azlogin() {
    echo "Logging into Azure..."
    az login
    az account list -o table
}

azsetup() {
    echo "Setting up Azure context..."
    echo "Available subscriptions:"
    az account list -o table
    read -p "Enter subscription ID or name: " SUB
    az account set --subscription "$SUB"
    echo "Active subscription:"
    az account show -o table
}

create_rg() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: create_rg <resource-group-name> <location>"
        echo "Example: create_rg myResourceGroup eastus"
        return 1
    fi
    az group create --name "$1" --location "$2"
    echo "Resource group '$1' created in '$2'"
}

list_resources() {
    if [ -z "$1" ]; then
        echo "Usage: list_resources <resource-group-name>"
        return 1
    fi
    az resource list --resource-group "$1" -o table
}

# Display welcome message
welcome() {
    echo ""
    echo "╔═══════════════════════════════════════════════════════════════╗"
    echo "║   AZ-104 Azure Administrator Learning Environment             ║"
    echo "╚═══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Available Tools:"
    echo "   • Azure CLI (az)"
    echo "   • Azure PowerShell (pwsh)"
    echo "   • Terraform (terraform)"
    echo "   • Bicep (az bicep)"
    echo "   • kubectl (kubectl)"
    echo "   • Docker (docker)"
    echo "   • Python 3.11 with Azure SDK"
    echo "   • Node.js 18 with Azure SDK"
    echo ""
    echo "Quick Start Commands:"
    echo "   azlogin          - Login to Azure"
    echo "   azsetup          - Setup Azure subscription"
    echo "   create_rg        - Create resource group"
    echo "   list_resources   - List resources in RG"
    echo ""
    echo "Documentation: https://docs.microsoft.com/azure"
    echo "Tips: Type 'alias' to see all available shortcuts"
    echo ""
}
EOF

# Set up PowerShell profile
echo "Configuring PowerShell profile..."
mkdir -p ~/.config/powershell
cat >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1 << 'EOF'
# Azure PowerShell aliases
Set-Alias -Name azl -Value Connect-AzAccount
Set-Alias -Name tf -Value terraform

# Import Azure modules
Import-Module Az.Accounts -ErrorAction SilentlyContinue
Import-Module Az.Resources -ErrorAction SilentlyContinue
Import-Module Az.Compute -ErrorAction SilentlyContinue
Import-Module Az.Network -ErrorAction SilentlyContinue
Import-Module Az.Storage -ErrorAction SilentlyContinue

# Enable prediction
Import-Module Az.Tools.Predictor -ErrorAction SilentlyContinue
Set-PSReadLineOption -PredictionSource History -ErrorAction SilentlyContinue

# Welcome message
function Show-AzureWelcome {
    Write-Host ""
    Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║   AZ-104 Azure Administrator Learning Environment             ║" -ForegroundColor Cyan
    Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Available Modules:" -ForegroundColor Yellow
    Write-Host "   • Az.Accounts" -ForegroundColor White
    Write-Host "   • Az.Resources" -ForegroundColor White
    Write-Host "   • Az.Compute" -ForegroundColor White
    Write-Host "   • Az.Network" -ForegroundColor White
    Write-Host "   • Az.Storage" -ForegroundColor White
    Write-Host ""
    Write-Host "Quick Start:" -ForegroundColor Yellow
    Write-Host "   Connect-AzAccount         - Login to Azure" -ForegroundColor White
    Write-Host "   Get-AzSubscription        - List subscriptions" -ForegroundColor White
    Write-Host "   Set-AzContext             - Set active subscription" -ForegroundColor White
    Write-Host "   Get-AzResourceGroup       - List resource groups" -ForegroundColor White
    Write-Host ""
}

# Helper functions
function Quick-AzLogin {
    Write-Host "Logging into Azure..." -ForegroundColor Cyan
    Connect-AzAccount
    Get-AzSubscription | Format-Table
}

function New-AzResourceGroupQuick {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [string]$Location
    )
    New-AzResourceGroup -Name $Name -Location $Location
    Write-Host "Resource group '$Name' created in '$Location'" -ForegroundColor Green
}

Set-Alias -Name azlogin -Value Quick-AzLogin
Set-Alias -Name create-rg -Value New-AzResourceGroupQuick
EOF

# Create sample scripts directory
echo "Creating sample scripts directory..."
mkdir -p ~/azure-samples/{powershell,bash,python,terraform,bicep}

# Create sample Azure CLI script
cat > ~/azure-samples/bash/create-vm.sh << 'EOF'
#!/bin/bash
# Sample script to create a VM

RESOURCE_GROUP="az104-lab-rg"
VM_NAME="az104-vm"
LOCATION="eastus"
IMAGE="UbuntuLTS"
SIZE="Standard_B2s"

echo "Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating VM..."
az vm create \
    --resource-group $RESOURCE_GROUP \
    --name $VM_NAME \
    --image $IMAGE \
    --size $SIZE \
    --admin-username azureuser \
    --generate-ssh-keys \
    --output json \
    --verbose

echo "Opening port 80..."
az vm open-port --resource-group $RESOURCE_GROUP --name $VM_NAME --port 80

echo "VM created successfully!"
az vm show --resource-group $RESOURCE_GROUP --name $VM_NAME --show-details
EOF

chmod +x ~/azure-samples/bash/create-vm.sh

# Create sample PowerShell script
cat > ~/azure-samples/powershell/Create-VM.ps1 << 'EOF'
# Sample PowerShell script to create a VM

$resourceGroup = "az104-lab-rg"
$vmName = "az104-vm"
$location = "eastus"

Write-Host "Creating resource group..." -ForegroundColor Cyan
New-AzResourceGroup -Name $resourceGroup -Location $location

Write-Host "Creating VM..." -ForegroundColor Cyan
$cred = Get-Credential -Message "Enter VM admin credentials"

New-AzVm `
    -ResourceGroupName $resourceGroup `
    -Name $vmName `
    -Location $location `
    -Size "Standard_B2s" `
    -Image "UbuntuLTS" `
    -Credential $cred `
    -OpenPorts 80,443

Write-Host "VM created successfully!" -ForegroundColor Green
Get-AzVM -ResourceGroupName $resourceGroup -Name $vmName
EOF

# Create sample Python script
cat > ~/azure-samples/python/list_vms.py << 'EOF'
#!/usr/bin/env python3
"""
Sample Python script to list VMs using Azure SDK
"""
from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient
from azure.mgmt.resource import SubscriptionClient
import os

def list_virtual_machines():
    # Authenticate
    credential = DefaultAzureCredential()
    
    # Get subscription ID
    subscription_client = SubscriptionClient(credential)
    subscription = next(subscription_client.subscriptions.list())
    subscription_id = subscription.subscription_id
    
    print(f"Listing VMs in subscription: {subscription.display_name}")
    print(f"Subscription ID: {subscription_id}\n")
    
    # Create compute client
    compute_client = ComputeManagementClient(credential, subscription_id)
    
    # List all VMs
    print("Virtual Machines:")
    print("-" * 80)
    
    for vm in compute_client.virtual_machines.list_all():
        print(f"Name: {vm.name}")
        print(f"  Location: {vm.location}")
        print(f"  Size: {vm.hardware_profile.vm_size}")
        print(f"  OS: {vm.storage_profile.os_disk.os_type}")
        print(f"  Resource Group: {vm.id.split('/')[4]}")
        print()

if __name__ == "__main__":
    list_virtual_machines()
EOF

chmod +x ~/azure-samples/python/list_vms.py

# Create sample Bicep template
cat > ~/azure-samples/bicep/storage-account.bicep << 'EOF'
// Sample Bicep template for storage account
param storageAccountName string = 'stor${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Premium_LRS'
])
param sku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: sku
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
EOF

# Create sample Terraform configuration
cat > ~/azure-samples/terraform/main.tf << 'EOF'
# Sample Terraform configuration for Azure VM

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "az104-terraform-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "example" {
  name                = "az104-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
EOF

# Create README for samples
cat > ~/azure-samples/README.md << 'EOF'
# Azure Sample Scripts

This directory contains sample scripts for AZ-104 learning.

## Directory Structure

- `bash/` - Azure CLI bash scripts
- `powershell/` - Azure PowerShell scripts
- `python/` - Python scripts using Azure SDK
- `terraform/` - Terraform configurations
- `bicep/` - Bicep templates

## Quick Start

### Bash Scripts
```bash
cd bash
./create-vm.sh
```

### PowerShell Scripts
```powershell
cd powershell
./Create-VM.ps1
```

### Python Scripts
```bash
cd python
python3 list_vms.py
```

### Terraform
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Bicep
```bash
cd bicep
az deployment group create \
  --resource-group myRG \
  --template-file storage-account.bicep
```

## Learning Resources

- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure/)
- [Azure PowerShell Documentation](https://docs.microsoft.com/powershell/azure/)
- [Azure SDK for Python](https://docs.microsoft.com/python/azure/)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/)
- [Bicep Documentation](https://docs.microsoft.com/azure/azure-resource-manager/bicep/)
EOF

# Set proper permissions
chmod +x ~/azure-samples/bash/*.sh
chmod +x ~/azure-samples/python/*.py

# Create .env template
cat > ~/.env.template << 'EOF'
# Azure Configuration
AZURE_SUBSCRIPTION_ID=
AZURE_TENANT_ID=
AZURE_CLIENT_ID=
AZURE_CLIENT_SECRET=
AZURE_LOCATION=eastus

# Resource naming
RESOURCE_PREFIX=az104
ENVIRONMENT=dev
EOF

# Clean up
echo "Cleaning up..."
sudo apt-get autoremove -y -qq
sudo apt-get clean -qq

# Display welcome message
echo ""
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║   AZ-104 Learning Environment Setup Complete!                 ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""
echo "Next Steps:"
echo "   1. Run 'azlogin' to authenticate with Azure"
echo "   2. Run 'azsetup' to select your subscription"
echo "   3. Explore sample scripts in ~/azure-samples/"
echo "   4. Check out the README.md in the repository"
echo ""
echo "Pro Tips:"
echo "   • Use 'az interactive' for an interactive CLI experience"
echo "   • Use 'az find' to search for commands"
echo "   • Run 'welcome' anytime to see the welcome message"
echo ""
echo "Happy Learning!"
echo ""

# Source bashrc to apply changes
source ~/.bashrc
