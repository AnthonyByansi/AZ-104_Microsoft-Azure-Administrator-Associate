# IP Addressing in Azure Virtual Network

## Address Space
VNets require a CIDR block to define their address space (e.g., `10.0.0.0/16`).

### Recommendations:
| **Aspect**           | **Guideline**                                     |
|-----------------------|--------------------------------------------------|
| CIDR Block Size       | Use `/16` for large networks, `/24` for smaller. |
| Avoid Overlaps        | Ensure no overlap with on-premises CIDRs.        |

## Types of IP Addresses
1. **Private IPs**: Used for communication within the network.
2. **Public IPs**: Used to communicate with the internet.

### Subnetting Example
| **Subnet** | **CIDR**       | **Purpose**       |
|------------|----------------|-------------------|
| Web-Tier   | `10.0.1.0/24`  | Web servers.      |
| App-Tier   | `10.0.2.0/24`  | Application logic.|
| DB-Tier    | `10.0.3.0/24`  | Databases.        |

For detailed guidance, check out the [IP addressing documentation](https://learn.microsoft.com/azure/virtual-network/ip-services/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).
