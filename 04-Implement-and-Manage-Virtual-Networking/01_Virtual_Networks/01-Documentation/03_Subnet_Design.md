# Subnet Design Best Practices

## What are Subnets?
Subnets are logical subdivisions of a Virtual Network. They improve manageability, security, and performance by segmenting the network.

## Design Recommendations
1. **Divide by Tier**:
   - Frontend (Web) Tier
   - Application Tier
   - Backend (Database) Tier

2. **Reserve Addresses**:
   - Azure reserves 5 IPs per subnet.

### Example Design
| **Tier**          | **CIDR Block** | **Purpose**                |
|--------------------|----------------|----------------------------|
| Web Frontend       | `10.0.0.0/24`  | Host web servers.          |
| Application Logic  | `10.0.1.0/24`  | Host application servers.  |
| Database Backend   | `10.0.2.0/24`  | Securely host databases.   |

For more details, visit the [Azure Subnets documentation](https://learn.microsoft.com/azure/virtual-network/virtual-network-manage-subnet?tabs=azure-portal&WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352).

