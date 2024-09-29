resource "aws_eip" "myeip" {
  instance = module.ec2_public.id
  vpc   = "true"
  depends_on = [ module.ec2_public, module.vpc ]
}

