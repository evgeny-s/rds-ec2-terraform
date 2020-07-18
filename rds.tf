data "external" "rds" {
  program  = [ "cat", "./secrets/rds.json"]
}

resource "aws_vpc" "vpc_0" {
  cidr_block = "172.127.0.0/16"
  enable_dns_hostnames = false
  enable_dns_support = false
}

resource "aws_subnet" "subnet_0" {
  cidr_block = "172.127.3.0/24"
  vpc_id = "${aws_vpc.vpc_0.id}"
}

resource "aws_db_subnet_group" "dbsubnet" {
  name       = "main-subnet-group"
  subnet_ids = ["${aws_subnet.subnet-uno.id}", "${aws_subnet.subnet-two.id}"]
}

resource "aws_db_instance" "rds_0" {
  identifier = "aws-db-instance-rds-0"
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  name                 = "initialdb"
  username             = "initialuser"
  port                 = 5432
  password             = "${data.external.rds.result.master_password}"
  skip_final_snapshot = true
  multi_az = false
  vpc_security_group_ids = ["${aws_security_group.ingress-all-dev.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.dbsubnet.id}"
}
