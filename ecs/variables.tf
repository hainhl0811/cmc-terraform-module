variable "api_endpoint" {
  type = string
  default = "https://apiv2.cloud.cmctelecom.vn"
}

variable "api_key" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region_id" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "flavor_cpu" {
  type = number
  default = "1"
}

variable "flavor_ram" {
  type = number
  default = "1"
}

variable "ecs_ip_address" {
  type = string
}

variable "ecs_billing_mode" {
  type = string
  default = "monthly"
}

variable "ecs_zone" {
  type = string
}

variable "ecs_name" {
  type = string
}

variable "ecs_source_type" {
  type = string
  default = "image"
}

variable "ev_size" {
  type = number
  default = "50"
}

variable "ev_type" {
  type = string
  default = "highio"
}

variable "ecs_key_name" {
  type = string
  default = "keypair-rke"
}

variable "sg_names" {
  type = list(string)
  default = ["default"]
}

variable "ecs_password" {
  type = string
}
