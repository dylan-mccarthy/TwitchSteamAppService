variable "app_location" {
  type    = string
  default = "australiaeast"
}
variable "shared_resource_group" {
  type    = string
  default = "twitchapp01"
}
  
variable "ACR_NAME" {
  type    = string
  default = "DMCTwitchACR"
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server."
}

variable "sql_admin_username" {
  description = "The administrator username for the Azure SQL Server."
}

variable "sql_admin_password" {
  description = "The administrator password for the Azure SQL Server."
}

variable "sql_database_name" {
  description = "The name of the Azure SQL Database."
}