param location string = resourceGroup().location
param storageAccountName string = 'uniqueString001'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  kind: 'Storage'
  sku: {
    name: 'Standard_GRS'
  }
}