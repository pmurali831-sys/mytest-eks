resource "aws_eks_node_group" "eks_node_group_public" {
  cluster_name    = aws_eks_cluster.dev_cluster.name
  node_group_name = "my_dev_public"
  node_role_arn   = aws_iam_role.eks_worker_node.arn
  subnet_ids      = module.vpc.public_subnets
  version = "1.28"
  ami_type = "AL2_x86_64"
  instance_types = ["t3.medium"]
  capacity_type = "SPOT"
  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.amazon_worker_node,
    aws_iam_role_policy_attachment.amazon_cni,
    aws_iam_role_policy_attachment.amazon_ecr_readonly,
  ]
  tags = {
    name = "Public eks node groups"
  }
}