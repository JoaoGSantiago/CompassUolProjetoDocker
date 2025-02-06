resource "aws_subnet" "privada-app-A" {
  vpc_id                  = aws_vpc.compass_vpc.id
  cidr_block              = var.cidr_block_privada-app-A
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "privada-app-A"
  }
}

resource "aws_subnet" "privada-app-B" {
  vpc_id                  = aws_vpc.compass_vpc.id
  cidr_block              = var.cidr_block_privada-app-B
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "privada-app-B"
  }
}

resource "aws_route_table_association" "assoc-privada-app-A" {
  subnet_id      = aws_subnet.privada-app-A.id
  route_table_id = aws_route_table.rota-privada-A.id
}

resource "aws_route_table_association" "assoc-privada-app-B" {
  subnet_id      = aws_subnet.privada-app-B.id
  route_table_id = aws_route_table.rota-privada-B.id
}