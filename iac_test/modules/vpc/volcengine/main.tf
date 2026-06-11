resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "volcenginecc_vpc_vpc" "VPCDemo" {
  vpc_name     = "terratest-vpc-${random_string.suffix.result}"
  description  = "test"
  cidr_block   = "192.168.0.0/16"
  enable_ipv_6 = true
  project_name = var.project_name
  tags         = var.tags
}
