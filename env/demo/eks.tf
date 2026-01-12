module "eks_cluster" {
  source       = "../../modules/eks"
  cluster_name = "my-cluster"
  subnet_ids   = [module.VPC.pri_subnets_az1_ids[0], module.VPC.pri_subnets_az2_ids[0]]
  access_entry_principal_arn = "arn:aws:iam::042776340228:user/brandonprasnicki@gmail.com"
  node_group_name = "my-node-group"
  ssh_key_name = "mysshkey"
}
