#resource block
resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.my_instance_type
  user_data = data.template_cloudinit_config.user-data.rendered
  key_name = var.my_key

  vpc_security_group_ids = [aws_security_group.duc_sg.id]
  subnet_id              = aws_subnet.duc_subnets[0].id

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
  subnet_id              = aws_subnet.duc_subnets[0].id

  tags = {
    "Name" = "My-Linux-${count.index}"
    "Type" = "My-Linux-${count.index}"
  }
}

