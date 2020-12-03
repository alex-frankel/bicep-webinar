targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'bicep-webinar-rg'
  location: 'eastus'
}

module app './web-app.bicep' = {
  name: 'webapp-deploy'
  scope: resourceGroup(rg.name)
  params: {
    webAppName: 'adotfrankwebapp'
  }
}