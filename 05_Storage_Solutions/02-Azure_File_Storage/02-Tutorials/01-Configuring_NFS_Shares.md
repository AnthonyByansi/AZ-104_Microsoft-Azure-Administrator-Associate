## **How to Mount Azure File Shares Using SMB**

Azure File Storage allows you to mount file shares to your operating system using the SMB protocol, enabling seamless integration with existing file systems.

---

#### **Steps to Mount SMB Shares**

1. **Prerequisites**
   - An Azure Storage account with a file share created. Refer to the [Azure File Storage documentation](https://learn.microsoft.com/azure/storage/files/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352) for guidance.
   - SMB 3.0 support (required for encryption in transit).
   - Appropriate permissions for the storage account.

---

2. **Mounting on Windows**

   1. Open PowerShell and log in to Azure:
      ```powershell
      Connect-AzAccount
      ```
   2. Retrieve the storage account key:
      ```powershell
      $StorageAccountName = "<your-storage-account>"
      $ResourceGroupName = "<your-resource-group>"
      $StorageKey = (Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -AccountName $StorageAccountName).Value[0]
      ```
   3. Use the following command to mount the file share:
      ```powershell
      New-PSDrive -Name Z -PSProvider FileSystem -Root "\\<storage-account-name>.file.core.windows.net\<share-name>" -Credential (New-Object PSCredential("<storage-account-name>", (ConvertTo-SecureString $StorageKey -AsPlainText -Force)))
      ```

---

3. **Mounting on Linux**

   1. Install the necessary CIFS utilities:
      ```bash
      sudo apt-get install cifs-utils
      ```
   2. Create a directory for the mount point:
      ```bash
      sudo mkdir /mnt/azurefiles
      ```
   3. Mount the share using the SMB protocol:
      ```bash
      sudo mount -t cifs //<storage-account-name>.file.core.windows.net/<share-name> /mnt/azurefiles -o vers=3.0,username=<storage-account-name>,password=<storage-key>,dir_mode=0777,file_mode=0777
      ```

---

#### **Important Notes**
- Use **private endpoints** to secure access to Azure File Storage.  
- Regularly rotate storage account keys for security.

For more details, visit the [official Azure SMB documentation](https://learn.microsoft.com/azure/storage/files/storage-how-to-use-files-windows?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).
