##################################################################################
# VARIABLES
##################################################################################

variable "name" {}

variable "location" {}

variable "resource_group_name" {}

variable "app_service_plan_id" {}

##################################################################################
# LOCALS
##################################################################################

locals {
    env_name = lower(terraform.workspace)

    common_tags = {
        Environment = local.env_name
        Name = var.name
    }
}