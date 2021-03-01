data "aws_subnet_ids" "subnets" {
  vpc_id = aws_vpc.main.id
  depends_on = [aws_subnet.public_a]
}

data "aws_subnet" "subnet_values" {
  
  id       = aws_subnet.public_a.id
  depends_on = [aws_subnet.public_a]
}

resource "aws_launch_configuration" "launch-configuration" {
  name          = var.launch_configuration_name
  image_id      = var.ami
  instance_type = var.instance_type

}

resource "aws_autoscaling_group" "autoscalling_group_config" {
  name                      = var.auto_scalling_group_name
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.public_a.id]
  launch_configuration      = aws_launch_configuration.launch-configuration.name
  lifecycle {
    create_before_destroy = true
  }

}

