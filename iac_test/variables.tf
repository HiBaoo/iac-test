variable "project_name" {
  type    = string
  default = "default"
}

variable "tags" {
  type = list(object({
    key   = string
    value = string
  }))
  default = [
    {
      key   = "terraform-modules"
      value = "terraform-volcenginecc"
    }
  ]
}

variable "endpoint" {
  type    = string
  default = "open.volcengineapi.com"
}

variable "region" {
  type    = string
  default = "cn-beijing"
}

