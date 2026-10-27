resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# ─── Subnets ─────────────────────────────────────────────────────────────────

resource "aws_subnet" "this" {
  for_each = var.subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  map_public_ip_on_launch = false

  tags = {
    Name = each.key
  }
}

# ─── Route Table ─────────────────────────────────────────────────────────────

resource "aws_route_table" "app" {
  vpc_id = aws_vpc.main.id

  # A rota local é criada automaticamente pela AWS.
  # A rota do DynamoDB é injetada pelo aws_vpc_endpoint (Gateway).

  tags = {
    Name = "app-route-table"
  }
}

# ─── Associações das Subnets à Route Table ───────────────────────────────────

resource "aws_route_table_association" "this" {
  for_each = var.subnets

  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.app.id
}
