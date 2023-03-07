variable create_rg{

  type        = bool

  default     = false

}

variable "apim_resource_group_name" {

  type = string

}

variable "apim_resource_group_location" {

  type = string

}

variable "apim_name" {

  type = string

}

variable "publisher_name" {

  type = string

}

variable "publisher_email" {

  type = string

}

variable "sku_name" {

  type = string

}




variable "virtual_network_name" {

  type = string

}

variable "virtual_network_subnet" {

  type = string

}

variable "virtual_network_resource_group" {

  type = string

}

variable "virtual_network_type" {

  type = string

}
