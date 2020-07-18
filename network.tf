resource "aws_vpc" "dev-env" {
  cidr_block = "172.127.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_eip" "ip-dev-env" {
  instance = "${aws_instance.ec2_0.id}"
  vpc      = true
}
