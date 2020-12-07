variable "ec2_availability_zone" {
  description = "Zone w ktorym dostepne sa instancje"
  default     = "us-east-1a"
}

variable "elb_availability_zones" {
  description = "Zone'y w ktorym dostepny jest ELB. Jedna z nich musi pokrywac sie z instancja"
  default     = ["us-east-1a"]
}

variable "aws_key_name" {
  description = "panda-nowe-klucze"
}

variable "ssh_key_path" {
  description = "../panda-nowe-klucze.pem"
}
