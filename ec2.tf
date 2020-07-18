resource "aws_instance" "ec2_0" {
  ami = "ami-003634241a8fcdec0"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.ingress-all-dev.id}"]
  subnet_id = "${aws_subnet.subnet-two.id}"
  key_name = "${var.ami_key_pair_name}"
}
