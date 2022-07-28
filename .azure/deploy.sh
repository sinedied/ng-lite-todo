#!/usr/bin/env bash
##############################################################################
# Usage: ./deploy.sh <environment_name>
# Deploys the Azure resources for this project.
##############################################################################

set -e
cd $(dirname ${BASH_SOURCE[0]})
if [ -f ".settings" ]; then
  source .settings
fi

environment="${environment:-prod}"
environment="${1:-$environment}"

if [ ! -f ".${environment}.env" ]; then
  echo "Error: file '.${environment}.env' not found."
  exit 1
fi
source ".${environment}.env"

echo "Deploying environment '${environment}'..."

client_id="$(echo $AZURE_CREDENTIALS | jq -r .clientId)"
client_secret="$(echo $AZURE_CREDENTIALS | jq -r .clientSecret)"
subscription_id="$(echo $AZURE_CREDENTIALS | jq -r .subscriptionId)"
tenant_id="$(echo $AZURE_CREDENTIALS | jq -r .tenantId)"

cd ..
swa deploy \
  --output-location "dist/ng-lite-app" \
  --app-name "${static_app_name}" \
  --resource-group "${resource_group_name}" \
  --tenant-id "${tenant_id}" \
  --subscription-id "${subscription_id}" \
  --client-id "${client_id}" \
  --client-secret "${client_secret}" \
  --env "production" \
  --verbose

echo "Deployment complete for environment '${environment}'."
