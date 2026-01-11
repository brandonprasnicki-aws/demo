# firewall removal last step?
module "InspectionVPC" {
  source      = "../modules/VPC"
  common_tags = var.common_tags
  tag_prefix  = "${var.common_tags["Project"]}-inspection"

  vpc_cidrs          = [var.vpc_cidr]
  availability_zones = var.availability_zones
  region             = var.region

  natgwy_availability_zones = []

  # these need to match the index of the natgwy_availability_zones
  az1_rt_natgwy_index_tgt = 0
  az2_rt_natgwy_index_tgt = null
  az3_rt_natgwy_index_tgt = null
  #
  pub_subnet_purpose = ""
  #this loops per az
  pub_sn_cidrs = []

  # this is for unique purpose names and must match the sn cidr range.  They are assumed to be the same per az.
  pri_subnet_purpose = ["conn", "fw"]
  # there is a resource for each az and this loops per subnet.  Below needs to be in order of purpose.

  pri_sn_az1_cidrs                                = ["10.110.0.0/24", "10.110.2.0/24"]
  pri_sn_az2_cidrs                                = ["10.110.1.0/24", "10.110.3.0/24"]
  pri_sn_az3_cidrs                                = []
  flow_log_cloudwatch_log_group_retention_in_days = "30"
  #s3_endpoint_route_tables = flatten(concat([module.VPC.private_route_table_id]))
}
#firewall change this can be removed and nat gwy moved to ingress
module "EgressVPC" {
  source      = "../modules/VPC"
  common_tags = var.common_tags
  tag_prefix  = "${var.common_tags["Project"]}-egress"

  vpc_cidrs          = [var.net_egress_vpc_cidr]
  availability_zones = var.availability_zones
  region             = var.region

  natgwy_availability_zones = var.availability_zones

  # these need to match the index of the natgwy_availability_zones
  az1_rt_natgwy_index_tgt = 0
  az2_rt_natgwy_index_tgt = 1
  az3_rt_natgwy_index_tgt = null
  #
  pub_subnet_purpose = "pub"
  #this loops per az
  pub_sn_cidrs = ["10.110.16.0/24", "10.110.17.0/24"]

  # this is for unique purpose names and must match the sn cidr range.  They are assumed to be the same per az.
  pri_subnet_purpose = ["conn"]
  # there is a resource for each az and this loops per subnet.  Below needs to be in order of purpose.

  pri_sn_az1_cidrs                                = ["10.110.18.0/24"]
  pri_sn_az2_cidrs                                = ["10.110.19.0/24"]
  pri_sn_az3_cidrs                                = []
  flow_log_cloudwatch_log_group_retention_in_days = "30"
  #s3_endpoint_route_tables = flatten(concat([module.VPC.private_route_table_id]))

}
# firewall change 1 add nat gwy here and change name
module "IngressVPC" {
  source      = "../modules/VPC"
  common_tags = var.common_tags
  #firewall
  tag_prefix = "${var.common_tags["Project"]}-ingress"

  vpc_cidrs          = [var.net_ingress_vpc_cidr]
  availability_zones = var.availability_zones
  region             = var.region

  natgwy_availability_zones = []

  # these need to match the index of the natgwy_availability_zones
  # firewall change - change 1st 2 to 0 and 1
  az1_rt_natgwy_index_tgt = null
  az2_rt_natgwy_index_tgt = null
  az3_rt_natgwy_index_tgt = null
  #
  pub_subnet_purpose = "pub"
  #this loops per az
  pub_sn_cidrs = ["10.110.32.0/24", "10.110.33.0/24"]

  # this is for unique purpose names and must match the sn cidr range.  They are assumed to be the same per az.
  pri_subnet_purpose = ["conn"]
  # there is a resource for each az and this loops per subnet.  Below needs to be in order of purpose.

  pri_sn_az1_cidrs                                = ["10.110.34.0/24"]
  pri_sn_az2_cidrs                                = ["10.110.35.0/24"]
  pri_sn_az3_cidrs                                = []
  flow_log_cloudwatch_log_group_retention_in_days = "30"
  #s3_endpoint_route_tables = flatten(concat([module.VPC.private_route_table_id]))

}

