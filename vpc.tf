module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  single_nat_gateway  = true
  enable_nat_gateway = true
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets = var.database_subnets
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  map_public_ip_on_launch = true

  public_subnet_tags = {
    name = "public-subnet"
  }
  private_subnet_tags = {
    name = "private-subnet"
  }
  database_subnet_tags = {
    name = "database-subnet"
  }
  tags = {
    owner = "Krishna"
    Env = "dev"
  }
} 
