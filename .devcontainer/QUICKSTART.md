# Quick Start Guide - DevContainer

Welcome to your AZ-104 learning environment! This guide will get you started in 5 minutes.

## 5-Minute Quick Start

### Step 1: Open Container (if not already done)
- VS Code should prompt: "Reopen in Container"
- Click **Reopen in Container**
- Wait 5-10 minutes for first-time setup

### Step 2: Verify Setup
Open terminal (`Ctrl+~`) and run:
```bash
welcome
```

You should see the welcome message with all available tools.

### Step 3: Login to Azure
```bash
azlogin
```

This will:
1. Open browser for authentication
2. Show all your subscriptions
3. Set the default subscription

### Step 4: Select Your Subscription
```bash
azsetup
```

Follow the prompts to select your Azure subscription.

### Step 5: Create Your First Resource
```bash
# Create a resource group
create_rg "az104-quickstart-rg" "eastus"

# List all resource groups
azg
```

**Congratulations!** You're ready to start learning!

---

## What to Do Next

### Option 1: Explore Sample Scripts
```bash
cd ~/azure-samples
cat README.md
```

### Option 2: Follow a Tutorial
Navigate to the repository folders:
```bash
cd /workspaces/AZ-104_Microsoft-Azure-Administrator-Associate
ls -la
```

### Option 3: Practice Azure CLI
```bash
# Interactive mode
az interactive

# Or explore with AI help
az find "create vm"
```

### Option 4: Practice PowerShell
```bash
# Start PowerShell
pwsh

# Connect to Azure
Connect-AzAccount

# Explore commands
Get-Command -Module Az.Compute
```

---

## Common Tasks

### Create a Virtual Machine
```bash
# Quick VM creation
az vm create \
  --resource-group az104-quickstart-rg \
  --name myVM \
  --image UbuntuLTS \
  --size Standard_B2s \
  --admin-username azureuser \
  --generate-ssh-keys
```

### Create a Storage Account
```bash
# Using Bicep
cd ~/azure-samples/bicep
az deployment group create \
  --resource-group az104-quickstart-rg \
  --template-file storage-account.bicep
```

### Query Resources with Azure Resource Graph
```bash
# List all VMs
az graph query -q "Resources | where type =~ 'Microsoft.Compute/virtualMachines' | project name, location, resourceGroup"
```

### Practice KQL Queries
1. Open Azure Portal
2. Navigate to Log Analytics
3. Click on "Logs"
4. Try queries from `05-Monitor-and-Maintain-Resources/00-KQL/`

---

## Daily Learning Routine

### Morning (30 minutes)
1. Review one AZ-104 topic from the repo
2. Read documentation
3. Take notes

### Afternoon (60 minutes)
1. Follow hands-on tutorial
2. Practice in Azure Portal
3. Run sample scripts

### Evening (30 minutes)
1. Take practice quizzes
2. Review mistakes
3. Document learnings

---

## Pro Tips

### Tip 1: Use Tab Completion
```bash
az vm <TAB><TAB>  # Shows all vm subcommands
az vm create --<TAB><TAB>  # Shows all parameters
```

### Tip 2: Use --help
```bash
az vm create --help
az group --help
```

### Tip 3: Save Common Commands
Add to `~/.bashrc`:
```bash
alias create-test-rg='az group create --name az104-test-rg --location eastus'
alias cleanup='az group delete --name az104-test-rg --yes --no-wait'
```

Then run:
```bash
source ~/.bashrc
create-test-rg
```

### Tip 4: Use JSON Output for Scripting
```bash
# Get VM details as JSON
az vm show --resource-group myRG --name myVM --output json

# Extract specific field with jq
az vm show --resource-group myRG --name myVM --query "hardwareProfile.vmSize" -o tsv
```

### Tip 5: Clean Up Resources
Always clean up to avoid charges:
```bash
# Delete resource group and all resources
az group delete --name az104-quickstart-rg --yes --no-wait

# Or list and delete selectively
az resource list --resource-group az104-quickstart-rg -o table
az resource delete --ids <resource-id>
```

---

## Troubleshooting

### Problem: Azure login fails
**Solution:**
```bash
# Clear cached credentials
rm -rf ~/.azure
az login
```

### Problem: Subscription not found
**Solution:**
```bash
# List all subscriptions
az account list -o table

# Set correct subscription
az account set --subscription "YOUR-SUBSCRIPTION-NAME-OR-ID"
```

### Problem: Permission denied
**Solution:**
```bash
# Check your role
az role assignment list --assignee $(az account show --query user.name -o tsv) -o table

# You need at least "Contributor" role for most operations
```

### Problem: Command not found
**Solution:**
```bash
# Reload shell configuration
source ~/.bashrc

# Or restart terminal
exit
# Open new terminal
```

### Problem: DevContainer won't start
**Solution:**
1. Check Docker Desktop is running
2. Rebuild container: `F1` → "Dev Containers: Rebuild Container"
3. Check Docker has enough resources (4GB+ RAM)

---

## Learning Resources

### Official Documentation
- [Azure CLI Reference](https://docs.microsoft.com/cli/azure/reference-index)
- [Azure PowerShell Reference](https://docs.microsoft.com/powershell/azure/)
- [Azure Architecture Center](https://docs.microsoft.com/azure/architecture/)

### Practice Labs
- [Microsoft Learn - AZ-104](https://docs.microsoft.com/learn/certifications/exams/az-104)
- [Azure Free Account](https://azure.microsoft.com/free/)

### Community
- [Azure Reddit](https://reddit.com/r/AZURE)
- [Stack Overflow - Azure Tag](https://stackoverflow.com/questions/tagged/azure)
- [Microsoft Q&A](https://docs.microsoft.com/answers/topics/azure.html)

---

## Daily Checklist

Use this checklist to track your progress:

- [ ] Logged into Azure
- [ ] Reviewed one AZ-104 topic
- [ ] Completed one hands-on lab
- [ ] Practiced 10+ Azure CLI commands
- [ ] Took practice quiz
- [ ] Cleaned up test resources
- [ ] Committed code changes to Git

---

## Exam Preparation

### 30 Days Before Exam
- [ ] Complete all repository topics
- [ ] Take all practice quizzes
- [ ] Build sample projects
- [ ] Document common scenarios

### 14 Days Before Exam
- [ ] Review all notes
- [ ] Take full practice exams
- [ ] Identify weak areas
- [ ] Focus study on weaknesses

### 7 Days Before Exam
- [ ] Review cheatsheets
- [ ] Practice time management
- [ ] Light review only
- [ ] Get plenty of rest

### Day Before Exam
- [ ] Light review of notes
- [ ] Prepare materials (ID, confirmation)
- [ ] Relax and rest
- [ ] Early to bed

---

## Need Help?

1. Check the [DevContainer README](.devcontainer/README.md)
2. Review the [main README](../README.md)
3. Search [Azure documentation](https://docs.microsoft.com/azure)
4. Open an issue in the repository
5. Ask in Azure communities

---

**Remember:** Consistency is key! Study a little every day rather than cramming.

**Good luck with your AZ-104 certification!**
