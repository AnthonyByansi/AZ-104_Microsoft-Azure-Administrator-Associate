# Variables
$StorageAccountName = "mystorageaccount"
$ResourceGroupName = "myResourceGroup"
$SyncServiceName = "mySyncService"
$FileShareName = "myshare"
$ServerEndpointPath = "C:\AzureFiles"

# Install Azure File Sync agent
Write-Host "Installing Azure File Sync Agent..."
Invoke-WebRequest -Uri https://aka.ms/azfilesyncagent -OutFile .\StorageSyncAgent.msi
Start-Process .\StorageSyncAgent.msi -Wait

# Register the server
Write-Host "Registering the server with Azure File Sync..."
Start-Process -FilePath "C:\Program Files\Azure\StorageSyncAgent\ServerRegistration.exe" -Wait

# Create a sync group
Write-Host "Creating Sync Group..."
New-AzStorageSyncService -ResourceGroupName $ResourceGroupName -StorageSyncServiceName $SyncServiceName
New-AzStorageSyncGroup -ResourceGroupName $ResourceGroupName -StorageSyncServiceName $SyncServiceName -SyncGroupName "mySyncGroup"

# Create a server endpoint
Write-Host "Creating Server Endpoint..."
Register-AzStorageSyncServer -ResourceGroupName $ResourceGroupName -StorageSyncServiceName $SyncServiceName -SyncGroupName "mySyncGroup" -Path $ServerEndpointPath
