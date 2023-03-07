data "azurerm_resource_group" "apim_resource_group" {

  count = var.create_rg != true ? 1 : 0

  name  = var.apim_resource_group_name

}




data "azurerm_subnet" "apim_subnet" {

    name                    = "${var.virtual_network_subnet}"

    virtual_network_name    = "${var.virtual_network_name}"

    resource_group_name     = "${var.virtual_network_resource_group}"

}










resource "azurerm_resource_group" "apim_resource_group" {

  count    = var.create_rg ? 1 : 0

  name     = var.apim_resource_group_name

  location = var.apim_resource_group_location

}




resource "azurerm_api_management" "destapim" {

  name                = "${var.apim_name}"

  location            = var.create_rg ? tostring(azurerm_resource_group.apim_resource_group[0].location) : tostring(data.azurerm_resource_group.apim_resource_group[0].location)

  resource_group_name = var.create_rg ? tostring(azurerm_resource_group.apim_resource_group[0].name) : tostring(data.azurerm_resource_group.apim_resource_group[0].name)

  publisher_name      = "${var.publisher_name}"

  publisher_email     = "${var.publisher_email}"




  sku_name = "${var.sku_name}"




  virtual_network_type = "${var.virtual_network_type}"




  virtual_network_configuration {

      subnet_id = data.azurerm_subnet.apim_subnet.id

  }

}
