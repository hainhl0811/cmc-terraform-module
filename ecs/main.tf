terraform {
  required_providers {
    cmccloudv2 = {
         source = "cmc-cloud/cmccloudv2"
         }
  }
}

provider "cmccloudv2" {
    api_endpoint = var.api_endpoint
    api_key = var.api_key
    project_id = var.project_id
    region_id = var.region_id
}

# define already created VPC
data "cmccloudv2_vpc" "vpc_terraform"{
    name = var.vpc_name
}
# define already created subnet
data "cmccloudv2_subnet" "rke_subnet"{
    name = var.subnet_name
}
# define flavor
data "cmccloudv2_flavor_ec" "flavor_ec"{
    cpu = var.flavor_cpu # chọn thông số vCPU
    ram = var.flavor_ram  #chọn thông số RAM
}
# define image
data "cmccloudv2_image" "ubuntu2204" {
    os = "ubuntu"
    visibility = "public"  # lựa chọn giữa public,image , shared image và private image
    name = "22.04"  # search image with name contains `22.04`
}

resource "cmccloudv2_server" "terraform_provision_node" {
    name = var.ecs_name 
    billing_mode = var.ecs_billing_mode 
    zone = var.ecs_zone
    ip_address = var.ecs_ip_address
    subnet_id = "${data.cmccloudv2_subnet.rke_subnet.id}"
    flavor_id = "${data.cmccloudv2_flavor_ec.flavor_ec.id}"
    source_id = "${data.cmccloudv2_image.ubuntu2204.id}"
    source_type = var.ecs_source_type
    volume_size = var.ev_size
    volume_type = var.ev_type
    security_group_names = var.sg_names
    key_name = var.ecs_key_name
    password = var.ecs_password
    vm_state = "active"

    connection {
    type     = "ssh"
    user     = "root"
    password = var.ecs_password
    host     = var.ecs_ip_address
    }

    provisioner "remote-exec"{
    inline = [
    "sudo apt update -y",
    "sudo apt install docker docker.io -y"]
    #on_failure = continue
    }
}
