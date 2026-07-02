resource "volcenginecc_vpc_vpc" "VPCDemo" {
  count        = 1
  vpc_name     = "terratest-rdsmysql_instance-vpc"
  description  = "test"
  cidr_block   = "192.168.0.0/16"
  project_name = var.project_name
  tags         = var.tags
}

resource "volcenginecc_vpc_subnet" "SubnetDemo" {
  subnet_name = "terratest-rdsmysql_instance-subnet"
  description = "test"
  tags        = var.tags
  cidr_block  = "192.168.0.0/24"
  zone_id     = "cn-beijing-a"
  vpc_id      = volcenginecc_vpc_vpc.VPCDemo[0].id
}

resource "volcenginecc_rdsmysql_instance" "RDSMySQLInstanceDemo" {
  deletion_protection = "Disabled"
  db_engine_version   = "MySQL_5_7"
  nodes = [
    {
      zone_id   = "cn-beijing-a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "Primary"
    },
    {
      zone_id   = "cn-beijing-a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "Secondary"
    },
    {
      zone_id   = "cn-beijing-a"
      node_spec = "rds.mysql.d1.n.1c1g"
      node_type = "ReadOnly"
    }
  ]
  storage_type           = "LocalSSD"
  storage_space          = 20
  instance_type          = "DoubleNode"
  vpc_id                 = volcenginecc_vpc_vpc.VPCDemo[0].id
  subnet_id              = volcenginecc_vpc_subnet.SubnetDemo.id
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
  private_ip_address         = "192.168.0.17"
  engine_type                = "InnoDB"
  project_name               = var.project_name
  tags                       = var.tags
  global_read_only           = false
  sync_mode                  = "SemiSync"
  auto_upgrade_minor_version = "Auto"
  backup_policy = {
    backup_policy_base = {
      data_full_backup_periods                     = ["Wednesday", "Thursday"]
      data_full_backup_time                        = "16:00Z-16:59Z"
      data_incr_backup_periods                     = ["Monday", "Friday", "Saturday"]
      binlog_file_counts_enable                    = true
      binlog_limit_count                           = 60
      binlog_local_retention_hour                  = 25
      binlog_space_limit_enable                    = false
      binlog_storage_percentage                    = 50
      lock_ddl_time                                = 30
      data_full_backup_start_utc_hour              = 16
      hourly_incr_backup_enable                    = false
      incr_backup_hour_period                      = 0
      data_backup_encryption_enabled               = true
      binlog_backup_encryption_enabled             = true
      data_keep_policy_after_released              = "None"
      data_keep_days_after_released                = 0
      data_backup_all_retention                    = true
      binlog_backup_enabled                        = true
      retention_policy_synced                      = true
      high_frequency_snapshot_backup_enable        = false
      high_frequency_snapshot_backup_second_period = 0
      keep_cross_backup_enable_after_released      = false
    }
    cross_backup_policy = {
      backup_enabled      = true
      cross_backup_region = "cn-shanghai"
      log_backup_enabled  = false
      retention           = 10
    }
  }
}
 