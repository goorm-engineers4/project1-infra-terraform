# Bastion (Public)
resource "aws_instance" "bastion" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = var.public_subnet_id
  key_name = var.key_name
  vpc_security_group_ids = [var.bastion_sg_id]
  associate_public_ip_address = true
  tags = { Name = "goorm-first-infra-bastion-host" }
}

# App Server (Private)
resource "aws_instance" "app" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = var.private_subnet_id
  key_name = var.key_name
  vpc_security_group_ids = [var.app_sg_id]
  associate_public_ip_address = false
  tags = { Name = "goorm-first-infra-app-server" }
}
