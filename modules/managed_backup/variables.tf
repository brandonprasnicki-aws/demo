variable "name" {
    default = "ManagedBackupPlan"
}

variable "WindowsVSS" {
    default = "disabled"
}

variable "schedule" {
    default = "cron(0 4 * * ? *)"
}
variable "rule_name" {
    default = "ManagedBackupDaily"
}

variable "vaultname" {
    default = "ManagedVault"
}

variable "vault_kms_key" {
    default = ""
}

variable "changeable_for_days" {
    default = "7"
}

variable "max_retention_days" {
    default = "30"
}

variable "min_retention_days" {
    default = "7"
}

variable "lock_vault" {
    default = true
}

variable "recovery_point_tags" {
    default = { 
        BackupPlan = "ManagedBackupPlan"
    }
}

variable "cold_storage_after" {
    default = "0"
}

variable "selection_tag_key_1" {
    type = string
    default = "Provider"
}

variable "selection_tag_value_1" {
    type = string
    default = "Terraform"
}

variable "enable_continuous_backup" {
    type = bool
    description = "To enable continuous backups"
    default = false
}
variable "awsbackup_iam_role_name" {}
variable "backup_selection_name" {}
variable "destination_vault_arn" {
    type = list(string)
    default = []
}
variable "copy_retention_days" {
    default = "7"
}