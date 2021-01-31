$RESOURCE_GROUP="neighborly-rg"
$REGION="westeurope"

# This is the new account here
$COSMOS_ACCOUNT="neighborly-cosmosdbacc"

az cosmosdb create -n $COSMOS_ACCOUNT -g $RESOURCE_GROUP  `
--kind MongoDB `
--locations regionName=$REGION failoverPriority=0 isZoneRedundant=False 