module "resouce_group" {
  source = "../Modules/Resourcegroup"
        Resourcegroupdetails=var.Resourcegroupdetails
  }
module "networks" {
  source     = "../Modules/Vnet"
  depends_on = [module.resouce_group]  
Vnetdetails = var.Vnetdetails
}

module "subnet" {
  source     = "../Modules/Subnet"
  depends_on = [module.networks]
  subnetdetails = var.subnetdetails                                      
}

#  module "storage" {
# source = "../Modules/Azure Storage"
# depends_on = [ module.resoucegroup ]
# storagedetails = {
# stg1={
# name="devstoremk"
# location="southindia"
# resource_group_name ="rgmkl_dev"
# account_tier="Standard"
# account_replication_type="LRS"
# 
# }
# }
#  }

module "publicip" {
  source     = "../Modules/Public_IP"
  depends_on = [module.resouce_group]
  
  pipdetails = var.pipdetails 
   }

module "nicdetails" {
  source = "../Modules/Network interface"
  depends_on = [module.publicip,module.subnet]
  nicdetails = var.nicdetails
}

# module "networkassociation" {
    # source = "../Modules/network association"
    # depends_on = [module.subnet,module.nicdetails,module.networks]
    # NAdetails = var.NAdetails
# }

module "networksecuritygroup" {
source ="../Modules/NSG"
depends_on = [module.resouce_group]
NSGdetails = var.NSGdetails
security_rule = var.security_rule
}
module "virtual_machine" {
  depends_on = [ module.nicdetails]
  source = "../Modules/VM"
  virtual_machine = var.virtual_machine
}