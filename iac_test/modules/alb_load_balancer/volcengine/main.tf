resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

module "vpc" {
  source       = "../../vpc/volcengine"
  project_name = var.project_name
  tags         = var.tags
}

resource "volcenginecc_vpc_subnet" "SubnetA" {
  subnet_name = "terratest-subnet-a-${random_string.suffix.result}"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.1.0/24"
  zone_id     = "cn-beijing-a"
  vpc_id      = module.vpc.vpc_id
}

resource "volcenginecc_vpc_subnet" "SubnetB" {
  subnet_name = "terratest-subnet-b-${random_string.suffix.result}"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.2.0/24"
  zone_id     = "cn-beijing-b"
  vpc_id      = module.vpc.vpc_id
}

resource "volcenginecc_vpc_subnet" "SubnetC" {
  subnet_name = "terratest-subnet-c-${random_string.suffix.result}"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.3.0/24"
  zone_id     = "cn-beijing-c"
  vpc_id      = module.vpc.vpc_id
}

resource "volcenginecc_alb_load_balancer" "tf2" {
  type                       = "private"
  address_ip_version         = "IPv4"
  load_balancer_name         = "terratest-alb-${random_string.suffix.result}"
  description                = "Create by ccaip"
  vpc_id                     = module.vpc.vpc_id
  load_balancer_billing_type = 1
  delete_protection          = "off"
  zone_mappings = [
    {
      subnet_id = volcenginecc_vpc_subnet.SubnetA.id
      zone_id   = "cn-beijing-a"
    },
    {
      subnet_id = volcenginecc_vpc_subnet.SubnetB.id
      zone_id   = "cn-beijing-b"
    },
    {
      subnet_id = volcenginecc_vpc_subnet.SubnetC.id
      zone_id   = "cn-beijing-c"
    },
  ]
  project_name                   = var.project_name
  modification_protection_status = "NonProtection"
  modification_protection_reason = ""
  load_balancer_edition          = "Standard"
  waf_protection_enabled         = "off"
  tags                           = var.tags
}
