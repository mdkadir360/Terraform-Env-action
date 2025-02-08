rg = {
  rg1 = {
    name     = "kadir-dev-rg"
    location = "east us"
  }
}

vnet = {
  vnet1 = {
    name                = "kadir-dev-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "east us"
    resource_group_name = "kadir-dev-rg"
  }

}
subnet = {
  subnet1 = {
    name                 = "kadir-dev-subnet"
    resource_group_name  = "kadir-dev-rg"
    virtual_network_name = "kadir-dev-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
pip = {
  pip1 = {
    name                = "frontend-devpip1"
    resource_group_name = "kadir-dev-rg"
    location            = "east us"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "frontend-devpip2"
    resource_group_name = "kadir-dev-rg"
    location            = "east us"
    allocation_method   = "Static"
    sku                 = "Basic"

  }

}
nic = {
  nic1 = {
    name                 = "frontend-devnic1"
    location             = "east us"
    resource_group_name  = "kadir-dev-rg"
    virtual_network_name = "kadir-dev-vnet"
    subnetname           = "kadir-dev-subnet"
    ipname               = "frontend-devpip1"
  }
  nic2 = {
    name                 = "frontend-devnic2"
    location             = "east us"
    resource_group_name  = "kadir-dev-rg"
    virtual_network_name = "kadir-dev-vnet"
    subnetname           = "kadir-dev-subnet"
    ipname               = "frontend-devpip2"
  }
}
nsg = {
  nsg1 = {
    name                = "nsgdevrule"
    location            = "east us"
    resource_group_name = "kadir-dev-rg"
  }
}
security = {
  rule1 = {
    name                       = "ssh_access"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 22
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  rule2 = {
    name                       = "http_access"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = 80
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
associationm = {
  association1 = {
    name                 = "kadirdevnsg"
    nsgname              = "nsgdevrule"
    resource_group_name  = "kadir-dev-rg"
    subnatname           = "kadir-dev-subnet"
    virtual_network_name = "kadir-dev-vnet"
  }
}
vm = {
  vm01 = {
    name                = "kadirfrontend-devvm1"
    location            = "east us"
    resource_group_name = "kadir-dev-rg"
    nicname             = "frontend-devnic1"
  }
  vm02 = {
    name                = "kadirfrontend-devvm2"
    location            = "east us"
    resource_group_name = "kadir-dev-rg"
    nicname             = "frontend-devnic2"
  }
}

