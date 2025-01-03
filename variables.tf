variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "location" {
  description = "The location/region of the resource"
  type = string
}

variable "tags" {
  description = "The tags associated with the resource"
  type = map(string)
}

variable "destination_folder_name" {
  description = "The name of the destination folder"
  type = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type = string
}

variable "source_folder_name" {
  description = "The name of the source folder"
  type = string
}