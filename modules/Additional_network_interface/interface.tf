resource "aws_network_interface" "this" {
  subnet_id       = var.subnet_id
  private_ips     = [var.private_ip]
  security_groups = var.security_group_ids

  attachment {
    instance     = var.instance_id
    device_index = 1
  }
}