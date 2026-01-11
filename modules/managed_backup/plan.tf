resource "aws_backup_plan" "main" {
  name = var.name

  rule {
    rule_name         = var.rule_name
    target_vault_name = aws_backup_vault.main.name
    schedule          = var.schedule
    enable_continuous_backup = var.enable_continuous_backup
    lifecycle {
      delete_after = var.max_retention_days
      cold_storage_after = var.cold_storage_after
    }
    recovery_point_tags = var.recovery_point_tags
 #  This length check seems broken in latest terraform version... can do manually
    dynamic "copy_action" {
      for_each = var.destination_vault_arn
      content {
        destination_vault_arn = copy_action.value
        #destination_vault_arn = null
        lifecycle {
           delete_after = var.copy_retention_days
        }

      }
    }
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = var.WindowsVSS
    }
    resource_type = "EC2"
  }

  tags = {
    Name      = var.rule_name
  }
}


