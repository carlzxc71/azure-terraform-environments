az group create \
    --name rg-prod-terraform-tfstate \
    --location swedencentral

az storage account create \
    --name stprodterraformtfstate \
    --resource-group rg-prod-terraform-tfstate \
    --location swedencentral \
    --sku Standard_LRS

az storage container create \
    --name tfstate-environments \
    --account-name stprodterraformtfstate \
    --auth-mode login