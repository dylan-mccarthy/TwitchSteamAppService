variable "app_location" {
  type    = string
  default = "australiaeast"
}

variable "app_resource_group" {
  type    = string
  default = "DMCTwitchRG"
}

variable "app_service_plan" {
  type    = string
  default = "twitchapp01-serviceplan"
}

variable "app_service_linux_web_app" {
  type    = string
  default = "twitchapp01-app"
}

variable "docker_image_name" {
  type    = string
  default = "dmctwitchacr.azurecr.io/twitchappdemo"
}
variable "docker_image_tag" {
  type    = string
  default = "latest"
}

variable "aspnetcore_environment" {
  type    = string
  default = "Development"
}


