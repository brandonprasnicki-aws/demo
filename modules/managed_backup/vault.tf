resource "aws_backup_vault" "main" {
  name        = var.vaultname
  kms_key_arn = var.vault_kms_key

  tags = {
      Name      = var.vaultname
    }
}

resource "aws_backup_vault_lock_configuration" "main" {
  count = var.lock_vault?1:0

  backup_vault_name   = aws_backup_vault.main.name
  changeable_for_days = var.changeable_for_days 
  max_retention_days  = var.max_retention_days
  min_retention_days  = var.min_retention_days
}
