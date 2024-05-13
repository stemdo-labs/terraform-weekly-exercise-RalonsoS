azure_infrastructure = {
  load_balancer_name = "lb-weekly"
  
  resource_group = {
    name     = "rg1ralonso-lab01"
    location = "westeurope"
  }
  
  virtual_network = {
    name           = "weekly-vnet"
    address_space  = ["10.0.0.0/16"]
  }
  
  subnet = {
    name              = "weekly-subnet"
    address_prefixes  = ["10.0.1.0/24"]
  }
  
  network_security_group = {
    nsg_name       = "weekly-nsg"
    security_rules = [
      {
        name                       = "web"
        priority                   = 1008
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  
  public_ip_name         = "lb-weekly-public-ip"
  network_interface_name = "weekly-nic"
  
  vms = [
    {
      name            = "vm1"
      size            = "Standard_F2"
      admin_username  = "adminuser"
      disk_name       = "vm-1-disk_weekly"
      redundancy_type = "Standard_LRS"
    },
    {
      name            = "vm2"
      size            = "Standard_F2"
      admin_username  = "adminuser"
      disk_name       = "vm-2-disk_weekly"
      redundancy_type = "Standard_LRS"
    }
  ]
}
