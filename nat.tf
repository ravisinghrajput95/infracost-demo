resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "demo_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.demo_subnet.id

  tags = {
    Environment = var.environment
  }
}
