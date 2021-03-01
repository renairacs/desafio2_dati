data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_elb" "autoscalling_group_elb" {
  name            = var.autoscalling_group_elb_name
  security_groups = ["${aws_security_group.allow_tls.id}"]
  #availability_zones = data.aws_availability_zones.available.names
  subnets = [aws_subnet.public_a.id]
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:8080/ignite?cmd=version"
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "8080"
    instance_protocol = "http"
  }
}



