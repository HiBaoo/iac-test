output "instance_id" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.id
}

output "instance_name" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.instance_name
}

output "deletion_protection" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.deletion_protection
}

output "sync_mode" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.sync_mode
}

output "auto_upgrade_minor_version" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.auto_upgrade_minor_version
}

output "global_read_only" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.global_read_only
}

output "tags" {
  value = volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.tags != null ? volcenginecc_rdsmysql_instance.RDSMySQLInstanceDemo.tags : []
}
