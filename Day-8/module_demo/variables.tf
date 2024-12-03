variable "vm_configs" {
    type = object({
      vm_name  =  string 
      vm_size = string 
      admin_username =string
      admin_password  =string
      storage_account_type =string
      publisher  = string
      offer     = string
      sku      = string
      version  = string

    })
  
}

variable "vnet_config" {
    type = object({
      vnet_name =  string 
      vnet_address_space = list(string)
      sbnet_name  = string
      sbnet_address_space = list(string)
    })
  
}

variable "rg_name" {
    type = string 
  
}
variable "location" {
    type = string
  
}