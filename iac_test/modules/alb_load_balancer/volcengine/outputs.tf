output "load_balancer_id" {
  value = try(volcenginecc_alb_load_balancer.tf2.id, "")
}

output "load_balancer_name" {
  value = try(volcenginecc_alb_load_balancer.tf2.load_balancer_name, "")
}

output "description" {
  value = try(volcenginecc_alb_load_balancer.tf2.description, "")
}

output "tags" {
  value = try(volcenginecc_alb_load_balancer.tf2.tags, [])
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
