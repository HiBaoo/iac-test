variable "project_name" {
  type = string
}

variable "tags" {
  type = list(object({
    key   = string
    value = string
  }))
}
