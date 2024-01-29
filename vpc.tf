resource "aws_vpc" "duc_vpc" {
  cidr_block = var.cidr

  tags = {
    "Name" = "duc_vpc"
  }
}

resource "aws_internet_gateway" "duc_vpc_igw" {
  vpc_id = aws_vpc.duc_vpc.id
  tags = {
    Name = "duc_vpc_igw"
  }
}

resource "aws_subnet" "duc_subnets" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.duc_vpc.id
  cidr_block              = element(var.subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "duc_subnets_${count.index + 1}"
  }
}

resource "aws_route_table" "duc_public_rt" {
  vpc_id                  = aws_vpc.duc_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.duc_vpc_igw.id
  }
  
  tags = {
    Name = "duc_vpc_public_rt"
  }
}

resource "aws_route_table_association" "rt_sub_association" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.duc_subnets.*.id, count.index)
  route_table_id = aws_route_table.duc_public_rt.id
}
    