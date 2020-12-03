param webAppName string {
  minLength: 2
  metadata: {
    description: 'Base name of the resource such as web app name and app service plan '
  }
  default: 'AzureLinuxApp'
}
param sku string {
  metadata: {
    description: 'The SKU of App Service Plan '
  }
  default: 'S1'
}
param linuxFxVersion string {
  metadata: {
    description: 'The Runtime stack of current web app'
  }
  default: 'php|7.0'
}
param location string {
  metadata: {
    description: 'Location for all resources.'
  }
  default: resourceGroup().location
}

var webAppPortalName_var = '${webAppName}-webapp'
var appServicePlanName_var = 'AppServicePlan-${webAppName}'

resource appServicePlanName 'Microsoft.Web/serverfarms@2019-08-01' = {
  name: appServicePlanName_var
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webAppPortalName 'Microsoft.Web/sites@2019-08-01' = {
  name: webAppPortalName_var
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}