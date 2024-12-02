
resource "azurerm_resource_group" "example" {
  name     = "example-resources1"
  location = "West Europe"
}

resource "azurerm_network_security_group" "example" {
  name                = "acceptancedfasdf"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  dynamic security_rule {
    for_each                   = var.nsg_rules
    content {
    name                       = security_rule.value["name"]
    priority                   = security_rule.value["priority"]
    direction                  = security_rule.value["direction"]
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range       = security_rule.value["source_port_range"]
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  }
}
variable "nsg_rules"{
    type = list(object({
        name= string
        priority=number
        direction = string 
        source_port_range = number
    })) 
    default =[{
        name = "test1"
        priority = 100
        direction = "Inbound"
        source_port_range = 22  

    },
    {
        name = "test2"
        priority = 101
        direction = "Outbound"  
        source_port_range = 389  
    },
    {
        name = "test3"
        priority = 102
        direction = "Outbound"  
        source_port_range = 389  
    }
    
    ]
} 

