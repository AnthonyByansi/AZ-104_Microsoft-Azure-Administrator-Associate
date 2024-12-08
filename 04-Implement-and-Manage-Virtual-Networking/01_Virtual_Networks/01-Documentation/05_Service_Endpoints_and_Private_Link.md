
# Service Endpoints and Private Link in VNets

## What Are Service Endpoints?
Service Endpoints extend your VNet identity to Azure services, improving security.

### Supported Services
- Azure Storage
- Azure SQL Database
- Cosmos DB

## What is Private Link?
Private Link enables private access to Azure services via private IPs within your VNet.

### Comparison
| **Feature**        | **Service Endpoint**             | **Private Link**               |
|---------------------|----------------------------------|---------------------------------|
| Traffic Path        | Public network with restrictions| Fully private network traffic. |
| Use Cases           | Limited service security.       | Fully secure access.           |
| Dependency          | Requires NSG rules.             | No additional dependencies.    |

For more, refer to:
- [Service Endpoints Documentation](https://learn.microsoft.com/azure/virtual-network/virtual-network-service-endpoints-overview?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
- [Private Link Documentation](https://learn.microsoft.com/azure/private-link/?WT.mc_id=%3Fwt.mc_id%3Dstudentamb_260352)
