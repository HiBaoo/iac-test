output "id" {
  value = try(volcenginecc_bmq_instance.BMQInstanceDemo.id, "")
}

output "instance_name" {
  value = try(volcenginecc_bmq_instance.BMQInstanceDemo.name, "")
}

output "message_retention" {
  value = try(volcenginecc_bmq_instance.BMQInstanceDemo.message_retention, "")
}

# output "instance_tags" {
#   value = try(volcenginecc_bmq_instance.BMQInstanceDemo.tags, [])
# }
