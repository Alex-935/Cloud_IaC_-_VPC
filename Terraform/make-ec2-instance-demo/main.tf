# Select aws as provider --> downloads plugins needed to interact with aws (terraform init)
provider "aws" {
  region = "eu-west-1"
}

# Which service/resource do we want?
# resource(key word) "serviceName" "reference name inside code" {}
resource "aws_instance" "test_instance_1" {

  # AMI ID?
  ami = "ami-03446a3af42c5e74e"

  # instance type?
  instance_type = "t3.micro"

  # add public id?
  associate_public_ip_address = true

  # name the instance
  tags = {
    Name = "se-alex-terraform-instance"
  }
}