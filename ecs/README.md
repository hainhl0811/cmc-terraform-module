module "provision_rke_node" {
  source = "./modules"
  api_key = ""
  project_id = ""
  region_id = ""
  vpc_name = ""
  subnet_name = ""
  ecs_zone = ""
  ecs_name = ""
  ev_size = "50"
  ecs_key_name = "keypair-rke"
  sg_names = ["default"]
  ecs_password = "asdqwdqwdqwdqwd"
}
###default flavor is 1 cpu 1 ram
  #flavor_cpu = ""
  #flavor_ram = ""
###default ip is random
  #ecs_ip_address = ""
###default mode is random
  #ecs_billing_mode = "monthly"
  ###default source is image
  #ecs_source_type = "image"
###default ev_type is highio
  #ev_type = "highio"
