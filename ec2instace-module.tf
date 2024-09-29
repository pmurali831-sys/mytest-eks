module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"
  version = "3.3.0"
  ami = data.aws_ami.myami.id
  instance_type          = "t2.micro"
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    managed   = "Terraform"
    Environment = "dev"
  }
}