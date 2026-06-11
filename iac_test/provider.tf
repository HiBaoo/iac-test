terraform {
  required_providers {
    volcenginecc = {
      source = "volcengine/volcenginecc"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# provider "volcenginecc" {
#   access_key = var.volcenginecc_access_key
#   endpoints = {
#     cloudcontrolapi = "open.volcengineapi.com"
#   }
#   secret_key = var.volcenginecc_secret_key
#   region     = "cn-beijing"
# }