resource "aws_subnet" "subnet-uno" {
  cidr_block = "172.127.3.0/24"
  vpc_id = "${aws_vpc.dev-env.id}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet-two" {
  cidr_block = "172.127.16.0/24"
  vpc_id = "${aws_vpc.dev-env.id}"
  availability_zone = "us-west-2b"
}

resource "aws_route_table" "route-table-dev-env" {
  vpc_id = "${aws_vpc.dev-env.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.dev-env-gw.id}"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-two.id}"
  route_table_id = "${aws_route_table.route-table-dev-env.id}"
}
