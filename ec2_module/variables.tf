variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "cpu" {
  type = number
  default = "1"
}

variable "ram" {
  type = number
  default = "1"
}

variable "ip_address" {
  type = string
}

variable "flavor_id" {
  type = string
}

variable "source_id" {
  type = string
}

variable "billing_mode" {
  type = string
  default = "monthly"
}

variable "zone" {
  type = string
}

variable "name" {
  type = string
}

variable "source_type" {
  type = string
  default = "image"
}

variable "volume_size" {
  type = number
  default = "50"
}

variable "volume_type" {
  type = string
  default = "highio"
}

variable "key_name" {
  type = string
  default = "keypair-rke"
}

variable "security_group_names" {
  type = string
  default = [default]
}

variable "password" {
  type = string
}
