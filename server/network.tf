resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}

resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "bastion_sg"
}

resource "aws_security_group_rule" "bastion_sg_ingress" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}
