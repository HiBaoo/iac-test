terraform {
  required_providers {
    volcenginecc = {
        source  = "volcengine/volcenginecc"
        version = "0.0.31"
        }
    }
}

provider "volcenginecc" {
  region = "cn-beijing"
}

# Create VPC
resource "volcenginecc_vpc_vpc" "VpcDemo" {
  vpc_name = "vpc-demo"
  description = "VpcDemo Example"
  cidr_block = "192.168.0.0/24"
  support_ipv_4_gateway = true
  project_name = "default"
  tags = [
      {
          key = "env"
          value = "test"
      }
  ]
}
# Query VPC
data "volcenginecc_vpc_vpc" "VpcDataSource" {
  id = volcenginecc_vpc_vpc.VpcDemo.id
}
