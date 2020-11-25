
resource "azurerm_app_service" "app_service" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  tags                = local.common_tags
  client_affinity_enabled = false

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type = "LocalGit"
    always_on = true
    managed_pipeline_mode = "Integrated"
    ftps_state = "Disabled"

  }
}
