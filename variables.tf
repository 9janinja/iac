variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "my_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "my_key" {
  type    = string
  default = "auto"
}

#Specify your pc's OS
variable "os" {
  type    = string
  default = "windows"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnets_cidr" {
  type    = list(string)
  default = ["10.0.0.0/25", "10.0.0.128/25"]
}
variable "availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}
# variable "kubernetes_ami" {
#   default = "ami-02efe31f21526284a"
# }

# variable "medium_instance_type" {
#   default = "t2.medium"
# }

# variable "micro_instance_type" {
#   default = "t2.micro"
# }

# variable "private_key_path" {
#   default = "Automationkey.pem"
# }
# variable "server_ami" {
#   default = "ami-086d8b62958af8558"
# }
