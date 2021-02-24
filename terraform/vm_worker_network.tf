# Create NIC

resource "azurerm_network_interface" "myNicWorker" {
  name                = "vmnicWorker"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfigurationWorker"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.11"
    public_ip_address_id           = azurerm_public_ip.myPublicIpWorker.id
  }

    tags = {
        environment = "CP2"
    }

}

# IP pública

resource "azurerm_public_ip" "myPublicIpWorker" {
  name                = "vmipWorker"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "CP2"
    }

}