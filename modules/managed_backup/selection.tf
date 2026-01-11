resource "aws_iam_role" "managed_backup_selection_role" {
  name               = var.awsbackup_iam_role_name
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "managed_backup_selection_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.managed_backup_selection_role.name
}

resource "aws_backup_selection" "managed_backup_selection" {
  iam_role_arn = aws_iam_role.managed_backup_selection_role.arn
  name         = var.backup_selection_name
  plan_id      = aws_backup_plan.main.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = var.selection_tag_key_1
    value = var.selection_tag_value_1
  }

}