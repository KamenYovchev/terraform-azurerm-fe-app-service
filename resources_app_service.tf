
resource "azurerm_app_service" "app_service" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  tags                = local.common_tags
  client_affinity_enabled = var.client_affinity_enabled

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
    scm_type = var.scm_type
    always_on = var.always_on
    managed_pipeline_mode = var.management_pipeline_mode
    ftps_state = var.ftps_state
    websockets_enabled = var.websocket_enabled
    cors {
      allowed_origins     = ["*"]
    }
  }

  app_settings = {
    "AppSettings:EmailUrl" = var.email_url
    "AzureFileStorage:ConnectionString" = var.storage_account_connection_string
    "AzureTextToSpeech:TokenUri" = var.token_uri
    "AzureTextToSpeech:EndpointUri" = var.token_uri
    "AzureTextToSpeech:DC" = var.dc
    "AzureTextToSpeech:ApiKey" = var.api_key
    "AzureMediaServicesConfig:AadClientId" = var.aad_client_id
    "AzureMediaServicesConfig:AadSecret" = var.aad_client_secret
    "AzureMediaServicesConfig:AadTenantId" = var.aad_tennant_id
    "AzureMediaServicesConfig:AccountName" = var.account_name
    "AzureMediaServicesConfig:ResourceGroup" = var.resource_group_name
    "AzureMediaServicesConfig:SubscriptionId" = var.susbscription_id
    "OneDriveConfig:AadClientId" = var.aad_client_id
    "AadSecret" = var.aad_client_secret
    "AadTenantId" = var.aad_tennant_id
    "OneDriveConfig:DriveId" = var.drive_id
    "AzureAd:ClientId" = var.aad_client_id
    "EntityGuidCode:EntityGuidCode" = var.entity_guid
    "ChatBotSettings:ConnectionString" = var.service_bus_connection_string
  }

  connection_string {
    name = "SignalR"
    type = "Custom"
    value = var.signalR_connection_string
  }

  connection_string {
    name = "RedisDatabase"
    type = "RedisCache"
    value = var.redis_cache_connection_string
  }

  connection_string {
    name = "CookieRedisDatabase"
    type = "RedisCache"
    value = var.redis_cache_coockies_connection_string
  }
}
