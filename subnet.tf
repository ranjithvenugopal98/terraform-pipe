# Creating 1st web subnet
resource "aws_subnet" "public-subnet-1" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.1.0/24"
 map_public_ip_on_launch = true
 availability_zone = "eu-west-1b"
tags = {
  Name = "Web Subnet 1"
}
}

# Creating 2nd web subnet
resource "aws_subnet" "public-subnet-2" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.2.0/24"
 map_public_ip_on_launch = true
 availability_zone = "eu-west-1a"
tags = {
  Name = "Web Subnet 2"
}
}

# Creating 1st application subnet
resource "aws_subnet" "application-subnet-1" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.3.0/24"
 map_public_ip_on_launch = false
 availability_zone = "eu-west-1b"
tags = {
  Name = "Application Subnet 1"
}
}

# Creating 2nd application subnet
resource "aws_subnet" "application-subnet-2" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.4.0/24"
 map_public_ip_on_launch = false
 availability_zone = "eu-west-1a"
tags = {
  Name = "Application Subnet 2"
}
}

# Creating Database Private subnet
resource "aws_subnet" "database-subnet-1" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.5.0/24"
 availability_zone = "eu-west-1b"
tags = {
  Name = "Database Subnet 1"
}
}

# Creating Database Private subnet
resource "aws_subnet" "database-subnet-2" {
 vpc_id     = aws_vpc.my-vpc.id
 cidr_block = "10.0.6.0/24"
 availability_zone = "eu-west-1a"
tags = {
  Name = "Database Subnet 2"
}
}

