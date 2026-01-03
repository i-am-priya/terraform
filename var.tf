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