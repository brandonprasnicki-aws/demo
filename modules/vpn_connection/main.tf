
locals {
  additional_common_tags = {
    Module = "VPN Connection"

  }

  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_customer_gateway" "cust_gw" {
  bgp_asn    = var.bgp_asn
  ip_address = var.target_vpn_endpoint_ip
  type       = "ipsec.1"
  device_name = var.device_name

  tags = merge(
    var.common_tags,
    {
       Name = "${var.target_name}-customer-gateway-primary"
    },
  )
}



resource "aws_vpn_connection" "vpn_conn" {
  customer_gateway_id = aws_customer_gateway.cust_gw.id
  transit_gateway_id      = var.tgw_id
  type                = "ipsec.1"
  static_routes_only  = var.use_static_route

  tunnel1_preshared_key = var.tunnel1_preshared_key != "" ? var.tunnel1_preshared_key : null
  tunnel2_preshared_key = var.tunnel2_preshared_key != "" ? var.tunnel2_preshared_key : null
/*
  tunnel1_ike_versions  = ["ikev2",]
  tunnel1_phase1_dh_group_numbers = [14, 15, 16, 19, 20, 21,]
  tunnel1_phase1_encryption_algorithms    = ["AES256", "AES256-GCM-16",]
  tunnel1_phase1_integrity_algorithms     = ["SHA2-256", "SHA2-384", "SHA2-512",]
  tunnel1_phase2_dh_group_numbers         = [14, 15, 16, 19, 20, 21,]
  tunnel1_phase2_encryption_algorithms    = ["AES256", "AES256-GCM-16",]
  tunnel1_phase2_integrity_algorithms     = ["SHA2-256", "SHA2-384", "SHA2-512",]
  tunnel2_ike_versions  = ["ikev2",]
  tunnel2_phase1_dh_group_numbers = [14, 15, 16, 19, 20, 21,]
  tunnel2_phase1_encryption_algorithms    = ["AES256", "AES256-GCM-16",]
  tunnel2_phase1_integrity_algorithms     = ["SHA2-256", "SHA2-384", "SHA2-512",]
  tunnel2_phase2_dh_group_numbers         = [14, 15, 16, 19, 20, 21,]
  tunnel2_phase2_encryption_algorithms    = ["AES256", "AES256-GCM-16",]
  tunnel2_phase2_integrity_algorithms     = ["SHA2-256", "SHA2-384", "SHA2-512",]


 */


  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.target_name}-vpn-connection-primary"
      "ams:rt:ams-monitoring-policy" = "ams-monitored"
    },
  )
  
}


