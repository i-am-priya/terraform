variable "instance_amis" {
  type = string
  default = "ami-0ecb62995f68bb549"
}

variable "instance_type" {
  type = string
  default = "t3.micro"  
}

variable "availibility_zones" {
  type = string
  default = "us-east-1a"
}

variable "vpc_cidr" {
  type = string
  default = "172.168.0.0/16"
}

variable "subnet_cidr" {
  type = string
  default = "172.168.0.0/22"
}

variable "subnet_az" {
  type = string
  default = "us-east-1a"
}

variable "security_group_name" {
  type = string
  default = "allow-ssh"
}