rg = {
  rg1 = {
    name     = "kadir-stage-rg"
    location = "canada central"
  }
}

vnet = {
  vnet1 = {
    name                = "kadir-stage-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = "canada central"
    resource_group_name = "kadir-stage-rg"
  }

}
subnet = {
  subnet1 = {
    name                 = "kadir-stage-subnet"
    resource_group_name  = "kadir-stage-rg"
    virtual_network_name = "kadir-stage-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
pip = {
  pip1 = {
    name                = "frontend-stagepip1"
    resource_group_name = "kadir-stage-rg"
    location            = "canada central"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  pip2 = {
    name                = "frontend-stagepip2"
    resource_group_name = "kadir-stage-rg"
    location            = "canada central"
    allocation_method   = "Static"
    sku                 = "Basic"

  }

}
nic = {
  nic1 = {
    name                 = "frontend-stagenic1"
    location             = "canada central"
    resource_group_name  = "kadir-stage-rg"
    virtual_network_name = "kadir-stage-vnet"
    subnetname           = "kadir-stage-subnet"
    ipname               = "frontend-stagepip1"
  }
  nic2 = {
    name                 = "frontend-stagenic2"
    location             = "canada central"
    resource_group_name  = "kadir-stage-rg"
    virtual_network_name = "kadir-stage-vnet"
    subnetname           = "kadir-stage-subnet"
    ipname               = "frontend-stagepip2"
  }
}
nsg = {
  nsg1 = {
    name                = "nsgstagerule"
    location            = "canada central"
    resource_group_name = "kadir-stage-rg"
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
    name                 = "kadirstagensg"
    nsgname              = "nsgstagerule"
    resource_group_name  = "kadir-stage-rg"
    subnatname           = "kadir-stage-subnet"
    virtual_network_name = "kadir-stage-vnet"
  }
}
vm = {
  vm01 = {
    name                = "kadirfrontend-stagevm1"
    location            = "canada central"
    resource_group_name = "kadir-stage-rg"
    nicname             = "frontend-stagenic1"
  }
  vm02 = {
    name                = "kadirfrontend-stagevm2"
    location            = "canada central"
    resource_group_name = "kadir-stage-rg"
    nicname             = "frontend-stagenic2"
  }
}

