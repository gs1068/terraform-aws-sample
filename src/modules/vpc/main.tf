#VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  # AWSのハードウェアを占有して使用したいかどうか
  # defaultだと他のユーザーと共有するハードウェア上で起動する
  instance_tenancy     = "default"
  # パブリック IP アドレスを持つインスタンスが、対応するパブリック DNS ホスト名を取得するかどうか
  enable_dns_hostnames = true
  # DNS 解決をサポートするかどうか。
  enable_dns_support   = true
  # VPCの名前
  tags = {
    Name = "${var.vpc_name}"
  }
}

#IGW
resource "aws_internet_gateway" "main" {
  vpc_id   = aws_vpc.main.id
  tags = {
    Name = "joicon-internet-gateway-${var.ENV}"
  }
}

# パブリックサブネット
resource "aws_subnet" "public_a" {
  availability_zone = "${var.region}a"
  cidr_block        = "${var.subnet_public_a}"
  vpc_id   = aws_vpc.main.id
  # trueにするとインスタンスにパブリックIPアドレスを自動的に割り当ててくれる
  map_public_ip_on_launch = true
  tags = {
    Name = "public_a_${var.ENV}"
  }
}

resource "aws_subnet" "public_c" {
  availability_zone = "${var.region}c"
  cidr_block        = "${var.subnet_public_c}"
  vpc_id   = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name = "public_c_${var.ENV}"
  }
}

resource "aws_subnet" "public_d" {
  availability_zone = "${var.region}d"
  cidr_block        = "${var.subnet_public_d}"
  vpc_id   = aws_vpc.main.id
  map_public_ip_on_launch = true

  tags = {
    Name = "public_d_${var.ENV}"
  }
}


# プライベートサブネット
resource "aws_subnet" "private_a" {
  availability_zone = "${var.region}a"
  cidr_block        = "${var.subnet_private_a}"
  vpc_id   = aws_vpc.main.id

  tags = {
    Name = "private_a_${var.ENV}"
  }
}

resource "aws_subnet" "private_c" {
  availability_zone = "${var.region}c"
  cidr_block        = "${var.subnet_private_c}"
  vpc_id   = aws_vpc.main.id

  tags = {
    Name = "private_c_${var.ENV}"
  }
}

resource "aws_subnet" "private_d" {
  availability_zone = "${var.region}d"
  cidr_block        = "${var.subnet_private_d}"
  vpc_id   = aws_vpc.main.id

  tags = {
    Name = "private_d_${var.ENV}"
  }
}

# route table
resource "aws_route_table" "public-route" {
  vpc_id   = aws_vpc.main.id
  tags = {
    Name = "public-route-table-${var.ENV}"
  }
}

resource "aws_route" "all_allow" {
  gateway_id             = "${aws_internet_gateway.main.id}"
  route_table_id         = aws_route_table.public-route.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_a" {
    subnet_id = "${aws_subnet.public_a.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_route_table_association" "public_c" {
    subnet_id = "${aws_subnet.public_c.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}

resource "aws_route_table_association" "public_d" {
    subnet_id = "${aws_subnet.public_d.id}"
    route_table_id = "${aws_route_table.public-route.id}"
}