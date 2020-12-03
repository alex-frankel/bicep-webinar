targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'bicep-webinar-rg'
  location: 'eastus'
}

module webAppMod './web-app.bicep' = {
  name: 'webAppDeploy'
  scope: resourceGroup(rg.name)
  params: {
    webAppName: 'adotfrankweb'
  }
}