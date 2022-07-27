resource "aws_instance" "bastion" {
  ami = "ubuntu-img"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "bastion"
  }
}
