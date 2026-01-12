/*
#step 1
module "TransitGW" {
  source      = "../../modules/transit_gw"
  common_tags = var.common_tags
}

######## Attachments that will have routes from firewall back out to VPC's ##############
#firewall removal 2nd to last step?
module "TransitGW_Network_Inspection_Attachment" {
  source                 = "../../modules/transit_gw_attachment"
  appliance_mode_support = "enable"
  #pri_subnet_purpose = ["conn", "fw"] -
  tgw_attachment_subnets = flatten([module.InspectionVPC.pri_subnets_az1_ids[0], module.InspectionVPC.pri_subnets_az2_ids[0]])
  tgw_id                 = module.TransitGW.transit_gateway_id
  vpc_id                 = module.InspectionVPC.vpc_id
  tag_prefix             = "${var.common_tags["Project"]}-inspection"
}
########## Attachments that will have routes sent for Inspection #################
module "TransitGW_Network_Egress_Attachment" {
  source                 = "../../modules/transit_gw_attachment"
  appliance_mode_support = "enable"
  #pri_subnet_purpose = ["conn", "fw"] -
  tgw_attachment_subnets = flatten([module.EgressVPC.pri_subnets_az1_ids[0], module.EgressVPC.pri_subnets_az2_ids[0]])
  tgw_id                 = module.TransitGW.transit_gateway_id
  vpc_id                 = module.EgressVPC.vpc_id
  tag_prefix             = "${var.common_tags["Project"]}-egress"
}
module "TransitGW_Network_Ingress_Attachment" {
  source                 = "../../modules/transit_gw_attachment"
  appliance_mode_support = "enable"
  #pri_subnet_purpose = ["conn", "fw"] -
  tgw_attachment_subnets = flatten([module.IngressVPC.pri_subnets_az1_ids[0], module.IngressVPC.pri_subnets_az2_ids[0]])
  tgw_id                 = module.TransitGW.transit_gateway_id
  vpc_id                 = module.IngressVPC.vpc_id
  tag_prefix             = "${var.common_tags["Project"]}-ingress"
}
# This module creates the tgw rt, the routes, and also associates it with an attachment.

# firewall removal step ?
module "TransitGW_to_Inspection_routes" {
  source      = "../../modules/transit_gw_route_table"
  common_tags = var.common_tags

  source_tgw_attachment = [module.TransitGW_Network_Egress_Attachment.vpc_attachment_id, module.TransitGW_Network_Ingress_Attachment.vpc_attachment_id]
  #These next to variables will need to be in sync.  It's for the route rules of the table.  The cidr, and then where (what attachment) that cidr is being routed to
  tgw_rt_cidrs                         = ["0.0.0.0/0"]
  routed_transit_gateway_attachment_id = [module.TransitGW_Network_Inspection_Attachment.vpc_attachment_id] #, module.VPNConnection.tgw_vpn_attachment_id, module.VPNConnection.tgw_vpn_attachment_id]
  tag_prefix                           = "${var.common_tags["Project"]}-to-inspection"
  tgw_id                               = module.TransitGW.transit_gateway_id

}

############## dev ##################
#step 2 is share the TGW to workload spoke account. In this case, Dev
module "RamShare_1" {
  source         = "../../modules/ram"
  common_tags    = var.common_tags
  share_name     = "TGW share Account A"
  target_account = "xxx"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShare_2" {
  source         = "../../modules/ram"
  common_tags    = var.common_tags
  share_name     = "TGW share Account B"
  target_account = "xxx"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShare_3" {
  source         = "../../modules/ram"
  common_tags    = var.common_tags
  share_name     = "TGW share Account C"
  target_account = "x"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}


#step 3 is to accept the TGW RAM share in the attachment in a spoke account (Dev).  This is done in a separate workload account repo.  This may or may not be needed based on org configuration.
#step 4 is to create the TGW attachment in the spoke account (Dev).  This is done in a separate workload account repo.
#step 5 is to accept the attachment from the spoke account created in step 4
module "TransitGW_Attach_Accept" {
  source = "../../modules/transit_gw_attach_accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-xxx"
  tag_prefix        = "demo"
}

#step 6 is to update VPC route tables to route appropriate cidrs to the tgw.  for spoke accounts any cidr not in the VPC should go to tgw (0.0.0.0/0)  this will need to be done in
#all within VPCs route tables, even networking VPC's

#
#step 7
# This is for skipping inspection for EW traffic, but sending NS for inspection.  If EW is to be inspected as well, the to Inspection TGW route table can be associated with workload attachments
# inspection is no longer happening but the name needs to remain to maintain the module configuration so not everything is destroyed.
module "TransitGW_EW_Routes_NS_Inspection" {
  source      = "../../modules/transit_gw_route_table"
  common_tags = var.common_tags
  #This is for what attachments to attach this route table attachments created in other accounts will need to be literals
  # 0.0.0.0/0 for NS inspection, other routes to other workloads, skipping inspection
  #                                 demo
  source_tgw_attachment = ["tgw-attach-xxxx"]
  #These next two variables will need to be in sync.  It's for the route rules of the table.  The cidr, and then where (what attachment) that cidr is being routed to
  #The more specific routes will take precedent
  #firewall change 1                                                                                                                                                                                                                                           #firewall change remove and change to 1st spot
  tgw_rt_cidrs = ["0.0.0.0/0"]
  #                          #demo
  #firewall change 1 - change this to ingress
  routed_transit_gateway_attachment_id = [module.TransitGW_Network_Inspection_Attachment.vpc_attachment_id]
  # firewall change name step 1
  tag_prefix = "ew-routes-ns-inspection"
  tgw_id     = module.TransitGW.transit_gateway_id

}

# firewall change step?  This can be removed at same time inspection attachment is removed
module "TransitGW_After_Inspection" {
  source      = "../../modules/transit_gw_route_table"
  common_tags = var.common_tags
  #This is for what attachments to attach this route table attachments created in other accounts will need to be literals
  # 0.0.0.0/0 for NS inspection, other routes to other workloads, skipping inspection
  #                                 network
  source_tgw_attachment = [module.TransitGW_Network_Inspection_Attachment.vpc_attachment_id]
  #These next to variables will need to be in sync.  It's for the route rules of the table.  The cidr, and then where (what attachment) that cidr is being routed to
  #The more specific routes will take precedent
  tgw_rt_cidrs = ["0.0.0.0/0", var.demo_vpc_cidr, var.etc]
  #                                                             demo                                                                                          Isolated SS
  routed_transit_gateway_attachment_id = [module.TransitGW_Network_Egress_Attachment.vpc_attachment_id]

  tag_prefix = "routes-after-inspection"
  tgw_id     = module.TransitGW.transit_gateway_id

}
*/
