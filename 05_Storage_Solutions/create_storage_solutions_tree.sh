#!/bin/bash

# Define the structure as an array of file paths
declare -a structure=(
    # Azure Blob Storage
    "Azure_Blob_Storage/Documentation/Overview.md"
    "Azure_Blob_Storage/Documentation/Use_Cases.md"
    "Azure_Blob_Storage/Documentation/Exam_Notes.md"
    "Azure_Blob_Storage/Documentation/FAQ.md"
    "Azure_Blob_Storage/Tutorials/Lifecycle_Management.md"
    "Azure_Blob_Storage/Tutorials/Access_Tokens_and_SAS.md"
    "Azure_Blob_Storage/Tutorials/Static_Website_Hosting.md"
    "Azure_Blob_Storage/Code_Samples/ARM_Templates/blob-storage-with-lifecycle.json"
    "Azure_Blob_Storage/Code_Samples/Bicep_Files/blob-storage-config.bicep"
    "Azure_Blob_Storage/Code_Samples/Terraform/main.tf"
    "Azure_Blob_Storage/Code_Samples/Python_SDK/upload_blob.py"
    "Azure_Blob_Storage/Code_Samples/PowerShell/create-blob-container.ps1"
    
    # Azure File Storage
    "Azure_File_Storage/Documentation/Overview.md"
    "Azure_File_Storage/Documentation/Use_Cases.md"
    "Azure_File_Storage/Documentation/Exam_Notes.md"
    "Azure_File_Storage/Documentation/Troubleshooting.md"
    "Azure_File_Storage/Tutorials/Mounting_SMB_Shares.md"
    "Azure_File_Storage/Tutorials/Using_Azure_File_Sync.md"
    "Azure_File_Storage/Tutorials/Configuring_NFS_Shares.md"
    "Azure_File_Storage/Code_Samples/ARM_Templates/file-share-config.json"
    "Azure_File_Storage/Code_Samples/Bicep_Files/file-share-deployment.bicep"
    "Azure_File_Storage/Code_Samples/Terraform/file-storage.tf"
    "Azure_File_Storage/Code_Samples/CLI_Scripts/mount-smb-share.sh"
    "Azure_File_Storage/Code_Samples/PowerShell/configure-file-sync.ps1"
    
    # Azure Disk Storage
    "Azure_Disk_Storage/Documentation/Overview.md"
    "Azure_Disk_Storage/Documentation/Disk_Types.md"
    "Azure_Disk_Storage/Documentation/Use_Cases.md"
    "Azure_Disk_Storage/Documentation/Exam_Notes.md"
    "Azure_Disk_Storage/Tutorials/Attaching_Disks_to_VMs.md"
    "Azure_Disk_Storage/Tutorials/Creating_Snapshots.md"
    "Azure_Disk_Storage/Tutorials/Resizing_Managed_Disks.md"
    "Azure_Disk_Storage/Code_Samples/ARM_Templates/managed-disk-config.json"
    "Azure_Disk_Storage/Code_Samples/Bicep_Files/disk-creation.bicep"
    "Azure_Disk_Storage/Code_Samples/Terraform/vm-with-disk.tf"
    "Azure_Disk_Storage/Code_Samples/Python_SDK/attach_disk.py"
    "Azure_Disk_Storage/Code_Samples/PowerShell/resize-disk.ps1"
    
    # Storage Security
    "Storage_Security/Overview.md"
    "Storage_Security/Encryption.md"
    "Storage_Security/RBAC_And_ACL_Management.md"
    "Storage_Security/Private_Endpoints.md"
    "Storage_Security/Code_Samples/ARM_Templates/secure-storage-account.json"
    "Storage_Security/Code_Samples/Bicep_Files/storage-private-endpoint.bicep"
    "Storage_Security/Code_Samples/Terraform/secure-storage.tf"
    "Storage_Security/Code_Samples/CLI_Scripts/configure-private-endpoint.sh"
    "Storage_Security/Code_Samples/PowerShell/setup-rbac.ps1"
    
    # Storage Migration
    "Storage_Migration/Data_Box_Gateway.md"
    "Storage_Migration/Data_Box_Devices.md"
    "Storage_Migration/Azure_Migrate.md"
    "Storage_Migration/Code_Samples/ARM_Templates/data-box-gateway.json"
    "Storage_Migration/Code_Samples/Terraform/data-migration.tf"
    "Storage_Migration/Code_Samples/CLI_Scripts/migrate-data.sh"
    "Storage_Migration/Code_Samples/PowerShell/configure-data-box.ps1"
    
    # Monitoring and Optimization
    "Monitoring_And_Optimization/Documentation/Cost_Optimization.md"
    "Monitoring_And_Optimization/Documentation/Metrics_and_Alerts.md"
    "Monitoring_And_Optimization/Documentation/Quota_Management.md"
    "Monitoring_And_Optimization/Code_Samples/ARM_Templates/alert-config.json"
    "Monitoring_And_Optimization/Code_Samples/Terraform/monitoring-config.tf"
    "Monitoring_And_Optimization/Code_Samples/Python_SDK/monitor_metrics.py"
    "Monitoring_And_Optimization/Code_Samples/PowerShell/configure-alerts.ps1"
    
    # Exam Practice
    "Exam_Practice/Quiz_Questions.md"
    "Exam_Practice/Case_Studies.md"
    "Exam_Practice/Hands_On_Labs.md"
)

# Create the directory structure
for path in "${structure[@]}"; do
    mkdir -p "$(dirname "$path")" # Create directories
    touch "$path"                # Create empty files
done

echo "Directory structure created successfully!"
