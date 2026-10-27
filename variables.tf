variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
}

variable "subnets" {
  description = "Mapa de subnets a serem criadas. Cada chave vira o nome da subnet."
  type = map(object({
    cidr = string
    az   = string
  }))
}
