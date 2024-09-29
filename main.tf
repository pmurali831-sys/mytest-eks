provider "aws" {
   access_key = "AKIA4DMVQ3ZFD2OEWXHC"
   secret_key = "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"
   region = "ap-south-1"
} 

# terraform {
#   required_version = "~> 1.4.5"
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "3.34.0"
#     }
    
#   }
#   backend "s3" {
#     bucket = "terraformtesting"
#     key = "dev/eks-cluster/terraform.tfstate"
#     region = "ap-south-1"
#     dynamodb_table = "eks-cluster"
#   }
# }