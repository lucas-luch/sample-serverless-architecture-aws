aws_region = "us-east-1"

vpc_name = "first-vpc"
vpc_cidr = "10.0.0.0/20"

subnets = {
  "app-subnet-1" = {
    cidr = "10.0.1.0/24"
    az   = "us-east-1a"
  }
  "app-subnet-2" = {
    cidr = "10.0.2.0/24"
    az   = "us-east-1b"
  }
  "database-subnet-1" = {
    cidr = "10.0.3.0/24"
    az   = "us-east-1a"
  }
  "database-subnet-2" = {
    cidr = "10.0.4.0/24"
    az   = "us-east-1b"
  }
}
