resource "aws_instance" "this" {
    ami = var.instance_amis
    instance_type = var.instance_type
    availability_zone = var.availibility_zones
    key_name = "NV-pranshu"
    tags = {
      Name = "second-srvr"
    }
}