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