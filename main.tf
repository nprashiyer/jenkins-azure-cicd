resource "azurerm_resource_group" "rsg" {
  name     = "jenkins-cicd-poc"
  location = "southcentralus"
  tags = {
    "Contact" = "p.narayan.iyer@accenture.com"
    "App"     = "POC"
    "Deploy"  = "Jenkins"
    "ÏaC"     = "Terraform"
  }
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = "demo_plan_${var.suffix}"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
  tags = azurerm_resource_group.rsg.tags
}

resource "azurerm_app_service" "app" {
  name                = "demowebapp${var.suffix}"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
  tags = azurerm_resource_group.rsg.tags
}
