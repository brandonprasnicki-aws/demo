/*
#step 8
module "VPNConnection" {
  source = "../../modules/vpn_connection"
  #common_tags = merge(var.common_tags, {"ams:rt:ams-monitoring-policy" = "ams-monitored"})
  common_tags            = var.common_tags
  target_name            = "onprem"
  target_vpn_endpoint_ip = "xx.xxx.xxx.xx"
  tgw_id                 = module.TransitGW.transit_gateway_id
  bgp_asn                = "6500"
  device_name            = "onprem-device"
}
*/
