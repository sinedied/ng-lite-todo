// ---------------------------------------------------------------------------
// Global parameters 
// ---------------------------------------------------------------------------

@minLength(1)
@maxLength(24)
@description('The name of your project')
param projectName string

@minLength(1)
@maxLength(10)
@description('The name of the environment')
param environment string = 'prod'

@description('The Azure region where all resources will be created')
param location string = 'eastus2'

// ---------------------------------------------------------------------------

var commonTags = {
  project: projectName
  environment: environment
}

var uid = uniqueString(resourceGroup().id, projectName, environment, location)

resource staticWebApp 'Microsoft.Web/staticSites@2021-03-01' = {
  name: 'swa-${projectName}-${environment}-${uid}'
  location: location
  tags: commonTags
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
  }
}

output resourceGroupName string = resourceGroup().name
output staticWebAppName string = staticWebApp.name
output staticWevAppUrl string = staticWebApp.properties.defaultHostname
