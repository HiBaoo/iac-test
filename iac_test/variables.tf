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
  default = "open.stable.volcengineapi-test.com"
}


variable "region" {
  type    = string
  default = "cn-guilin-boe"
}

