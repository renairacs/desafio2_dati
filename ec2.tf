resource "aws_instance" "linux" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "admuser"
  tags = {
    "Name" = "web01"
  }
  subnet_id = aws_subnet.public_a.id
}

