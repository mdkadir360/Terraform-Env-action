module "Rgs" {
  source = "github.com/mdkadir360/Terraform-env-gitops.git//1-RG"
  rgs    = var.rg
}

module "vnet" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//4-Virtual-network"
  vnet       = var.vnet
  depends_on = [module.Rgs]
}
module "subnet" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//5-Subnet"
  subnet     = var.subnet
  depends_on = [module.vnet]
}
module "pip" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//6-Publicip"
  pip        = var.pip
  depends_on = [module.Rgs]
}
module "nic" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//7-Nic"
  nic        = var.nic
  depends_on = [module.Rgs, module.subnet, module.vnet, module.pip]
}
module "nsg" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//8-NSG"
  nsg        = var.nsg
  security   = var.security
  depends_on = [module.Rgs]
}

module "nsgass" {
  source      = "github.com/mdkadir360/Terraform-env-gitops.git//9-nsg-association"
  association = var.associationm
  depends_on  = [module.nsg, module.subnet]
}
module "vm" {
  source     = "github.com/mdkadir360/Terraform-env-gitops.git//10-Linuxvm"
  vm         = var.vm
  depends_on = [module.Rgs, module.nic, module.pip, module.subnet, module.nsgass]
}
# module "sqlserver" {
#   source     = "../All Resources/11 sqlserver"
#   sqlserver  = var.sqlservers
#   depends_on = [module.Rgs]
# }
# module "sqldata" {
#   source     = "../All Resources/12 Sql database"
#   sqldata    = var.sqldata
#   depends_on = [module.Rgs, module.sqlserver]
# }
# module "bastionhost" {
#   source      = "../All Resources/13 Bastion"
#   bastionhost = var.bastionhost
#   depends_on  = [module.Rgs, module.nic, module.pip, module.subnet]

# }
# module "loadbalancer" {
#   source             = "../All Resources/14 Load balancer"
#   depends_on = [module.vm ]
#   lbname             = var.lbname
#   backendpool        = var.backendpool
#   backendpooladdress = var.backendpooladdress
#   vms                = var.vms
#   probename          = var.probename
#   port               = var.port
#   protocol           = var.protocol
#   interval           = var.interval
#   lbrule             = var.lbrule
#   frontendport       = var.frontendport
#   backendport = var.backendport
# }
