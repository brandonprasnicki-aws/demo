output "tunnel1_ip" {
  value = aws_vpn_connection.vpn_conn.tunnel1_address
  description = "IP of the VPN tunnel 1"
}

output "tunnel2_ip" {
  value = aws_vpn_connection.vpn_conn.tunnel2_address
  description = "IP of the VPN tunnel 2"
}

output "tgw_vpn_attachment_id" {
  value = aws_vpn_connection.vpn_conn.transit_gateway_attachment_id
}
output "VPN_ID" {
  value = aws_vpn_connection.vpn_conn.id
}