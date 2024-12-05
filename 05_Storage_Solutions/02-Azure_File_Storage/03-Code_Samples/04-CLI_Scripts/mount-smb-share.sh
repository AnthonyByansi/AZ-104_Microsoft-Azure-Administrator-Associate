#!/bin/bash

STORAGE_ACCOUNT_NAME="mystorageaccount"
SHARE_NAME="myshare"
MOUNT_POINT="/mnt/azurefiles"
STORAGE_KEY=$(az storage account keys list --resource-group myResourceGroup --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Install necessary tools
sudo apt-get update
sudo apt-get install -y cifs-utils

# Create mount point
sudo mkdir -p $MOUNT_POINT

# Mount the file share
sudo mount -t cifs //$STORAGE_ACCOUNT_NAME.file.core.windows.net/$SHARE_NAME $MOUNT_POINT -o vers=3.0,username=$STORAGE_ACCOUNT_NAME,password=$STORAGE_KEY,dir_mode=0777,file_mode=0777

echo "File share mounted at $MOUNT_POINT"
