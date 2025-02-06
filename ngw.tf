resource "aws_eip" "compass_eip" {
  associate_with_private_ip = true

  tags = {
    Name = "compass_eip"
  }
}

resource "aws_eip" "compass_eip_b" {
  associate_with_private_ip = true

  tags = {
    Name = "compass_eip_b"
  }
}

resource "aws_nat_gateway" "compass_nat_a" {
  allocation_id = aws_eip.compass_eip.id
  subnet_id     = aws_subnet.publica-elb-A.id

  tags = {
    Name = "compass_nat_a"
  }
}


resource "aws_nat_gateway" "compass_nat_b" {
  allocation_id = aws_eip.compass_eip_b.id
  subnet_id     = aws_subnet.publica-elb-B.id

  tags = {
    Name = "compass_nat_b"
  }
}

resource "aws_route_table" "rota-privada-A" {
  vpc_id = aws_vpc.compass_vpc.id

  route {
    nat_gateway_id = aws_nat_gateway.compass_nat_a.id
    cidr_block     = "0.0.0.0/0"
  }
  tags = {
    Name = "rota-privada-A"
  }
}

resource "aws_route_table" "rota-privada-B" {
  vpc_id = aws_vpc.compass_vpc.id

  route {
    nat_gateway_id = aws_nat_gateway.compass_nat_b.id
    cidr_block     = "0.0.0.0/0"
  }
  tags = {
    Name = "rota-privada-B"
  }
}