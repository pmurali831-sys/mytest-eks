resource "aws_iam_openid_connect_provider" "my_provider" {
  url = aws_eks_cluster.dev_cluster.identity[0].oidc[0].issuer
  client_id_list = ["sts.amazon.com"]
  thumbprint_list = ["9aa62c7ca854cdf9bfca9d17486431861704a2e4"]
}
locals {
  aws_open_id_connect_cut_string = element(split("oidc-provider/", " ${aws_iam_openid_connect_provider.my_provider.arn}"), 1)
}

output "aws_cut_openid" {
  value = local.aws_open_id_connect_cut_string
}