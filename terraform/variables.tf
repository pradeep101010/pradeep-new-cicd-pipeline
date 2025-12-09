variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type = string
  description = "Azure location (region)"
  default = "eastus"
}

variable "app_service_plan_name" {
  type = string
  description = "App Service Plan name"
}

variable "app_service_plan_tier" {
  type = string
  description = "App Service Plan tier (Free, Shared, Basic, Standard, Premium)"
}

variable "app_service_plan_size" {
  type = string
  description = "App Service Plan size (e.g., B1, S1, P1v2)"
}

variable "app_service_name" {
  type = string
  description = "Name of App Service"
}

variable "linux_fx_version" {
  type = string
  description = "Linux FX version (runtime stack), e.g. PYTHON|3.10"
  default = "PYTHON|3.10"
}

variable "tags" {
  type = map(string)
  default = {}
}
