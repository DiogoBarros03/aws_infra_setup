resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "my_ec2_key_pair"
  public_key = tls_private_key.my_key_pair.public_key_openssh
}
