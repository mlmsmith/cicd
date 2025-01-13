resource "azurerm_data_factory" "adf" {
  name                = var.df_name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }
}

data "azurerm_storage_account" "source_folder_storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account" "destination_folder_storage" {
  name = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "source" {
  name            = "source_storage"
  data_factory_id = azurerm_data_factore.adf.id
  connection_string = data.azurerm_storage_account.source_folder_storage.primary_connection_string
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "destination" {
  name            = "destination_storage"
  data_factory_id = azurerm_data_factore.adf.id
  connection_string = data.azurerm_storage_account.destination_folder_storage.primary_connection_string
}

# source and sink dataset to blob storage
resource "azurerm_data_factory_dataset_binary" "source_dataset" {
  name                = "source_dataset"
  data_factory_id     = azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.source.name

  sftp_server_location {
    filename = "test.txt"
    path     = "source"
  }
}

resource "azurerm_data_factory_dataset_binary" "destination_dataset" {
  name                = "destination_dataset"
  data_factory_id     = azurerm_data_factory.adf.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.destination.name

  sftp_server_location {
    filename = "test-${formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())}.txt"
    path     = "destination"
  }
}