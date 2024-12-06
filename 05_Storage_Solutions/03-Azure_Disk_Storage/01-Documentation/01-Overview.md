# Azure Disk Storage Overview

Azure Disk Storage is a high-performance, scalable block storage solution designed for Azure Virtual Machines (VMs). It offers robust data durability, flexibility, and integration with Azure’s ecosystem, making it ideal for various workloads, including mission-critical applications.

## Key Features
- **Performance Tiers:** Choose from Standard HDD, Standard SSD, Premium SSD, and Ultra Disk to meet specific workload requirements.
- **Managed Disks:** Automatically handles storage account management for greater simplicity.
- **Resilience and Durability:** Provides 99.999% availability with triple data replication.
- **Dynamic Scalability:** Adjust performance and capacity without downtime.
- **Snapshot and Backup:** Easily create snapshots for data backup and disaster recovery.

### Supported Disk Types:
| **Disk Type**       | **Performance**           | **Use Cases**                                                                 |
|----------------------|---------------------------|-------------------------------------------------------------------------------|
| Standard HDD         | Economical, low IOPS     | Development/testing, non-critical workloads                                  |
| Standard SSD         | Cost-effective SSD       | Web servers, lightly used applications                                      |
| Premium SSD          | High performance         | Enterprise apps, transactional databases                                    |
| Ultra Disk           | Ultra-high throughput    | Mission-critical databases, analytics                                       |

For more details, visit the [Azure Disk Storage documentation](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-overview).

