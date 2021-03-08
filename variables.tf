##################################################################################
# VARIABLES
##################################################################################

variable "name" {}

variable "location" {}

variable "resource_group_name" {}

variable "app_service_plan_id" {}

variable "web_app_url" {}

variable "client_affinity_enabled" {
  type = bool
  default = false
}

variable "dotnet_framework_version" {
  description = "framework version of dotnet"
  type = string
  default = "v4.0"
}

variable "scm_type" {
  description = "source code management system"
  type = string
  default = "LocalGit"
}

variable "always_on" {
  type = bool
  default = true
}

variable "management_pipeline_mode" {
  type = string
  default = "Integrated"
}

variable "ftps_state" {
  description = "Does ftps is allowed.Possible options are (Enabled or Disabled)"
  type = string
  default = "Disabled"
}

variable "websocket_enabled" {
  type = bool
  default = false
}

variable "token_uri" {
  type = string
  default = "https://eastus.api.cognitive.microsoft.com//sts/v1.0/issueToken"
}

variable "endpoint_uri" {
  type = string
  default = "https://eastus.tts.speech.microsoft.com/cognitiveservices/v1"
}

variable "dc" {
  type = string
  default = "https://eastus.tts.speech.microsoft.com"
}

variable "email_url" {
  description = "Name of the web app is used as a email url"
}

variable "storage_account_connection_string" {
  description = "Storage account connection string"
}

variable "api_key" {
  description = "Cognitive account text to speech api key"
}

variable "signalR_connection_string" {
  description = "Connection string for SignalR"
}

variable "redis_cache_connection_string" {
  description = "Redis cache server connection string"
}

variable "redis_cache_coockies_connection_string" {
  description = "Redis cache server connection string"
}

variable "aad_client_id" {
  description = "client aad app id for permissions"
}

variable "aad_client_secret" {
  description = "Password for aad applicaton related with permissions in environment"
}

variable "aad_tennant_id" {
  description = "Tennant ID for aad application"
}

variable "drive_id" {
  description = "ID of OneDrive for each client"
}

variable "media_serivce_account_name" {
  description = "Name of media service account"
}

variable "susbscription_id" {
  description = "Subscription_id"
}

variable "entity_guid" {
  description = "GUID ID (Name per environment e.x (WIZE, ELEV,TEK etc))"
}

variable "service_bus_connection_string" {
  description = "Connection string for Service bus"
}

variable "account_name" {
  description = "Azure media service account name"
}
##################################################################################
# LOCALS
##################################################################################

locals {
  env_name = lower(terraform.workspace)

  common_tags = {
    Environment = local.env_name
    Name        = var.name
  }
}