resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  # Ingress: permite HTTP (porta 80) a partir das subnets de aplicação
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = [for k, v in var.subnets : v.cidr if startswith(k, "app-")]
  }

  # Egress: permite todo tráfego de saída
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default"
  }
}
