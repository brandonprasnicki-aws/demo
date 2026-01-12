module "eks_cluster" {
  source       = "../../modules/eks"
  cluster_name = "my-cluster"
  subnet_ids   = [module.VPC.pri_subnets_az1_ids[0], module.VPC.pri_subnets_az2_ids[0]]
}
