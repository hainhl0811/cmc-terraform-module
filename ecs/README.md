**Prerequisites**
1. Terraform
```linux
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
```
2. Golang
```linux
snap install go --classic
```
**1.Installation**
```linux
sudo mkdir -p /usr/src/terraform/
cd /usr/src/terraform/ #Path to work with cmccloud terraform
wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz
tar -xvzf go1.22.3.linux-amd64.tar.gz
mv go /usr/local/
```
```linux
cd /usr/src/terraform/
git clone https://github.com/cmc-cloud/gocmcapiv2.git
git clone https://github.com/cmc-cloud/terraform-provider-cmccloudv2.git
cd terraform-provider-cmccloudv2/
vi /usr/src/terraform/terraform-provider-cmccloudv2/go.mod
go.mod
```
>replace github.com/cmc-cloud/gocmcapiv2 => /usr/src/terraform/gocmcapiv2

**Build provider**
```linux
go mod tidy
go build
```
**add terraformrc**
```linux
provider_installation {
 dev_overrides {
 "cmc-cloud/cmccloudv2" = "/usr/src/terraform/terraform-provider-cmccloudv2"
 }
 filesystem_mirror {
 path = "/usr/src/terraform/terraform-provider-cmccloudv2"
 include = ["github.com/cmc-cloud/*"]
 }
 direct {
 exclude = ["github.com/cmc-cloud/*"]
 include = ["hashicorp/aws"]
 }
}
```
```terraform
module "provision_ecs" {
  source = "github.com/hainhl0811/cmc-terraform-module/ecs"
  api_key = ""
  project_id = ""
  region_id = ""
  vpc_name = ""
  subnet_name = ""
  ecs_zone = ""
  ecs_name = ""
  ecs_ip_address = ""
  ev_size = "50"
  ecs_key_name = "keypair-rke"
  sg_names = ["default"]
  ecs_password = "asdqwdqwdqwdqwd"
}
```
```terraform
terraform init
terraform plan
terraform apply
```
>###default flavor is 1 cpu 1 ram  
>flavor_cpu = ""  
>flavor_ram = ""
>
>###default ip is random  
>ecs_ip_address = ""
>
>###default mode is random  
>ecs_billing_mode = "monthly"  
>default source is image  
>ecs_source_type = "image"
>
>###default ev_type is highio  
>ev_type = "highio"  
