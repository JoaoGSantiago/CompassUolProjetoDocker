resource "aws_subnet" "publica-elb-A" {
  vpc_id                  = aws_vpc.compass_vpc.id
  cidr_block              = var.cidr_block_publica-elb-A
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "publica-elb-A"
  }
}

resource "aws_subnet" "publica-elb-B" {
  vpc_id                  = aws_vpc.compass_vpc.id
  cidr_block              = var.cidr_block_publica-elb-B
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "publica-elb-B"
  }
}

resource "aws_route_table_association" "assoc-publica-elb-A" {
  subnet_id      = aws_subnet.publica-elb-A.id
  route_table_id = aws_route_table.rota-publica.id
}

resource "aws_route_table_association" "assoc-publica-elb-B" {
  subnet_id      = aws_subnet.publica-elb-B.id
  route_table_id = aws_route_table.rota-publica.id
}