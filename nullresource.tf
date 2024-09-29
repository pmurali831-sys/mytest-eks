# resource "null_resource" "copy_pem" {
#  depends_on = [ module.ec2_public ] 

#  connection {
#    password = ""
#    host = aws_eip.myeip.public_ip
#    type = "ssh"
#    user = "ec2-user"
#    private_key = file("keypair/mykey.pem")
#  }
#  provisioner "file" {
#     source = "keypair/mykey.pem"
#     destination = "/tmp/mykey.pem"
   
#  }
#  provisioner "remote-exec" {
#    inline = [ 
#     "sudo chmod 400 /tmp/mykey.pem"
#     ]
#  }
# }