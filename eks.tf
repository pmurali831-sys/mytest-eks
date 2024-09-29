resource "aws_eks_cluster" "dev_cluster" {
  name     = "example"
  role_arn = aws_iam_role.eks_master_policy.arn
  version = "1.28"
# where your eks elastic network interface will going to create
  vpc_config {
    subnet_ids = module.vpc.public_subnets
    endpoint_private_access = false
    endpoint_public_access = true
    public_access_cidrs = ["0.0.0.0/0"]
  }
  kubernetes_network_config {
    service_ipv4_cidr = "192.168.0.0/16"
  }

# Enable cluster login type
    enabled_cluster_log_types = [ "api","audit" ]
  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy,
    aws_iam_role_policy_attachment.vpc_resource
  ]
}

# output "endpoint" {
#   value = aws_eks_cluster.example.endpoint
# }

# output "kubeconfig-certificate-authority-data" {
#   value = aws_eks_cluster.example.certificate_authority[0].data
# }