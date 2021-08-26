resource "azurerm_public_ip" "vm-scaleset-ip" {
 name                         = "vmss-public-ip"
 location                     = var.location
 resource_group_name          = var.resource_group
 allocation_method            = "Static"
}

resource "azurerm_lb" "load-balancer" {
 name                = "vmss-lb"
 location            = var.location
 resource_group_name = var.resource_group

 frontend_ip_configuration {
   name                 = "PublicIPAddress"
   public_ip_address_id = azurerm_public_ip.vm-scaleset-ip.id
 }
}

resource "azurerm_lb_backend_address_pool" "bpepool" {
 loadbalancer_id     = azurerm_lb.load-balancer.id
 name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "lbprobe" {
 resource_group_name = var.resource_group
 loadbalancer_id     = azurerm_lb.load-balancer.id
 name                = "ssh-running-probe"
 port                = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
   resource_group_name            = var.resource_group
   loadbalancer_id                = azurerm_lb.load-balancer.id
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = var.application_port
   backend_port                   = var.application_port
   backend_address_pool_id        = azurerm_lb_backend_address_pool.bpepool.id
   frontend_ip_configuration_name = "PublicIPAddress"
   probe_id                       = azurerm_lb_probe.lbprobe.id
}

resource "azurerm_virtual_machine_scale_set" "vmss-app" {
 name                = "vmscaleset-app"
 location            = var.location
 resource_group_name = var.resource_group
 upgrade_policy_mode = "Manual"

 sku {
   name     = "Standard_DS1_v2"
   tier     = "Standard"
   capacity = 2
 }

 storage_profile_image_reference {
   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"
 }

 storage_profile_os_disk {
   name              = ""
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }

 storage_profile_data_disk {
   lun          = 0
   caching        = "ReadWrite"
   create_option  = "Empty"
   disk_size_gb   = 10
 }

 os_profile {
   computer_name_prefix = "vmapp"
   admin_username       = var.app_username
   admin_password       = var.app_os_password
 }

 os_profile_linux_config {
   disable_password_authentication = false
 }

 network_profile {
   name    = "app-network"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = var.app_subnet_id
     #load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
     primary = true
   }
 }
}

resource "azurerm_virtual_machine_scale_set" "vmss-web" {
 name                = "vmscaleset-web"
 location            = var.location
 resource_group_name = var.resource_group
 upgrade_policy_mode = "Manual"

 sku {
   name     = "Standard_DS1_v2"
   tier     = "Standard"
   capacity = 2
 }

 storage_profile_image_reference {
   publisher = "Canonical"
   offer     = "UbuntuServer"
   sku       = "16.04-LTS"
   version   = "latest"
 }

 storage_profile_os_disk {
   name              = ""
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }

 storage_profile_data_disk {
   lun          = 0
   caching        = "ReadWrite"
   create_option  = "Empty"
   disk_size_gb   = 10
 }

 os_profile {
   computer_name_prefix = "vmweb"
   admin_username       = var.web_username
   admin_password       = var.web_os_password
 }

 os_profile_linux_config {
   disable_password_authentication = false
 }

 network_profile {
   name    = "web-network"
   primary = true

   ip_configuration {
     name                                   = "IPConfiguration"
     subnet_id                              = var.web_subnet_id
     load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
     primary = true
   }
 }
}