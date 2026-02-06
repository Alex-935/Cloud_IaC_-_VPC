provider "aws" {
  region = var.aws-region
}


# VPC
resource "aws_vpc" "se-alex-vpc-ref" {
  cidr_block = var.vpc-cidr-ip
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "se-alex-vpc-terra"
  }
}



# app subnet - subnet public
resource "aws_subnet" "se-alex-public-subnet-ref" {

  vpc_id     = aws_vpc.se-alex-vpc-ref.id
  cidr_block = var.public-subnet-ip
  region     = var.aws-region

  tags = {
    Name = "se-alex-public-subnet-tf"
  }
}
#  availability_zone = var.aws-region
#  map_public_ip_on_launch = true

# db subnet - subnet private
resource "aws_subnet" "se-alex-private-subnet-ref" {

  vpc_id     =aws_vpc.se-alex-vpc-ref.id
  cidr_block = var.private-subnet-ip
  region     = var.aws-region

  tags = {
    Name = "se-alex-private-subnet-tf"
  }
}



# internet gateway
resource "aws_internet_gateway" "se-alex-internet-gateway-ref" {

    vpc_id = aws_vpc.se-alex-vpc-ref.id

    tags = {
        Name = "se-alex-internet-gateway"
    }
}



# Route table
resource "aws_route_table" "se-alex-route-table-ref" {

    vpc_id = aws_vpc.se-alex-vpc-ref.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.se-alex-internet-gateway-ref.id
    }
    
    tags = {
        Name = "se-alex-route-table"
    }
}

resource "aws_route_table_association" "se-alex-public-route-table-association" {
    subnet_id = aws_subnet.se-alex-public-subnet-ref.id
    route_table_id = aws_route_table.se-alex-route-table-ref.id
}



# Security Group
resource "aws_security_group" "se-alex-app-sg-ref" {
    name = "se-alex-app-sg"
    description = "Security group for sparta app instance"
    vpc_id = aws_vpc.se-alex-vpc-ref.id

    tags = {
        Name = "se-alex-app-sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "port22-rule" {
    security_group_id = aws_security_group.se-alex-app-sg-ref.id
    cidr_ipv4 = aws_vpc.se-alex-vpc-ref.cidr_block
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}
resource "aws_vpc_security_group_ingress_rule" "port80-rule" {
    security_group_id = aws_security_group.se-alex-app-sg-ref.id
    cidr_ipv4 = aws_vpc.se-alex-vpc-ref.cidr_block
    from_port = 80
    ip_protocol = "tcp"
    to_port = 80
}
resource "aws_vpc_security_group_ingress_rule" "port3000-rule" {
    security_group_id = aws_security_group.se-alex-app-sg-ref.id
    cidr_ipv4 = aws_vpc.se-alex-vpc-ref.cidr_block
    from_port = 3000
    ip_protocol = "tcp"
    to_port = 3000
}
resource "aws_vpc_security_group_egress_rule" "allow-all-traffic-ipv4" {
    security_group_id = aws_security_group.se-alex-app-sg-ref.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1" # semantically equivalent to all ports
}
# cidr_blocks = ["0.0.0.0/0"]


resource "aws_security_group" "se-alex-db-sg-ref" {
    name = "se-alex-db-sg"
    description = "Security group for mongoDB instance"
    vpc_id = aws_vpc.se-alex-vpc-ref.id

    tags = {
        Name = "se-alex-db-sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "port27017-rule" {
    security_group_id = aws_security_group.se-alex-db-sg-ref.id
    cidr_ipv4 = aws_vpc.se-alex-vpc-ref.cidr_block
    from_port = 27017
    ip_protocol = "tcp"
    to_port = 27017
}



# EC2 instance




# Custom variable = terraform apply -var-file=fileName.tfvars