resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types

  ami_type      = var.ami_type
  disk_size     = var.disk_size
  capacity_type = var.capacity_type
  remote_access {
    ec2_ssh_key               = var.ssh_key_name
    source_security_group_ids = var.source_security_group_ids
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.node_group_name}-${aws_eks_cluster.this.name}"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}
