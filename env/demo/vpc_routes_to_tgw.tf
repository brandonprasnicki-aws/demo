/*
#step 6

# note here below for inspection route tables that only the fw tables should go to TGW, the connectivity route tables have been manually updated via the console to route to the aws fw / gwlb endpoints

module "InpectionVPC_TGW_Routes" {
  source     = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr = "0.0.0.0/0"
  # this is going to need to be changed.  probably need to do a data lookup between connection and fw as only fw needs to go to inspection and conn needs to go to fw endpoint when it's available
  route_tables = flatten([module.InspectionVPC.private_route_table_az1_ids[1], module.InspectionVPC.private_route_table_az2_ids[1]])
  tgw_id       = module.TransitGW.transit_gateway_id
}
###########

module "IngressVPC_TGW_to_Dev_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.dev_vpc_cidr
  route_tables = flatten([module.IngressVPC.private_route_table_az1_ids, module.IngressVPC.private_route_table_az2_ids, module.IngressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "IngressVPC_TGW_to_Domain_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.domain_vpc_cidr
  route_tables = flatten([module.IngressVPC.private_route_table_az1_ids, module.IngressVPC.private_route_table_az2_ids, module.IngressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "IngressVPC_TGW_to_Prod_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.prod_vpc_cidr
  route_tables = flatten([module.IngressVPC.private_route_table_az1_ids, module.IngressVPC.private_route_table_az2_ids, module.IngressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "IngressVPC_TGW_to_int_qa_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.int-qa_vpc_cidr
  route_tables = flatten([module.IngressVPC.private_route_table_az1_ids, module.IngressVPC.private_route_table_az2_ids, module.IngressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "IngressVPC_TGW_to_shared_services_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.shared_services_vpc_cidr
  route_tables = flatten([module.IngressVPC.private_route_table_az1_ids, module.IngressVPC.private_route_table_az2_ids, module.IngressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
#####
module "EgressVPC_TGW_to_Dev_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.dev_vpc_cidr
  route_tables = flatten([module.EgressVPC.private_route_table_az1_ids, module.EgressVPC.private_route_table_az2_ids, module.EgressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "EgressVPC_TGW_to_Domain_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.domain_vpc_cidr
  route_tables = flatten([module.EgressVPC.private_route_table_az1_ids, module.EgressVPC.private_route_table_az2_ids, module.EgressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "EgressVPC_TGW_to_Prod_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.prod_vpc_cidr
  route_tables = flatten([module.EgressVPC.private_route_table_az1_ids, module.EgressVPC.private_route_table_az2_ids, module.EgressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "EgressVPC_TGW_to_int_qa_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.int-qa_vpc_cidr
  route_tables = flatten([module.EgressVPC.private_route_table_az1_ids, module.EgressVPC.private_route_table_az2_ids, module.EgressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
module "EgressVPC_TGW_to_shared_services_Routes" {
  source       = "\.\./\.\./modules/VPC_SN_TGW_Routes"
  route_cidr   = var.shared_services_vpc_cidr
  route_tables = flatten([module.EgressVPC.private_route_table_az1_ids, module.EgressVPC.private_route_table_az2_ids, module.EgressVPC.public_route_table_id])
  tgw_id       = module.TransitGW.transit_gateway_id
}
*/
