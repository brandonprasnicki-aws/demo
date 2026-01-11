resource "aws_ram_resource_share_accepter" "receiver_accept" {
  share_arn = var.source_resource_share_arn
}