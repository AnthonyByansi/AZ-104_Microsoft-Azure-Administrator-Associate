# 🌍 Multi-Region Deployment Strategies

<p align="center">
  <img src="https://img.shields.io/badge/Architecture_Patterns-10+-blue" alt="Patterns">
  <img src="https://img.shields.io/badge/Deployment_Templates-15+-green" alt="Templates">
  <img src="https://img.shields.io/badge/DR_Strategies-8+-orange" alt="DR">
</p>

Comprehensive guide to designing, implementing, and managing Azure multi-region deployments for high availability, disaster recovery, and global performance.

## 📚 Table of Contents

1. [Multi-Region Architecture Patterns](#multi-region-architecture-patterns)
2. [Traffic Management Strategies](#traffic-management-strategies)
3. [Data Replication Approaches](#data-replication-approaches)
4. [Disaster Recovery Plans](#disaster-recovery-plans)
5. [Deployment Templates](#deployment-templates)
6. [Cost Optimization](#cost-optimization)
7. [Monitoring & Failover](#monitoring--failover)
8. [Real-World Examples](#real-world-examples)

## 🏗️ Multi-Region Architecture Patterns

### Pattern 1: Active-Active (High Availability)

**Use Case**: Maximum availability, global performance, load distribution

```
┌─────────────────────────────────────────────────────────────┐
│                    Traffic Manager (DNS)                     │
│                  (Performance-based routing)                 │
└──────────────┬─────────────────────────┬────────────────────┘
               │                         │
    ┌──────────▼──────────┐   ┌─────────▼──────────┐
    │   Region: East US    │   │  Region: West EU   │
    │   ┌──────────────┐   │   │  ┌──────────────┐  │
    │   │  Web Apps    │   │   │  │  Web Apps    │  │
    │   │  (Active)    │   │   │  │  (Active)    │  │
    │   └──────┬───────┘   │   │  └──────┬───────┘  │
    │          │           │   │         │          │
    │   ┌──────▼───────┐   │   │  ┌──────▼───────┐  │
    │   │ SQL Database │◄──┼───┼──► SQL Database │  │
    │   │ (Read/Write) │   │   │  │ (Read/Write) │  │
    │   └──────────────┘   │   │  └──────────────┘  │
    │          ▲           │   │         ▲          │
    │   ┌──────┴───────┐   │   │  ┌──────┴───────┐  │
    │   │ Blob Storage │◄──┼───┼──► Blob Storage │  │
    │   │   (GRS-RA)   │   │   │  │   (GRS-RA)   │  │
    │   └──────────────┘   │   │  └──────────────┘  │
    └──────────────────────┘   └─────────────────────┘
```

**Characteristics**:
- ✅ Both regions serve production traffic
- ✅ Automatic load distribution
- ✅ Zero data loss (RPO = 0)
- ✅ Minimal downtime (RTO < 1 min)
- ❌ Higher cost (2x infrastructure)
- ❌ Complex data synchronization

**Implementation**:
```bicep
// Multi-region Active-Active deployment
param primaryLocation string = 'eastus'
param secondaryLocation string = 'westeurope'
param appName string = 'myapp'

// Traffic Manager Profile
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: '${appName}-tm'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Performance'
    dnsConfig: {
      relativeName: appName
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
      intervalInSeconds: 10
      toleratedNumberOfFailures: 2
      timeoutInSeconds: 5
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: appServicePrimary.id
          endpointStatus: 'Enabled'
          weight: 1
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: appServiceSecondary.id
          endpointStatus: 'Enabled'
          weight: 1
          priority: 1
        }
      }
    ]
  }
}

// Primary Region App Service
resource appServicePrimary 'Microsoft.Web/sites@2022-09-01' = {
  name: '${appName}-primary'
  location: primaryLocation
  properties: {
    serverFarmId: appServicePlanPrimary.id
    siteConfig: {
      healthCheckPath: '/health'
      alwaysOn: true
    }
  }
}

// Secondary Region App Service
resource appServiceSecondary 'Microsoft.Web/sites@2022-09-01' = {
  name: '${appName}-secondary'
  location: secondaryLocation
  properties: {
    serverFarmId: appServicePlanSecondary.id
    siteConfig: {
      healthCheckPath: '/health'
      alwaysOn: true
    }
  }
}

// Cosmos DB (Multi-region writes)
resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${appName}-cosmos'
  location: primaryLocation
  properties: {
    databaseAccountOfferType: 'Standard'
    enableMultipleWriteLocations: true
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
    locations: [
      {
        locationName: primaryLocation
        failoverPriority: 0
        isZoneRedundant: true
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
        isZoneRedundant: true
      }
    ]
  }
}
```

---

### Pattern 2: Active-Passive (Disaster Recovery)

**Use Case**: Cost-effective DR, acceptable downtime, single primary region

```
┌─────────────────────────────────────────────────────────────┐
│               Azure Front Door / Traffic Manager             │
│                   (Priority-based routing)                   │
└──────────────┬─────────────────────────┬────────────────────┘
               │ (Primary)               │ (Standby)
    ┌──────────▼──────────┐   ┌─────────▼──────────┐
    │   Region: East US    │   │  Region: West US   │
    │   ┌──────────────┐   │   │  ┌──────────────┐  │
    │   │  Web Apps    │   │   │  │  Web Apps    │  │
    │   │  (ACTIVE)    │   │   │  │  (STANDBY)   │  │
    │   └──────┬───────┘   │   │  └──────────────┘  │
    │          │           │   │                     │
    │   ┌──────▼───────┐   │   │  ┌──────────────┐  │
    │   │ SQL Database │───┼───┼─►│ SQL Database │  │
    │   │  (Primary)   │   │   │  │  (Secondary) │  │
    │   │  Read/Write  │   │   │  │  Read-Only   │  │
    │   └──────────────┘   │   │  └──────────────┘  │
    │          │           │   │         ▲          │
    │   ┌──────▼───────┐   │   │         │          │
    │   │ Blob Storage │   │   │  (Auto-replicated) │
    │   │     (GRS)    │───┼───┼─────────┘          │
    │   └──────────────┘   │   │                     │
    └──────────────────────┘   └─────────────────────┘
                │
                │ (Manual failover)
                ▼
           DR Runbook
```

**Characteristics**:
- ✅ Lower cost (1x primary + minimal standby)
- ✅ Simpler configuration
- ✅ Good for most scenarios
- ❌ Some data loss possible (RPO 5-15 min)
- ❌ Longer recovery time (RTO 15 min - 1 hour)
- ❌ Requires failover process

**Failover Automation**:
```powershell
# Automated DR Failover Script
param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupPrimary,
    
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupSecondary,
    
    [Parameter(Mandatory=$true)]
    [string]$TrafficManagerProfile
)

function Invoke-DRFailover {
    Write-Host "🚨 INITIATING DISASTER RECOVERY FAILOVER" -ForegroundColor Red
    
    # Step 1: Disable primary endpoint
    Write-Host "1️⃣ Disabling primary endpoint..."
    az network traffic-manager endpoint update `
        --name "primary-endpoint" `
        --profile-name $TrafficManagerProfile `
        --resource-group $ResourceGroupPrimary `
        --type azureEndpoints `
        --endpoint-status Disabled
    
    # Step 2: Failover SQL Database
    Write-Host "2️⃣ Failing over SQL Database..."
    $sqlServers = Get-AzSqlServer -ResourceGroupName $ResourceGroupPrimary
    foreach ($server in $sqlServers) {
        $failoverGroup = Get-AzSqlDatabaseFailoverGroup `
            -ResourceGroupName $ResourceGroupPrimary `
            -ServerName $server.ServerName
        
        Switch-AzSqlDatabaseFailoverGroup `
            -ResourceGroupName $ResourceGroupSecondary `
            -ServerName $failoverGroup.PartnerServerName `
            -FailoverGroupName $failoverGroup.FailoverGroupName `
            -AllowDataLoss
    }
    
    # Step 3: Enable secondary endpoint
    Write-Host "3️⃣ Enabling secondary endpoint..."
    az network traffic-manager endpoint update `
        --name "secondary-endpoint" `
        --profile-name $TrafficManagerProfile `
        --resource-group $ResourceGroupSecondary `
        --type azureEndpoints `
        --endpoint-status Enabled `
        --priority 1
    
    # Step 4: Scale up secondary resources
    Write-Host "4️⃣ Scaling secondary resources..."
    $appServices = Get-AzWebApp -ResourceGroupName $ResourceGroupSecondary
    foreach ($app in $appServices) {
        Set-AzWebApp `
            -ResourceGroupName $ResourceGroupSecondary `
            -Name $app.Name `
            -NumberOfWorkers 3  # Scale to production capacity
    }
    
    # Step 5: Verify failover
    Write-Host "5️⃣ Verifying failover..."
    Start-Sleep -Seconds 30
    
    $healthCheck = Invoke-WebRequest -Uri "https://$TrafficManagerProfile.trafficmanager.net/health" -UseBasicParsing
    if ($healthCheck.StatusCode -eq 200) {
        Write-Host "✅ FAILOVER SUCCESSFUL" -ForegroundColor Green
    } else {
        Write-Host "❌ FAILOVER VERIFICATION FAILED" -ForegroundColor Red
    }
    
    # Step 6: Send notifications
    Write-Host "6️⃣ Sending notifications..."
    Send-AlertNotification -Message "DR failover completed to secondary region"
}

# Execute failover
Invoke-DRFailover
```

---

### Pattern 3: Hub-Spoke Multi-Region

**Use Case**: Enterprise scenarios with centralized governance

```
              ┌─────────────────────────────┐
              │   Azure Front Door (Global) │
              └──────────┬──────────┬────────┘
                         │          │
        ┌────────────────┴────┐     └────────────────┐
        │                     │                      │
┌───────▼─────────┐   ┌───────▼──────────┐  ┌───────▼─────────┐
│  Region: East US │   │ Region: West EU  │  │ Region: SE Asia │
│                  │   │                  │  │                 │
│  ┌────────────┐  │   │  ┌────────────┐ │  │ ┌─────────────┐ │
│  │ Hub VNet   │  │   │  │ Hub VNet   │ │  │ │  Hub VNet   │ │
│  │ 10.1.0.0/16│  │   │  │ 10.2.0.0/16│ │  │ │ 10.3.0.0/16 │ │
│  └──┬──────┬──┘  │   │  └──┬──────┬──┘ │  │ └──┬──────┬───┘ │
│     │      │     │   │     │      │    │  │    │      │     │
│  ┌──▼──┐┌──▼──┐  │   │  ┌──▼──┐┌──▼──┐ │  │ ┌──▼──┐┌──▼──┐  │
│  │Spoke││Spoke│  │   │  │Spoke││Spoke│ │  │ │Spoke││Spoke│ │
│  │Prod ││Dev  │  │   │  │Prod ││Dev  │ │  │ │Prod ││Dev  │ │
│  └─────┘└─────┘  │   │  └─────┘└─────┘ │  │ └─────┘└─────┘  │
└──────────────────┘   └──────────────────┘  └──────────────────┘
         │                     │                      │
         └─────────────────────┴──────────────────────┘
                    Global VNet Peering
```

---

## 🌐 Traffic Management Strategies

### Strategy 1: Performance-Based Routing

**Best For**: Global applications with users worldwide

```json
{
  "trafficRoutingMethod": "Performance",
  "description": "Routes users to closest region based on latency"
}
```

**Benefits**:
- Lowest latency for users
- Automatic geographic distribution
- No manual configuration per region

### Strategy 2: Geographic Routing

**Best For**: Data sovereignty, compliance requirements

```json
{
  "trafficRoutingMethod": "Geographic",
  "endpoints": [
    {
      "name": "europe-endpoint",
      "geo-mapping": ["GEO-EU"]
    },
    {
      "name": "us-endpoint",
      "geo-mapping": ["GEO-NA"]
    }
  ]
}
```

**Use Cases**:
- GDPR compliance (EU data stays in EU)
- China data residency
- Regional content delivery

### Strategy 3: Priority-Based (Failover)

**Best For**: Active-passive DR scenarios

```json
{
  "trafficRoutingMethod": "Priority",
  "endpoints": [
    {
      "name": "primary",
      "priority": 1
    },
    {
      "name": "secondary",
      "priority": 2
    }
  ]
}
```

---

## 💾 Data Replication Approaches

### Approach 1: Cosmos DB Multi-Master

**Characteristics**:
- Global distribution
- Multi-region writes
- Automatic conflict resolution

```bicep
resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'global-app-cosmos'
  location: 'eastus'
  properties: {
    enableMultipleWriteLocations: true
    enableAutomaticFailover: true
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
      maxStalenessPrefix: 100
      maxIntervalInSeconds: 5
    }
    locations: [
      { locationName: 'eastus', failoverPriority: 0, isZoneRedundant: true }
      { locationName: 'westeurope', failoverPriority: 1, isZoneRedundant: true }
      { locationName: 'southeastasia', failoverPriority: 2, isZoneRedundant: true }
    ]
  }
}
```

### Approach 2: SQL Active Geo-Replication

**Characteristics**:
- Up to 4 readable secondaries
- Automatic continuous replication
- Manual failover control

```sql
-- Create geo-replica
ALTER DATABASE [myDatabase]
ADD SECONDARY ON SERVER [secondary-server]
WITH (
    SERVICE_OBJECTIVE = 'S3',
    ALLOW_CONNECTIONS = ALL
);

-- Failover group (automatic failover)
CREATE FAILOVER GROUP [myFailoverGroup]
FOR DATABASE [myDatabase]
WITH (
    PARTNER_SERVER = 'secondary-server',
    FAILOVER_POLICY = Automatic,
    GRACE_PERIOD = 1 hour
);
```

### Approach 3: Storage Account Replication

**Options**:

| Type | Description | RPO | RTO | Cost |
|------|-------------|-----|-----|------|
| **LRS** | Local redundancy | Minutes | Minutes | $ |
| **ZRS** | Zone redundancy | Minutes | Minutes | $$ |
| **GRS** | Geo redundancy (read-only secondary) | Hours | Hours | $$$ |
| **GZRS** | Geo-zone redundancy | Hours | Hours | $$$$ |
| **RA-GRS** | Read-access geo redundancy | Hours | Minutes | $$$ |

```bash
# Change replication type
az storage account update \
  --name mystorageaccount \
  --resource-group myRG \
  --sku Standard_RAGRS
```

---

## 🚨 Disaster Recovery Plans

### DR Plan Template

```markdown
# Disaster Recovery Plan

## Objectives
- **RPO (Recovery Point Objective)**: 15 minutes
- **RTO (Recovery Time Objective)**: 1 hour
- **Data Loss Tolerance**: < 100 transactions

## Roles & Responsibilities
| Role | Person | Contact | Responsibility |
|------|--------|---------|---------------|
| DR Commander | John Doe | +1-555-0100 | Overall coordination |
| Azure Admin | Jane Smith | +1-555-0101 | Failover execution |
| Database Admin | Bob Johnson | +1-555-0102 | Data verification |
| Network Admin | Alice Brown | +1-555-0103 | DNS/routing changes |

## Failover Procedures

### Phase 1: Assessment (15 minutes)
1. Confirm primary region is down
2. Check secondary region health
3. Notify stakeholders
4. Get approval to proceed

### Phase 2: Failover (30 minutes)
1. Execute failover script
2. Verify database failover
3. Update DNS records
4. Scale secondary resources
5. Verify application health

### Phase 3: Verification (15 minutes)
1. Test critical user flows
2. Check data integrity
3. Monitor error rates
4. Confirm with stakeholders

### Phase 4: Communication
1. Update status page
2. Notify customers
3. Internal communication
4. Post-mortem scheduling

## Testing Schedule
- **Tabletop Exercise**: Monthly
- **Partial Failover Test**: Quarterly
- **Full DR Test**: Annually

## Rollback Plan
If failover fails:
1. Revert DNS changes
2. Restart primary region services
3. Investigate and fix issues
4. Retry failover after fixes
```

---

## 💰 Cost Optimization

### Multi-Region Cost Calculator

```python
def calculate_multi_region_cost(regions, workload_type):
    """Calculate estimated monthly cost for multi-region deployment"""
    
    base_costs = {
        'active-active': {
            'compute': 2.0,  # Full capacity in both regions
            'storage': 1.5,  # GRS replication
            'network': 1.8,  # Cross-region traffic
            'database': 2.0  # Geo-replication
        },
        'active-passive': {
            'compute': 1.3,  # Primary + minimal standby
            'storage': 1.5,  # GRS replication
            'network': 1.2,  # Less cross-region traffic
            'database': 1.5  # Geo-replication
        },
        'backup-only': {
            'compute': 1.0,  # Single region
            'storage': 1.3,  # Backup storage
            'network': 1.0,  # No cross-region
            'database': 1.0  # No geo-replication
        }
    }
    
    baseline_monthly_cost = 5000  # Single region cost
    multiplier = base_costs[workload_type]
    
    total_cost = sum([
        baseline_monthly_cost * multiplier['compute'],
        500 * multiplier['storage'],
        300 * multiplier['network'],
        1000 * multiplier['database']
    ])
    
    return {
        'monthly_cost': total_cost,
        'annual_cost': total_cost * 12,
        'cost_increase': ((total_cost / baseline_monthly_cost) - 1) * 100
    }

# Example
active_active_cost = calculate_multi_region_cost(2, 'active-active')
print(f"Monthly Cost: ${active_active_cost['monthly_cost']:,.2f}")
print(f"Cost Increase: {active_active_cost['cost_increase']:.1f}%")
```

---

## 📊 Real-World Examples

### Example 1: E-Commerce Platform (Black Friday Ready)

**Requirements**:
- Handle 1000x traffic spike
- Zero downtime
- Global customer base

**Architecture**:
- Active-Active in 5 regions
- Azure Front Door with WAF
- Cosmos DB multi-master
- Auto-scaling (10-500 instances)
- CDN for static content

**Results**:
- 99.99% uptime during Black Friday
- <200ms global latency
- 0 data loss
- Handled 50M requests/hour

---

## 🎓 Best Practices

- [ ] **Always test failover** before you need it
- [ ] **Automate everything** - manual failover takes too long
- [ ] **Monitor cross-region latency** continuously
- [ ] **Document runbooks** with screenshots
- [ ] **Practice quarterly** DR drills
- [ ] **Consider costs** vs benefits for each region
- [ ] **Use infrastructure as code** for consistency
- [ ] **Implement health checks** at every layer
- [ ] **Plan for data sovereignty** requirements
- [ ] **Set realistic RPO/RTO** based on business needs

---

## 🏆 AZ-104 Exam Focus

**Key Topics**:
- Traffic Manager routing methods
- Geo-replication types and capabilities
- Failover groups for SQL
- Storage replication options
- Cost implications of multi-region
- RPO vs RTO definitions

**Common Questions**:
- When to use active-active vs active-passive
- Which storage replication type for specific scenarios
- How to configure Traffic Manager
- Understanding failover priority
- Calculating costs for geo-redundancy

---

**Next Steps**:
- Lab: [Deploy Multi-Region App](./labs/multi-region-lab.md)
- Template: [Bicep Multi-Region Starter](./templates/multi-region-starter.bicep)
- Challenge: [Build Global Application](./challenges/global-app.md)
