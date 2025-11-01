# VS Code DevContainer for AZ-104 Learning

This DevContainer provides a complete, consistent Azure learning environment with all tools pre-installed and configured.

## What's Included

### Core Tools
- **Azure CLI** (latest) - Command-line tool for Azure management
- **Azure PowerShell** (Az modules) - PowerShell cmdlets for Azure
- **Bicep** - Domain-specific language for ARM templates
- **Terraform** - Infrastructure as Code tool
- **Docker** - Container platform
- **kubectl** - Kubernetes CLI
- **Python 3.11** - With Azure SDK
- **Node.js 18** - With Azure SDK
- **Git** - Version control

### VS Code Extensions
- Azure Account & Resource Groups
- Azure Functions, App Service, Storage
- Azure Virtual Machines
- Bicep & ARM Template support
- PowerShell & Python
- Terraform
- Docker & Kubernetes
- REST Client
- KQL syntax highlighting
- Markdown tools
- Git integration

### Pre-installed Utilities
- `curl`, `wget`, `jq`, `httpie`
- `vim`, `nano`, `tree`
- Azure CLI extensions (DevOps, Log Analytics, Resource Graph)
- Python packages (azure-*, pandas, matplotlib)
- Node packages (@azure/*)

## Getting Started

### Prerequisites
1. **Docker Desktop** - [Download](https://www.docker.com/products/docker-desktop)
2. **VS Code** - [Download](https://code.visualstudio.com/)
3. **Dev Containers Extension** - [Install](vscode:extension/ms-vscode-remote.remote-containers)

### Quick Start

#### Option 1: Open in DevContainer
1. Clone this repository
2. Open in VS Code
3. Click "Reopen in Container" when prompted
   - Or press `F1` → "Dev Containers: Reopen in Container"
4. Wait for container to build (first time: ~5-10 minutes)
5. Run `azlogin` to authenticate with Azure

#### Option 2: Open with Command Palette
1. Press `F1` or `Ctrl+Shift+P`
2. Type "Dev Containers: Clone Repository in Container Volume"
3. Enter: `https://github.com/AnthonyByansi/AZ-104_Microsoft-Azure-Administrator-Associate`
4. Wait for setup to complete

## First Steps After Setup

### 1. Authenticate with Azure
```bash
# Bash
azlogin

# Or using Azure CLI directly
az login

# PowerShell
pwsh
Connect-AzAccount
```

### 2. Set Your Subscription
```bash
# Interactive setup
azsetup

# Or manually
az account list -o table
az account set --subscription "YOUR-SUBSCRIPTION-ID"
```

### 3. Verify Installation
```bash
# Check Azure CLI
az --version

# Check Azure PowerShell
pwsh -Command "Get-InstalledModule -Name Az"

# Check Terraform
terraform --version

# Check Bicep
az bicep version

# Check Python packages
pip3 list | grep azure

# Check kubectl
kubectl version --client
```

## Sample Scripts

Pre-configured sample scripts are available in `~/azure-samples/`:

```
azure-samples/
├── bash/
│   └── create-vm.sh          # Create VM with Azure CLI
├── powershell/
│   └── Create-VM.ps1         # Create VM with PowerShell
├── python/
│   └── list_vms.py           # List VMs with Python SDK
├── terraform/
│   └── main.tf               # Sample Terraform config
├── bicep/
│   └── storage-account.bicep # Sample Bicep template
└── README.md
```

### Run Samples
```bash
# Bash sample
cd ~/azure-samples/bash
./create-vm.sh

# Python sample
cd ~/azure-samples/python
python3 list_vms.py

# Terraform sample
cd ~/azure-samples/terraform
terraform init
terraform plan
```

## Configuration

### Environment Variables

Create a `.env` file in the workspace root:

```bash
AZURE_SUBSCRIPTION_ID=your-subscription-id
AZURE_TENANT_ID=your-tenant-id
AZURE_LOCATION=eastus
```

### Persistent Azure Credentials

Azure credentials are automatically mounted from your host machine:
- Linux/Mac: `~/.azure` → `/home/vscode/.azure`
- Windows: `%USERPROFILE%\.azure` → `/home/vscode/.azure`

This means you only need to login once!

### Custom Settings

Edit `.devcontainer/devcontainer.json` to customize:
- Additional VS Code extensions
- Port forwarding
- Environment variables
- Post-create commands

## Useful Commands & Aliases

### Azure CLI Aliases
```bash
azl          # az login
azls         # az account list -o table
azs          # az account set --subscription
azg          # az group list -o table
azvm         # az vm list -o table
```

### Helper Functions
```bash
azlogin                               # Login and show subscriptions
azsetup                              # Interactive subscription setup
create_rg <name> <location>          # Create resource group
list_resources <resource-group>      # List resources in RG
welcome                              # Show welcome message
```

### Git Aliases
```bash
gs           # git status
ga           # git add
gc           # git commit
gp           # git push
gl           # git log --oneline
```

### Docker Aliases
```bash
d            # docker
dc           # docker-compose
dps          # docker ps
di           # docker images
```

### Kubernetes Aliases
```bash
k            # kubectl
kgp          # kubectl get pods
kgs          # kubectl get services
kgd          # kubectl get deployments
```

## Learning Workflows

### Workflow 1: Practice Azure CLI
```bash
# Create test resource group
create_rg az104-lab-rg eastus

# List resources
list_resources az104-lab-rg

# Deploy from template
az deployment group create \
  --resource-group az104-lab-rg \
  --template-file ./templates/vm.json

# Clean up
az group delete --name az104-lab-rg --yes --no-wait
```

### Workflow 2: Practice PowerShell
```powershell
# Open PowerShell
pwsh

# Connect to Azure
Connect-AzAccount

# Create resource group
New-AzResourceGroup -Name "az104-lab-rg" -Location "eastus"

# List resources
Get-AzResource -ResourceGroupName "az104-lab-rg"

# Clean up
Remove-AzResourceGroup -Name "az104-lab-rg" -Force
```

### Workflow 3: Practice Bicep
```bash
# Navigate to Bicep samples
cd ~/azure-samples/bicep

# Build Bicep to ARM
az bicep build --file storage-account.bicep

# Deploy
az deployment group create \
  --resource-group myRG \
  --template-file storage-account.bicep \
  --parameters sku=Standard_GRS
```

### Workflow 4: Practice Terraform
```bash
# Navigate to Terraform samples
cd ~/azure-samples/terraform

# Initialize
terraform init

# Plan
terraform plan -out=plan.tfplan

# Apply
terraform apply plan.tfplan

# Destroy
terraform destroy -auto-approve
```

## Troubleshooting

### Container won't start
1. Ensure Docker Desktop is running
2. Check Docker has enough resources (4GB+ RAM recommended)
3. Try rebuilding: `F1` → "Dev Containers: Rebuild Container"

### Azure CLI not authenticated
```bash
# Clear cached credentials
rm -rf ~/.azure

# Login again
az login
```

### PowerShell module errors
```powershell
# Update Az modules
Update-Module -Name Az -Force

# Import modules manually
Import-Module Az.Accounts
Import-Module Az.Resources
```

### Python SDK issues
```bash
# Reinstall Azure packages
pip3 install --upgrade --force-reinstall azure-cli azure-mgmt-compute
```

### VS Code extension issues
1. Press `F1`
2. Run "Developer: Reload Window"
3. If persists, rebuild container

## Resource Usage

### Container Specs
- **Base Image**: Ubuntu 22.04
- **Estimated Size**: ~5-6 GB after build
- **RAM Usage**: 500MB-1GB idle, 2-4GB active
- **CPU**: Minimal when idle

### Optimizations
- Build cache is used for faster rebuilds
- APT packages are cached
- Python/Node packages are cached
- Only essential tools included

## Security Best Practices

1. **Never commit credentials** to Git
   - Use `.env` files (already in `.gitignore`)
   - Use Azure Managed Identities when possible

2. **Use Service Principals** for automation
   ```bash
   az ad sp create-for-rbac --name "az104-devcontainer" \
     --role Contributor \
     --scopes /subscriptions/YOUR-SUB-ID
   ```

3. **Regularly update** the container
   ```bash
   # Rebuild with latest updates
   F1 → "Dev Containers: Rebuild Container"
   ```

4. **Review extension permissions** before installing new ones

## Additional Resources

- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure/)
- [Azure PowerShell Documentation](https://docs.microsoft.com/powershell/azure/)
- [Bicep Documentation](https://docs.microsoft.com/azure/azure-resource-manager/bicep/)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/)
- [Azure SDK for Python](https://docs.microsoft.com/python/azure/)
- [Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)

## Contributing

Found an issue or want to improve the DevContainer?

1. Fork the repository
2. Make your changes to `.devcontainer/`
3. Test thoroughly
4. Submit a pull request

## License

This DevContainer configuration is part of the AZ-104 study repository and follows the same MIT license.

---

**Happy Learning!**

If you have questions, check the [main README](../README.md) or open an issue.
