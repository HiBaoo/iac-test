resource "bytepluscc_vpc_vpc" "VPCDemo" {
  count        = 1
  vpc_name     = "terratest-vpc"
  description  = "test"
  cidr_block   = "192.168.0.0/16"
  project_name = var.project_name
  tags         = var.tags
}

resource "bytepluscc_vpc_subnet" "SubnetDemo" {
  subnet_name = "terratest-subnet"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.19.0/24"
  zone_id     = "cn-beijing-a"
  vpc_id      = bytepluscc_vpc_vpc.VPCDemo[0].id
}

resource "bytepluscc_vpc_security_group" "SecurityGroupDemo" {
  vpc_id              = bytepluscc_vpc_vpc.VPCDemo[0].id
  security_group_name = "terratest-security-group"
  description         = "test"
  project_name        = var.project_name
  tags                = var.tags
  depends_on          = [bytepluscc_vpc_subnet.SubnetDemo]
}

resource "bytepluscc_ecs_instance" "tf2" {
  password             = "Huoshan@2025"
  instance_charge_type = "PostPaid"
  instance_name        = "instance-test-5001"
  spot_strategy        = "NoSpot"
  user_data            = ""
  hostname             = "Hostname-ccapi-test"
  description          = "ecs instance Description"
  project_name         = var.project_name
  instance_type        = "ecs.g4i.large"
  deletion_protection  = false
  zone_id              = "cn-beijing-a"
  image = {
    image_id = "image-aagd56zrw2jtdro3bnrl"
  }
  eip_address = {
    charge_type           = "PayByTraffic"
    bandwidth_mbps        = 5
    isp                   = "BGP"
    release_with_instance = false
    bandwidth_package_id  = ""
  }
  primary_network_interface = {
    security_group_ids = [bytepluscc_vpc_security_group.SecurityGroupDemo.id]
    subnet_id          = bytepluscc_vpc_subnet.SubnetDemo.id
  }

  placement = {
    affinity                  = "Default"
    dedicated_host_cluster_id = ""
    tenancy                   = "Default"
    dedicated_host_id         = ""
  }
  system_volume = {
    size                 = 50
    delete_with_instance = true
    volume_type          = "ESSD_FlexPL"
  }
}

resource "bytepluscc_ecs_image" "image_demo" {
  image_name   = "tf2-test-image"
  description  = "tf2-test"
  instance_id  = bytepluscc_ecs_instance.tf2.id
  project_name = var.project_name
  tags         = var.tags
}
