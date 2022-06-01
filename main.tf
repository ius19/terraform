resource "aws_instance" "vm2" {
  ami             = var.ami
  instance_type   = "t2.micro"
  key_name        = var.key_name
  security_groups = [aws_security_group.vm2_SG.id]
  subnet_id       = aws_subnet.vm2_subnet.id

  tags = {
    Name = var.instance_name
  }
}