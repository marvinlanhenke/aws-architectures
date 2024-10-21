variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing key pair to use for SSH access"
  default     = "EC2KeyPair"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2 instances"
  type        = string
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed to access HTTP"
  default     = "0.0.0.0/0"
}
