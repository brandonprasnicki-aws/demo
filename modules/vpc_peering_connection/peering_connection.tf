/* this piece done manually since working through 3rd party
resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id   = var.peer_vpc_id
  vpc_id        = var.vpc_id
  auto_accept   = true

  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.peer_name}"
    },
  )
}
*/