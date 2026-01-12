resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = flatten([var.subnet_ids])
  description = "${var.environment} Database Subnet Group"
  tags = {
    Name = var.db_subnet_group_name
  }
}