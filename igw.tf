resource "aws_internet_gateway" "compass_igw" {
  vpc_id = aws_vpc.compass_vpc.id

  tags = {
    Name = "compass_igw"
  }
}

resource "aws_route_table" "rota-publica" {
  vpc_id = aws_vpc.compass_vpc.id

  route {
    gateway_id = aws_internet_gateway.compass_igw.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "rota-publica"
  }
}