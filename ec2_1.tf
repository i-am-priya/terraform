resource "aws_instance" "this" {
    ami = var.instance_amis
    instance_type = var.instance_type
    availability_zone = var.availibility_zones
    subnet_id = aws_subnet.subnet.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = "NV-pranshu"
    tags = {
      Name = "second-srvr"
    }
}