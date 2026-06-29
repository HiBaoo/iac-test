output "image_id" {
  value = bytepluscc_ecs_image.image_demo.id
}

output "image_name" {
  value = bytepluscc_ecs_image.image_demo.image_name
}

output "description" {
  value = bytepluscc_ecs_image.image_demo.description
}

output "instance_id" {
  value = bytepluscc_ecs_instance.tf2.id
}

output "tags" {
  value = bytepluscc_ecs_image.image_demo.tags
}
