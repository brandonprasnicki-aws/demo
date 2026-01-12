resource "aws_eks_access_entry" "this" {
  cluster_name      = aws_eks_cluster.this.name
  principal_arn     = var.access_entry_principal_arn
  kubernetes_groups = var.kubernetes_groups
  type              = var.access_entry_type
}
