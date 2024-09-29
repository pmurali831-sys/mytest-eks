resource "aws_iam_role" "eks_master_policy" {
    name = "aws_master_policy"
    assume_role_policy = <<POLICY
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "cluster_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_master_policy.name
  
}
resource "aws_iam_role_policy_attachment" "vpc_resource" {
    role = aws_iam_role.eks_master_policy.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  
}

resource "aws_iam_role" "eks_worker_node" {
    name = "eks-worker-node"
    assume_role_policy = <<POLICY
    {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
 POLICY 
}

resource "aws_iam_role_policy_attachment" "amazon_worker_node" {
  role = aws_iam_role.eks_worker_node.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "amazon_cni" {
  role = aws_iam_role.eks_worker_node.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "amazon_ecr_readonly" {
  role = aws_iam_role.eks_worker_node.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}