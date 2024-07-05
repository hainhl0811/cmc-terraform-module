module "provision_rke_node" {
  source = "./modules"
  name = var.name 
  billing_mode = var.billing_mode 
  zone = var.zone
  ip_address = var.ip_address
  flavor_id = var.flavor_id
  source_id = var.source_id
  source_type = var.source_type
  volume_size = var.volume_size
  volume_type = var.volume_type
  security_group_names = var.security_group_names
  key_name = var.key_name
  password = var.password
}