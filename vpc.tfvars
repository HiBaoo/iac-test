region        = "cn-beijing"
endpoint      = "open.stable.volcengineapi-test.com"
vpc_name      = "vpc-demo"
cidr_block    = "192.168.0.0/24"
description   = "VpcDemo Example"
project_name  = "default"

tags = [
  {
    key   = "env"
    value = "test"
  }
]
