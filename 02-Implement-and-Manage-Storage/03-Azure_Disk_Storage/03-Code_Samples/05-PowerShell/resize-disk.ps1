# Variables
$ResourceGroupName = "myResourceGroup"
$DiskName = "example-disk"
$NewDiskSizeGB = 256

# Get the existing disk
$disk = Get-AzDisk -ResourceGroupName $ResourceGroupName -DiskName $DiskName

# Update the disk size
$disk.DiskSizeGB = $NewDiskSizeGB
Update-AzDisk -Disk $disk -ResourceGroupName $ResourceGroupName

Write-Output "Disk $DiskName resized to $NewDiskSizeGB GB"
