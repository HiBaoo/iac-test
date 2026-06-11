output "subnet_id" {
  value = volcenginecc_vpc_subnet.SubnetDemo.id
}

output "subnet_name" {
  value = volcenginecc_vpc_subnet.SubnetDemo.subnet_name
}

output "description" {
  value = volcenginecc_vpc_subnet.SubnetDemo.description
}

output "tags" {
  value = volcenginecc_vpc_subnet.SubnetDemo.tags
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
