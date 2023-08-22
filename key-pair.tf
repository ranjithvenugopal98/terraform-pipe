#Creating Key_pair to attach EC2 Instance
resource "aws_key_pair" "key-pair" {
  key_name   = "spidey-2"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key-pair" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "spidey-2"
}
