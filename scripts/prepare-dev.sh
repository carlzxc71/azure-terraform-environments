az group create \
    --name rg-dev-terraform-tfstate \
    --location swedencentral

az storage account create \
    --name stdevterraformtfstate \
    --resource-group rg-dev-terraform-tfstate \
    --location swedencentral \
    --sku Standard_LRS

az storage container create \
    --name tfstate-environments \
    --account-name stdevterraformtfstate \
    --auth-mode login