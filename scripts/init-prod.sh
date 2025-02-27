terraform init \
    -backend-config="resource_group_name=rg-prod-terraform-tfstate" \
    -backend-config="storage_account_name=stprodterraformtfstate" \
    -backend-config="container_name=tfstate-environments" \
    -backend-config="key=prod.terraform.tfstate"