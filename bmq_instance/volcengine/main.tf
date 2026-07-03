resource "volcenginecc_vpc_vpc" "BmqVPC" {
  vpc_name     = "tt-bmq-${var.instance_name}"
  description  = "terratest bmq vpc"
  cidr_block   = "192.168.0.0/16"
  project_name = var.project_name
}

resource "volcenginecc_vpc_subnet" "BmqSubnet" {
  subnet_name = "tt-bmq-subnet-${var.instance_name}"
  description = "terratest bmq subnet"
  cidr_block  = "192.168.0.0/24"
  zone_id     = "cn-beijing-a"
  vpc_id      = volcenginecc_vpc_vpc.BmqVPC.id
}

resource "volcenginecc_vpc_security_group" "BmqSG" {
  security_group_name = "tt-bmq-sg-${var.instance_name}"
  vpc_id              = volcenginecc_vpc_vpc.BmqVPC.id
  project_name        = var.project_name
  depends_on          = [volcenginecc_vpc_subnet.BmqSubnet]
}

resource "volcenginecc_vpc_eip" "BmqEIP" {
  name         = "tt-bmq-eip-${var.instance_name}"
  description  = "terratest bmq eip"
  isp          = "BGP"
  billing_type = 2
  bandwidth    = 1
  project_name = var.project_name
  depends_on   = [volcenginecc_vpc_security_group.BmqSG]
}

resource "volcenginecc_bmq_instance" "BMQInstanceDemo" {
  name              = var.instance_name
  billing_type      = "POST"
  project_name      = var.project_name
  specification     = "bmq.standard"
  vpc_id            = volcenginecc_vpc_vpc.BmqVPC.id
  message_retention = var.message_retention
  endpoints = {
    public = {
      eip_id = volcenginecc_vpc_eip.BmqEIP.id
    }
    overlay = {
      vpc_ids = [volcenginecc_vpc_vpc.BmqVPC.id]
    }
  }
  security_group_id_list = [volcenginecc_vpc_security_group.BmqSG.id]
  subnet_id_list         = [volcenginecc_vpc_subnet.BmqSubnet.id]
  zone_id_list           = ["cn-beijing-a"]
#   tags                   = var.tags
}
