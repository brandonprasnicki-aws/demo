#variable "app_security_group_ingress" {}
#variable "aws_account_name" {}
#variable "OEMport" {}
#variable "sslport" {}
variable "port" {}
variable "aws_region" {}
variable "instance_class" {}
variable "backup_window" {}
variable "backup_retention_period" {}
variable "maintenance_window" {}
variable "multi_az" {}
variable "subnet_ids" {}
variable "vpc_id" {}
variable "rds_bucket" {}
variable "environment" {}
variable "project" {}
variable "max_allocated_storage" {}
variable "allocated_storage" {}
variable "secret_id" {}
variable "engine" {}
variable "db_name" {}
variable "db_subnet_group_name" {}
variable "availability_zone" {}
variable "security_groups" {
    description = "list of security groups for server"
    type        = list(string)
}
variable "engine_version" {}
variable "storage_type" {}
variable "username" {}
variable "identifier" {}
variable "license_model" {
  default = "bring-your-own-license"
}
variable "character_set_name" {}
variable "enabled_cloudwatch_logs_exports" {
  default = ["alert", "listener"]
}
variable "option_group_name" {}
variable "major_engine_version" {}
variable "common_tags" {
  type = map(string)
  description = "tags set in tfvars and then merged with module specific tags"
}
variable "performance_insights_enabled" {
  default = true
}
variable "skip_final_snapshot" {
  default = false
}
#variable "timezone" {}