locals {
  tags = {
    Name = "VPC_auto_scalling"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = local.tags
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Public 1a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Public 1b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private 1a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "192.168.4.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Private 1b"
  }
}

resource "aws_route_table" "rp" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"                #onde tá vindo
    gateway_id = aws_internet_gateway.gw.id #para onde vai
  }

  tags = {
    Name = "main"
  }
}