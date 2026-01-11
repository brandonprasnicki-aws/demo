locals {
  additional_common_tags = {
    Module = "RDS_Oracle"
    ModuleOwner = "Brandon Prasnicki"
  }

  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_db_instance" "RDSDBInstance" {
    identifier = var.identifier
    allocated_storage = var.allocated_storage
    instance_class = var.instance_class
    engine = var.engine
    username = var.username
    password = jsondecode(data.aws_secretsmanager_secret_version.rdscredentials.secret_string)["password"]
    db_name = var.db_name
    backup_window = var.backup_window
    backup_retention_period = var.backup_retention_period
    availability_zone = var.availability_zone
    maintenance_window = var.maintenance_window
    multi_az = var.multi_az
    engine_version = var.engine_version
    auto_minor_version_upgrade = true
    license_model = var.license_model
    character_set_name = var.character_set_name
    publicly_accessible = false
    storage_type = var.storage_type
    port = var.port
    #timezone = var.timezone
    storage_encrypted = true
    copy_tags_to_snapshot = true
    monitoring_interval = 60
    iam_database_authentication_enabled = false
    deletion_protection = true
    db_subnet_group_name = aws_db_subnet_group.this.name
    vpc_security_group_ids = var.security_groups
    max_allocated_storage = var.max_allocated_storage
    skip_final_snapshot = var.skip_final_snapshot
    enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
    performance_insights_enabled = var.performance_insights_enabled
    tags = merge(
        local.common_tags,
        {
            Environment = var.environment
            "ams:rt:ams-monitoring-policy" = "ams-monitored"
        },
    )
}