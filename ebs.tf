resource "aws_ebs_volume" "vol" {
  availability_zone = var.availibility_zones
  size = 10
  type = "gp3"
  tags = {
    Name = "ebs-vol1"
  }
}

resource "aws_volume_attachment" "attach" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.vol.id
  instance_id = aws_instance.this.id
  force_detach = true
}