# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "terraform-2" {
  ami                         = "ami-04b1c88a6bbd48f8e"
  instance_type               = "t2.micro"
  key_name                    = "spidey-1"
  vpc_security_group_ids      = [aws_security_group.demosg.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
tags = {
  Name = "My Public Instance"
}
}

# Creating 2nd EC2 isntance in Public Subnet
resource "aws_instance" "terraform-3" {
  ami                         = "ami-04b1c88a6bbd48f8e"
  instance_type               = "t2.micro"
  key_name                    = "spidey-1"
  vpc_security_group_ids      = [aws_security_group.demosg.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
tags = {
  Name = "My Public Instance 2"
}
}

