data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

data "template_cloudinit_config" "user-data" {
  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/ansible-install-ubuntu.sh")
  }
  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/vscode-install.sh")
  }
}
