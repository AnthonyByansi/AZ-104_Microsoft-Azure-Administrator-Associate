param tenantId string
param aadConnectConfig object

resource aadConnect 'Microsoft.ADHybridHealthService/services@2019-10-01' = {
  name: 'HybridAADConnect'
  properties: aadConnectConfig
}
