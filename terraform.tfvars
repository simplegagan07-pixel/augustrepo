Resourcegroupdetails = {
  rg1 = {
    name     = "rgmkl_dev"
    location = "southindia" 
    tags = {
      environment = "dev"
      manged_by   = "terraform"
    }
      rg2 = {
    name     = "rgmk2_dev"
    location = "southindia" 
    tags = {
      environment = "dev"
      manged_by   = "terraform"
    }
  }
  
}
Vnetdetails = {
  vnet1 = {
    name                = "frontendvnet"
    resource_group_name = "rgmkl_dev"
    location            = "southindia"
    address_space       = ["10.10.0.0/16"]
  }
}

subnetdetails = {
  subnet1 = {
    name                 = "frontendsubnet"
    resource_group_name  = "rgmkl_dev"
    virtual_network_name = "frontendvnet"
    address_prefixes     = ["10.10.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsubnet"
    resource_group_name  = "rgmkl_dev"
    virtual_network_name = "frontendvnet"
    address_prefixes     = ["10.10.2.0/24"]
  }
  Bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rgmkl_dev"
    virtual_network_name = "frontendvnet"
    address_prefixes     = ["10.10.3.0/26"]
  }
}

nicdetails = {
  nicfrontend = {
    name                          = "nicfrontend"
    location                      = "southindia"
    resource_group_name           = "rgmkl_dev"
    ipname                        = "testconfigurtion"
    private_ip_address_allocation = "Dynamic"
    subnet_name  = "frontendsubnet"
    virtual_network_name = "frontendvnet"
    public_ip_name="publicip1"
      }

      nicbackend = {
  name                          = "nicbackend"
  location                      = "southindia"
  resource_group_name           = "rgmkl_dev"
  ipname                        = "testconfigurtion"
  private_ip_address_allocation = "Dynamic"
  subnet_name  = "backendsubnet"
  virtual_network_name = "frontendvnet"
  public_ip_name="publicip2"
    }
}
pipdetails = {
    pip1={
  name                = "publicip1"
  location            = "southindia"
  resource_group_name = "rgmkl_dev"
  account_tier        = "Standard"
  allocation_method = "Static"
    }
       pip2={
 name                = "publicip2"
 location            = "southindia"
 resource_group_name = "rgmkl_dev"
 account_tier        = "Standard"
allocation_method = "Static"
   }
}
# NAdetails= { 
    # Association1={
  # subnet_name  = "frontendsubnet"
#  resource_group_name = "rgmkl_dev"
  # virtual_network_name = "frontendvnet"
# 
# }
# }


NSGdetails = {
    NSG1={
      resource_group_name = "rgmkl_dev"   
        location            = "southindia"
        nsgname = "frontendnsg"
        subnet_name = "frontendsubnet"
        virtual_network_name = "frontendvnet"
         }
         NSG2={
  resource_group_name = "rgmkl_dev"   
    location            = "southindia"
    nsgname = "backendnsg"
    subnet_name = "frontendsubnet"
virtual_network_name = "frontendvnet"
     }
    }
security_rule = {
 SSH={
 priority                   = 100
 direction                  = "Inbound"
 access                     = "Allow"
 protocol                   = "Tcp"
 source_port_range          = "*"
 destination_port_range     = "22"
 source_address_prefix      = "*"
 destination_address_prefix = "*"
}
http={
priority                   = 101
direction                  = "Inbound"
access                     = "Allow"
protocol                   = "Tcp"
source_port_range          = "*"
destination_port_range     = "80"
source_address_prefix      = "*"
destination_address_prefix = "*"
}
RDP={
priority                   = 102
direction                  = "Inbound"
access                     = "Allow"
protocol                   = "Tcp"
source_port_range          = "*"
destination_port_range     = "3389"
source_address_prefix      = "*"
destination_address_prefix = "*"
}


}


virtual_machine = {
  vm1 = {
    name                = "frontend-vm"
    resource_group_name = "rg-dev-01"
    location            = "central india"
    size                = "Standard_D2s_v3"


    nic_name            = "nicfrontend"
    # key_vault_name      ="key-vault-demo-1"
    # kv_resource_group_name="rg-dev"
    admin_username      = "vmusername"
    admin_password      = "Vpasswo@1"  
    }
  vm2 = {
    name                = "nicbackend"
    resource_group_name = "rg-dev-01"
    location            = "central india"
    size                = "Standard_D2s_v3"
    nic_name            = "nic-dev-02"
    # key_vault_name      ="key-vault-demo-1"
    # kv_resource_group_name="rg-dev"
    admin_username      = "vmusername"
    admin_password      = "vM1#ssword"} }


































































}