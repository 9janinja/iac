#resource block
resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.my_instance_type
  #user_data     = file("${path.module}/ansible-install-ubuntu.sh")
  user_data = data.template_cloudinit_config.user-data.rendered
  key_name = var.my_key

  vpc_security_group_ids = [aws_security_group.duc_sg.id]

  tags = {
    "Name" = "Ansible-Ubuntu"
  }
}

resource "aws_instance" "hosts" {
  ami           = data.aws_ami.amzLinux2.id
  instance_type = var.my_instance_type
  user_data     = file("${path.module}/create_ansible_user.sh")
  key_name      = var.my_key
  count         = 1

  vpc_security_group_ids = [aws_security_group.duc_sg.id]

  tags = {
    "Name" = "My-Linux-${count.index}"
    "Type" = "My-Linux-${count.index}"
  }
}
resource "aws_vpc" "duc_vpc" {
  cidr_block = var.cidr

  tags = {
    "Name" = "duc_vpc"
  }
}

resource "aws_security_group" "duc_sg" {
  name        = "duc-sg"
  description = "Allow incoming connections."

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # application
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
