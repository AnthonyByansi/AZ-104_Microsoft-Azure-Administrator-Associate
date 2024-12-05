# Replace with your storage account name and resource group
$ResourceGroupName = "my-blob-storage-rg"
$StorageAccountName = "mystorageaccount"
$ContainerName = "mycontainer"

# Login to Azure
Connect-AzAccount

# Get the storage account key
$StorageKey = (Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -AccountName $StorageAccountName).Value[0]

# Create a storage context
$StorageContext = New-AzStorageContext -StorageAccountName $StorageAccountName -StorageAccountKey $StorageKey

# Create the blob container
New-AzStorageContainer -Name $ContainerName -Context $StorageContext -Permission Off

Write-Host "Blob container '$ContainerName' created successfully in storage account '$StorageAccountName'."
