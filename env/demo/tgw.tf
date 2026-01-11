/*
#step 1
module "TransitGW" {
  source      = "\.\./\.\./modules/TransitGW"
  common_tags = var.common_tags
}

######## Attachments that will have routes from firewall back out to VPC's ##############
#firewall removal 2nd to last step?
module "TransitGW_Network_Inspection_Attachment" {
  source                 = "\.\./\.\./modules/TransitGWAttachment"
  appliance_mode_support = "enable"
  #pri_subnet_purpose = ["conn", "fw"] -
  tgw_attachment_subnets = flatten([module.InspectionVPC.pri_subnets_az1_ids[0], module.InspectionVPC.pri_subnets_az2_ids[0]])
  tgw_id                 = module.TransitGW.transit_gateway_id
  vpc_id                 = module.InspectionVPC.vpc_id
  tag_prefix             = "${var.common_tags["Project"]}-inspection"
}
########## Attachments that will have routes sent for Inspection #################
module "TransitGW_Network_Egress_Attachment" {
  source                 = "\.\./\.\./modules/TransitGWAttachment"
  appliance_mode_support = "enable"
  #pri_subnet_purpose = ["conn", "fw"] -
  tgw_attachment_subnets = flatten([module.EgressVPC.pri_subnets_az1_ids[0], module.EgressVPC.pri_subnets_az2_ids[0]])
  tgw_id                 = module.TransitGW.transit_gateway_id
  vpc_id                 = module.EgressVPC.vpc_id
  tag_prefix             = "${var.common_tags["Project"]}-egress"
}
module "TransitGW_Network_Ingress_Attachment" {
  source                 = "\.\./\.\./modules/TransitGWAttachment"
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
  source      = "\.\./\.\./modules/TransitGWRouteTable"
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
module "RamShareDev" {
  source         = "\.\./\.\./modules/RAM"
  common_tags    = var.common_tags
  share_name     = "TGW share Dev"
  target_account = "298659883119"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShareDS" {
  source         = "\.\./\.\./modules/RAM"
  common_tags    = var.common_tags
  share_name     = "TGW share Domain Servers"
  target_account = "372583097740"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShareQAInt" {
  source         = "\.\./\.\./modules/RAM"
  common_tags    = var.common_tags
  share_name     = "TGW share QA Int"
  target_account = "266798532559"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShareProd" {
  source         = "\.\./\.\./modules/RAM"
  common_tags    = var.common_tags
  share_name     = "TGW share Prod"
  target_account = "063598468461"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}
module "RamShareSharedServices" {
  source         = "\.\./\.\./modules/RAM"
  common_tags    = var.common_tags
  share_name     = "TGW share Shared Services"
  target_account = "184208908453"
  tgw_arn        = module.TransitGW.transit_gateway_arn
}


#step 3 is to accept the TGW RAM share in the attachment in a spoke account (Dev).  This is done in a separate workload account repo.  This may or may not be needed based on org configuration.
#step 4 is to create the TGW attachment in the spoke account (Dev).  This is done in a separate workload account repo.
#step 5 is to accept the attachment from the spoke account created in step 4
module "Dev_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-09d6051e6b668a41b"
  tag_prefix        = "dev"
}
module "DS_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-0b43f30e1436c4df3"
  tag_prefix        = "ds"
}
module "QA_Int_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-04f9139e98bd5f736"
  tag_prefix        = ""
}
module "Prod_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-092dffc6d664a24a6"
  tag_prefix        = "prod"
}
module "SS_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-0b0c4a49d502a66cc"
  tag_prefix        = "shared-services"
}
module "Isolated_SS_TransitGW_Attach_Accept" {
  source = "\.\./\.\./modules/TransitGW_Attach_Accept"
  #Dev attachment.  You will need to grab this value from the UI.  It's in Dev, or in networking in pending state.
  tgw_attachment_id = "tgw-attach-08f7f901528f20cd8"
  tag_prefix        = "isolated-shared-services"
}
#step 6 is to update VPC route tables to route appropriate cidrs to the tgw.  for spoke accounts any cidr not in the VPC should go to tgw (0.0.0.0/0)  this will need to be done in
#all within VPCs route tables, even networking VPC's

#
#step 7
# This is for skipping inspection for EW traffic, but sending NS for inspection.  If EW is to be inspected as well, the to Inspection TGW route table can be associated with workload attachments
# inspection is no longer happening but the name needs to remain to maintain the module configuration so not everything is destroyed.
module "TransitGW_EW_Routes_NS_Inspection" {
  source      = "\.\./\.\./modules/TransitGWRouteTable"
  common_tags = var.common_tags
  #This is for what attachments to attach this route table attachments created in other accounts will need to be literals
  # 0.0.0.0/0 for NS inspection, other routes to other workloads, skipping inspection
  #                                 dev                              domainservers                            VPN                             INT-QA                       Prod                             SS                                   Isolated SS
  source_tgw_attachment = ["tgw-attach-09d6051e6b668a41b", "tgw-attach-0b43f30e1436c4df3", module.VPNConnection.tgw_vpn_attachment_id, "tgw-attach-04f9139e98bd5f736", "tgw-attach-092dffc6d664a24a6", "tgw-attach-0b0c4a49d502a66cc", "tgw-attach-08f7f901528f20cd8"]
  #These next two variables will need to be in sync.  It's for the route rules of the table.  The cidr, and then where (what attachment) that cidr is being routed to
  #The more specific routes will take precedent
  #firewall change 1                                                                                                                                                                                                                                           #firewall change remove and change to 1st spot
  tgw_rt_cidrs = ["0.0.0.0/0", var.dev_vpc_cidr, var.on_prem_cidrs[0], var.on_prem_cidrs[1], var.domain_vpc_cidr, var.int-qa_vpc_cidr, var.prod_vpc_cidr, var.on_prem_cidrs[2], var.on_prem_cidrs[3], var.shared_services_vpc_cidr, var.shared_services_isolated_vpc_cidr, var.net_ingress_vpc_cidr]
  #                                                                                                            #dev                                      #vpn                                        #vpn                                     #domainservers              INT-QA                               Prod                              #vpn                                 #vpn                                        SS                          Isolated SS                             #firewall change 1 - remove to front
  #firewall change 1 - change this to ingress
  routed_transit_gateway_attachment_id = [module.TransitGW_Network_Inspection_Attachment.vpc_attachment_id, "tgw-attach-09d6051e6b668a41b", module.VPNConnection.tgw_vpn_attachment_id, module.VPNConnection.tgw_vpn_attachment_id, "tgw-attach-0b43f30e1436c4df3", "tgw-attach-04f9139e98bd5f736", "tgw-attach-092dffc6d664a24a6", module.VPNConnection.tgw_vpn_attachment_id, module.VPNConnection.tgw_vpn_attachment_id, "tgw-attach-0b0c4a49d502a66cc", "tgw-attach-08f7f901528f20cd8", module.TransitGW_Network_Ingress_Attachment.vpc_attachment_id]
  # firewall change name step 1
  tag_prefix = "ew-routes-ns-inspection"
  tgw_id     = module.TransitGW.transit_gateway_id

}

# firewall change step?  This can be removed at same time inspection attachment is removed
module "TransitGW_After_Inspection" {
  source      = "\.\./\.\./modules/TransitGWRouteTable"
  common_tags = var.common_tags
  #This is for what attachments to attach this route table attachments created in other accounts will need to be literals
  # 0.0.0.0/0 for NS inspection, other routes to other workloads, skipping inspection
  #                                 network
  source_tgw_attachment = [module.TransitGW_Network_Inspection_Attachment.vpc_attachment_id]
  #These next to variables will need to be in sync.  It's for the route rules of the table.  The cidr, and then where (what attachment) that cidr is being routed to
  #The more specific routes will take precedent
  tgw_rt_cidrs = ["0.0.0.0/0", var.dev_vpc_cidr, var.domain_vpc_cidr, var.int-qa_vpc_cidr, var.prod_vpc_cidr, var.shared_services_vpc_cidr, var.net_ingress_vpc_cidr, var.shared_services_isolated_vpc_cidr]
  #                                                                                                            #dev                             # domainservers             int-qa                              Prod                          SS                                                                                                  Isolated SS
  routed_transit_gateway_attachment_id = [module.TransitGW_Network_Egress_Attachment.vpc_attachment_id, "tgw-attach-09d6051e6b668a41b", "tgw-attach-0b43f30e1436c4df3", "tgw-attach-04f9139e98bd5f736", "tgw-attach-092dffc6d664a24a6", "tgw-attach-0b0c4a49d502a66cc", module.TransitGW_Network_Ingress_Attachment.vpc_attachment_id, "tgw-attach-08f7f901528f20cd8"]

  tag_prefix = "routes-after-inspection"
  tgw_id     = module.TransitGW.transit_gateway_id

}
*/
