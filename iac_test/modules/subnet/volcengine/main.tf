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

resource "volcenginecc_vpc_subnet" "SubnetDemo" {
  subnet_name = "terratest-subnet-${random_string.suffix.result}"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.19.0/24"
  zone_id     = "cn-beijing-a"
  vpc_id      = module.vpc.vpc_id
}
