resource "bytepluscc_vpc_vpc" "VPCDemo" {
  count        = 1
  vpc_name     = "terratest-rdsmysql_instance-vpc"
  description  = "test"
  cidr_block   = "192.168.0.0/16"
  project_name = var.project_name
  tags         = var.tags
}

resource "bytepluscc_vpc_subnet" "SubnetDemo" {
  subnet_name = "terratest-rdsmysql_instance-subnet"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.0.0/24"
  zone_id     = "ap-southeast-1a"
  vpc_id      = bytepluscc_vpc_vpc.VPCDemo[0].id
}

resource "bytepluscc_rdsmysql_instance" "RDSMySQLInstanceDemo" {
  deletion_protection = "Disabled"
  db_engine_version   = "MySQL_5_7"
  nodes = [
    {
      zone_id   = "ap-southeast-1a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "Primary"
    },
    {
      zone_id   = "ap-southeast-1a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "Secondary"
    },
    {
      zone_id   = "ap-southeast-1a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "ReadOnly"
    }
  ]
  storage_type           = "LocalSSD"
  storage_space          = 20
  instance_type          = "DoubleNode"
  vpc_id                 = bytepluscc_vpc_vpc.VPCDemo[0].id
  subnet_id              = bytepluscc_vpc_subnet.SubnetDemo.id
  instance_name          = "ccapi-test-tf-按量计费"
  super_account_name     = "ccapi-test"
  super_account_password = "Aa88888888"
  lower_case_table_names = "1"
  db_time_zone           = "UTC +08:00"
  charge_detail = {
    charge_type = "PostPaid"
    auto_renew  = false
    number      = 1
  }
  port = 3306
  maintenance_window = {
    day_kind         = "Week"
    day_of_week      = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    maintenance_time = "18:00Z-21:59Z"
  }
  auto_storage_scaling_config = {
    enable_storage_auto_scale = true
    storage_threshold         = 10
    storage_upper_bound       = 3000
    scaling_detect_node       = "MasterNode"
  }
  project_name               = var.project_name
  tags                       = var.tags
  global_read_only           = false
  sync_mode                  = "SemiSync"
  auto_upgrade_minor_version = "Auto"
}
