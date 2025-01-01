variable "storage_account_name" {
  description = "The name of the storage account"
  type = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The location/region of the resource"
  type = string
}

variable "source_folder_name" {
  description = "The name of the source folder"
  type = string
}

variable "destination_folder_name" {
  description = "The name of the destination folder"
  type = string
}

variable "container_access_type" {
  description = "The access type for the storage account container"
  type = string
  default = "private"
}

