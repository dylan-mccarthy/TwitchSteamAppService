variable "app_location" {
  type    = string
  default = "australiaeast"
}

variable "ACR_NAME" {
  type = string
  default = "DMCTwitchACR"
}

variable "DOCKER_REGISTRY_USERNAME" {
  type = string
}

variable "DOCKER_REGISTRY_PASSWORD" {
  type= string
}