output "eks_config" {
  value = aws_eks_cluster.dev_cluster.id
  description = "cluster id display"
}

output "cluster_arn" {
  value = aws_eks_cluster.dev_cluster.arn
  description = "It will get the cluster arn"
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.dev_cluster.certificate_authority[0].data
}

output "cluster_endpoing" {
  value = aws_eks_cluster.dev_cluster.endpoint
}
output "cluster_oidc_url" {
  value = aws_eks_cluster.dev_cluster.identity[0].oidc[0].issuer
}

output "open_id_connect" {
  value = aws_iam_openid_connect_provider.my_provider.arn
}