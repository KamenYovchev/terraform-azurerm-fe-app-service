
resource "azurerm_app_service" "app_service" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  tags                = local.common_tags


  site_config {
    linux-fx-version =   "DOTNETCORE|2.1"
    scm_type = "LocalGit"
    always_on = true
    managed_pipeline_mode = "Integrated"
    ftps_state = "Disabled"
    websockets_enabled = false
  }
}
