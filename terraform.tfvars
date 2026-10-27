aws_region = "us-east-1"

vpc_name = "main-vpc"
vpc_cidr = "10.1.0.0/20"

subnets = {
  "app-subnet-1" = {
    cidr = "10.1.1.0/24"
    az   = "us-east-1a"
  }
  "app-subnet-2" = {
    cidr = "10.1.2.0/24"
    az   = "us-east-1b"
  }
  "database-subnet-1" = {
    cidr = "10.1.3.0/24"
    az   = "us-east-1a"
  }
  "database-subnet-2" = {
    cidr = "10.1.4.0/24"
    az   = "us-east-1b"
  }
}
