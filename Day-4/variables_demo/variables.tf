
variable "rg_name" {
    description = "the resource group name"
    default = "pip_rg"   
}

variable "location" {
    description = "the location where all the resources will be created"
    default = "eastus"   
}

variable "pip_name" {
    description = "the public ip name"
    default = "demo_ip"   
}

