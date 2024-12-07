# blob-storage-with-lifecycle.json
This ARM (Azure Resource Manager) template is designed to deploy an Azure Blob Storage account with a lifecycle management policy. The policy automates transitions of data between storage tiers (Hot, Cool, and Archive) to optimize costs based on data access patterns.

- Creates a general-purpose V2 storage account.
- Configures a lifecycle management policy to transition blobs from the Hot tier to Cool after 30 days of inactivity and to Archive after 120 days.

### Instructions
Save the file as blob-storage-with-lifecycle.json.

Deploy the template using Azure CLI:
```bash
az deployment group create \
  --resource-group <resource-group-name> \
  --template-file blob-storage-with-lifecycle.json
Replace <resource-group-name> with your Azure resource group.
```
### Learn More:
- [ARM Template Schema Reference](https://learn.microsoft.com/azure/azure-resource-manager/templates/syntax?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Azure Lifecycle Management](https://learn.microsoft.com/azure/storage/blobs/lifecycle-management-policy-configure?tabs=azure-portal&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)


## blob-storage-config.bicep
This Bicep file simplifies the deployment of an Azure Blob Storage account with default configurations, supporting integration with other Azure resources.

### Deployment Steps
- Save the file as blob-storage-config.bicep.
- Deploy using Azure CLI:
```bash
az deployment group create \
  --resource-group <resource-group-name> \
  --template-file blob-storage-config.bicep
```
- Update the parameters (e.g., storageAccountName, skuName) as needed.

### Learn More
- [Bicep Language Overview](https://learn.microsoft.com/azure/azure-resource-manager/bicep/overview?tabs=bicep&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Azure Storage Account Docs](https://learn.microsoft.com/azure/storage/common/storage-account-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)

## main.tf
This Terraform configuration file provisions an Azure Blob Storage account and a container within it. It supports deploying scalable and secure storage solutions while leveraging Terraform for infrastructure as code (IaC).

### Steps to Use
- Initialize Terraform in the directory containing the file: `terraform init`
- Review the plan before applying changes: `terraform plan`
- Deploy the infrastructure:`terraform apply`

### Learn More
- [Terraform Azure Provider Docs](https://learn.microsoft.com/azure/developer/terraform/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Azure Storage Account Overview](https://learn.microsoft.com/azure/storage/common/storage-account-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)

## upload_blob.py
This Python script demonstrates how to upload a blob to Azure Blob Storage using the Azure SDK for Python. It ensures secure and efficient blob management.

### Steps to Run

- Install the Azure Blob SDK: `pip install azure-storage-blob`
- Replace placeholders (<account_name>, <account_key>) with actual values from your Azure Storage account.
- Run the script: `python upload_blob.py`

### Learn More

- [Azure Blob Storage Python SDK](https://learn.microsoft.com/azure/storage/blobs/storage-quickstart-blobs-python?tabs=managed-identity%2Croles-azure-portal%2Csign-in-azure-cli&pivots=blob-storage-quickstart-scratch&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Blob Client Methods](https://learn.microsoft.com/python/api/azure-storage-blob/azure.storage.blob.blobclient?view=azure-python&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)

## create-blob-container.ps1

This PowerShell script automates the creation of a blob container in Azure Storage. It uses the Azure PowerShell module for seamless integration.

### Steps to Run

- Install Azure PowerShell: `Install-Module -Name Az -AllowClobber -Scope CurrentUser`
- Replace the variables `($ResourceGroupName, $StorageAccountName, $ContainerName)` with actual values.
- Run the script: `.\create-blob-container.ps1`

### Learn More

[Azure PowerShell Overview](https://learn.microsoft.com/powershell/azure/what-is-azure-powershell?view=azps-13.0.0&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
[Blob Storage PowerShell Module](https://learn.microsoft.com/azure/storage/blobs/blob-containers-powershell?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)