$COSMOSDB_ACCOUNT="neighborly-cosmosdbacc"
$RESOURCE_GROUP="neighborly-rg"
$DATABASE_NAME="neighborly-db"
$CREATE_LEASE_COLLECTION=0     # yes,no=(1,0)

$SAMPLE_COLLECTION="advertisements"
$SAMPLE_COLLECTION2="posts"

# Get your CosmosDB key and save as a variable
$COSMOSDB_KEY=az cosmosdb keys list --name $COSMOSDB_ACCOUNT --resource-group $RESOURCE_GROUP --output tsv | awk '{print $1}'
# COSMOSDB_KEY = awk '{print $1}' tsv

az cosmosdb create `
    -n $COSMOSDB_ACCOUNT `
    -g $RESOURCE_GROUP `
	--kind MongoDB  
    

az cosmosdb mongodb database create `
    -a $COSMOSDB_ACCOUNT `
    -g $RESOURCE_GROUP `
    -n $DATABASE_NAME
		
az cosmosdb mongodb collection create `
    -a $COSMOSDB_ACCOUNT `
    -g $RESOURCE_GROUP `
    -d $DATABASE_NAME `
    -n $SAMPLE_COLLECTION `
    --shard 'user_id' `
    --throughput 400 `
	
az cosmosdb mongodb collection create `
    -a $COSMOSDB_ACCOUNT `
    -g $RESOURCE_GROUP `
    -d $DATABASE_NAME `
    -n $SAMPLE_COLLECTION2 `
    --shard 'user_id' `
    --throughput 400 `
