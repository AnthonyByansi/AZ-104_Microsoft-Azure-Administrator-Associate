# Azure Disk Types

Azure Disk Storage supports four main types of managed disks to cater to diverse workload needs. Below is a comparison of the disk types:

| **Feature**           | **Standard HDD**            | **Standard SSD**             | **Premium SSD**             | **Ultra Disk**              |
|------------------------|-----------------------------|------------------------------|-----------------------------|-----------------------------|
| **Performance Tier**   | Entry-level                | Balanced                     | High-performance            | Ultra-performance           |
| **IOPS (max)**         | Up to 500                  | Up to 6,000                  | Up to 20,000                | Up to 160,000               |
| **Throughput (MB/s)**  | Up to 60                   | Up to 750                    | Up to 900                   | Up to 4,000                 |
| **Ideal Workloads**    | Cold storage, backups      | Web servers, testing         | Databases, ERP systems      | Mission-critical workloads  |

## Selecting the Right Disk
- Use **Standard HDD** for non-critical or archival purposes.
- Choose **Standard SSD** for moderate workloads with better performance at a reasonable cost.
- Opt for **Premium SSD** for low-latency, high-IOPS applications.
- Deploy **Ultra Disk** for the most demanding workloads like SAP HANA or large-scale databases.

### Pricing
Disk pricing varies based on type, size, and region. For up-to-date pricing, refer to the [Azure Disk Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/).