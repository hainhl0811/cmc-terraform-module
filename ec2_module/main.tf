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
    cpu = var.cpu # chọn thông số vCPU
    ram = var.ram  #chọn thông số RAM
}
# define image
data "cmccloudv2_image" "ubuntu2204" {
    os = "ubuntu"
    visibility = "public"  # lựa chọn giữa public,image , shared image và private image
    name = "22.04"  # search image with name contains `22.04`
}

locals {
   test_flavor_id = "${data.cmccloudv2_flavor_ec.flavor_ec.id}"
   test_subnet_id = "${data.cmccloudv2_subnet.rke_subnet.id}"
}

resource "cmccloudv2_server" "terraform_provision_node" {
    name = var.name 
    billing_mode = var.billing_mode 
    zone = var.zone
    subnet_id = local.test_subnet_id
    ip_address = var.ip_address
    flavor_id = local.test_flavor_id
    source_id = "${data.cmccloudv2_image.ubuntu2204.id}"
    source_type = var.source_type
    volume_size = var.volume_size
    volume_type = var.volume_type
    security_group_names = var.security_group_names
    key_name = var.key_name
    password = var.password
    vm_state = "active"

    connection {
    type     = "ssh"
    user     = "root"
    password = var.password
    host     = var.ip_address
    }

    provisioner "remote-exec"{
    inline = [
    "sudo apt update -y",
    "sudo apt install docker docker.io -y"]
    #on_failure = continue
    }
}
