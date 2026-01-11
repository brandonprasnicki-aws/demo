# firewall removal last step?
module "VPC" {
  source      = "../../modules/VPC"
  common_tags = var.common_tags
  tag_prefix  = var.common_tags["Project"]

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
  pri_subnet_purpose = ["public", "private"]
  # there is a resource for each az and this loops per subnet.  Below needs to be in order of purpose.

  pri_sn_az1_cidrs                                = ["10.0.0.0/24", "10.0.2.0/24"]
  pri_sn_az2_cidrs                                = ["10.0.1.0/24", "10.0.3.0/24"]
  pri_sn_az3_cidrs                                = []
  flow_log_cloudwatch_log_group_retention_in_days = "30"
  s3_endpoint_route_tables                        = flatten(concat([module.VPC.private_route_table_id]))
}
