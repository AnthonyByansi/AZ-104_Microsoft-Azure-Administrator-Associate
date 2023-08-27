#!/bin/bash

# Create directories
mkdir -p AzureAdminPro/{01_Azure_Services/{ARM_Templates,Code_Samples},02_Virtual_Networks,03_Identity_Management,04_Networking_Connectivity,05_Storage_Solutions,06_Monitoring_Management,07_Security_Best_Practices,08_Cost_Optimization,09_Containerization_AKS,10_Interactive_Quizzes,11_Hands-On_Labs}

# Create files
touch AzureAdminPro/{README.md,Prerequisites.md,CONTRIBUTING.md,LICENSE,.gitignore}
touch AzureAdminPro/01_Azure_Services/{Azure_Services.md,Code_Samples/azure_service_example.py}
touch AzureAdminPro/01_Azure_Services/ARM_Templates/{virtual_machine.json,storage_account.json}
touch AzureAdminPro/02_Virtual_Networks/{Virtual_Networks.md,VNet_ARM_Template.json,VPN_Setup_Guide.md}
touch AzureAdminPro/03_Identity_Management/{Identity_Management.md,Azure_AD_Configuration.md,RBAC_Guide.md}
touch AzureAdminPro/04_Networking_Connectivity/{Networking_Connectivity.md,Virtual_Network_Peering.md,ExpressRoute_Setup.md}
touch AzureAdminPro/05_Storage_Solutions/{Storage_Solutions.md,Blob_Storage_Guide.md,Azure_Files_Demo.md}
touch AzureAdminPro/06_Monitoring_Management/{Monitoring_Management.md,Azure_Monitor_Setup.md,Log_Analytics_Configuration.md}
touch AzureAdminPro/07_Security_Best_Practices/{Security_Best_Practices.md,Azure_AD_Security.md,NSG_Firewall_Setup.md}
touch AzureAdminPro/08_Cost_Optimization/{Cost_Optimization.md,Azure_Cost_Management.md,Budgeting_Strategies.md}
touch AzureAdminPro/09_Containerization_AKS/{Containerization_AKS.md,Docker_Setup_Guide.md,AKS_Deployment.md}
touch AzureAdminPro/10_Interactive_Quizzes/{Quiz_01_Azure_Services.md,Quiz_02_Virtual_Networks.md}
touch AzureAdminPro/11_Hands-On_Labs/{Lab_01_ARM_Template_Deployment.md,Lab_02_Azure_Monitoring.md}

echo "Az-104 repo structure created successfully!"
