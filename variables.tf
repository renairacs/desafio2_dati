variable "ami" {
  default = "ami-09c5e030f74651050"

}

variable "region" {
  default     = "us-west-2"
  description = "main region"

}

variable "cidr_block" {
  default = "192.168.0.0/16"

}

variable "launch_configuration_name" {
  type    = string
  default = "launch_configuration_name"
}

variable "instance_type" {
  default = "t2.micro"

}

variable "security_group" {
  default = "sg_loud"

}

variable "auto_scalling_group_name" {
  default = "auto_scalling_group_lb"

}

variable "autoscalling_group_elb_name" {
  default = "autoscallinggroupelb"

}