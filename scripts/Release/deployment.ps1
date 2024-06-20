# Mi script para hacer deployment

$private:armRoot = "$PSScriptRoot\..\..\src\WinGet.RestSource.Infrastructure"
$private:tenant = "72f988bf-86f1-41af-91ab-2d7cd011db47"
$private:subscription = "a811107b-baf7-4d9f-9b79-2404197e9b8c"
$private:resourceGroup = "rg-rubengurest"

Connect-AzAccount -tenant $tenant -SubscriptionId $subscription

# KeyVault
# No lo hice pq me dio hueva las access policies.

Write-Host "Deploy AppInsights"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\ApplicationInsights\applicationinsights.json" -TemplateParameterFile "$armRoot\Parameters\ApplicationInsights\applicationinsights.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy AppConfig"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\AppConfig\appconfig.json" -TemplateParameterFile "$armRoot\Parameters\AppConfig\appconfig.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy CosmosDB"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\CosmosDB\cosmosdb.json" -TemplateParameterFile "$armRoot\Parameters\CosmosDB\cosmosdb.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy CosmosDB SQL"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\CosmosDB\cosmosdb-sql.json" -TemplateParameterFile "$armRoot\Parameters\CosmosDB\cosmosdb-sql.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy CosmosDB Container"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\CosmosDB\cosmosdb-sql-container.json" -TemplateParameterFile "$armRoot\Parameters\CosmosDB\cosmosdb-sql-container.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy StorageAccount"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\StorageAccount\storageaccount.json" -TemplateParameterFile "$armRoot\Parameters\StorageAccount\storageaccount.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy ASP"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\AppServicePlan_Geneva\asp_geneva.json" -TemplateParameterFile "$armRoot\Parameters\AppServicePlan_Geneva\asp_geneva.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy AzFunc"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\AzureFunction\azurefunction.json" -TemplateParameterFile "$armRoot\Parameters\AzureFunction\azurefunction.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy Frontdoor"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\FrontDoor\frontdoor.json" -TemplateParameterFile "$armRoot\Parameters\FrontDoor\frontdoor.dev.json" -Mode Incremental -ErrorAction Stop

Write-Host "Deploy KeyVault Config"
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "$armRoot\Templates\KeyVaultConfiguration\keyvaultconfiguration.json" -TemplateParameterFile "$armRoot\Parameters\KeyVaultConfiguration\keyvaultconfiguration.dev.json" -Mode Incremental -ErrorAction Stop
