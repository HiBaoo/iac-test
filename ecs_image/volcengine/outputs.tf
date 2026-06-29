output "image_id" {
  value = volcenginecc_ecs_image.image_demo.id
}

output "image_name" {
  value = volcenginecc_ecs_image.image_demo.image_name
}

output "description" {
  value = volcenginecc_ecs_image.image_demo.description
}

output "instance_id" {
  value = volcenginecc_ecs_instance.tf2.id
}

output "tags" {
  value = volcenginecc_ecs_image.image_demo.tags
}
