/*
#step 8
module "VPNConnection" {
<<<<<<< HEAD
  source = "../../modules/modules/VPNConnection"
=======
  source = "\.\./\.\./modules/VPNConnection"
>>>>>>> fcdad151850847e8cf8e830aeeedc7711331988e
  #common_tags = merge(var.common_tags, {"ams:rt:ams-monitoring-policy" = "ams-monitored"})
  common_tags            = var.common_tags
  target_name            = "onprem"
  target_vpn_endpoint_ip = "50.232.182.66"
  tgw_id                 = module.TransitGW.transit_gateway_id
  bgp_asn                = "6500"
  device_name            = "onprem-device"
}
*/
