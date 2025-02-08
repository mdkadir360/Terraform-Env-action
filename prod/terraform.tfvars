rg = {
  rg1 = {
    name     = "kadir-prod-rg"
    location = "central india"
  }
}

vnet = {
  vnet1 = {
    name                = "kadir-prod-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "central india"
    resource_group_name = "kadir-prod-rg"
  }

}
subnet = {
  subnet1 = {
    name                 = "kadir-prod-subnet"
    resource_group_name  = "kadir-prod-rg"
    virtual_network_name = "kadir-prod-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
pip = {
  pip1 = {
    name                = "frontend-prodpip1"
    resource_group_name = "kadir-prod-rg"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "frontend-prodpip2"
    resource_group_name = "kadir-prod-rg"
    location            = "central india"
    allocation_method   = "Static"
    sku                 = "Basic"

  }

}
nic = {
  nic1 = {
    name                 = "frontend-prodnic1"
    location             = "central india"
    resource_group_name  = "kadir-prod-rg"
    virtual_network_name = "kadir-prod-vnet"
    subnetname           = "kadir-prod-subnet"
    ipname               = "frontend-prodpip1"
  }
  nic2 = {
    name                 = "frontend-prodnic2"
    location             = "central india"
    resource_group_name  = "kadir-prod-rg"
    virtual_network_name = "kadir-prod-vnet"
    subnetname           = "kadir-prod-subnet"
    ipname               = "frontend-prodpip2"
  }
}
nsg = {
  nsg1 = {
    name                = "nsgprodrule"
    location            = "central india"
    resource_group_name = "kadir-prod-rg"
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
    name                 = "kadirprodnsg"
    nsgname              = "nsgprodrule"
    resource_group_name  = "kadir-prod-rg"
    subnatname           = "kadir-prod-subnet"
    virtual_network_name = "kadir-prod-vnet"
  }
}
vm = {
  vm01 = {
    name                = "kadirfrontend-prodvm1"
    location            = "central india"
    resource_group_name = "kadir-prod-rg"
    nicname             = "frontend-prodnic1"
  }
  vm02 = {
    name                = "kadirfrontend-prodvm2"
    location            = "central india"
    resource_group_name = "kadir-prod-rg"
    nicname             = "frontend-prodnic2"
  }
}

