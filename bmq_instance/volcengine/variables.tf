variable "project_name" {
  type    = string
}
#
# variable "tags" {
#   type = list(object({
#     key   = string
#     type  = string
#     value = string
#   }))
#   default = [{
#     key   = "env"
#     type  = "CUSTOM"
#     value = "test"
#   }]
# }

variable "instance_name" {
  type = string
}

variable "message_retention" {
  type    = number
  default = 1
}
