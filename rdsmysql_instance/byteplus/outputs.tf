output "instance_id" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.id
}

output "instance_name" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.instance_name
}

output "deletion_protection" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.deletion_protection
}

output "sync_mode" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.sync_mode
}

output "auto_upgrade_minor_version" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.auto_upgrade_minor_version
}

output "global_read_only" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.global_read_only
}

output "tags" {
  value = bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.tags != null ? bytepluscc_rdsmysql_instance.RDSMySQLInstanceDemo.tags : []
}
