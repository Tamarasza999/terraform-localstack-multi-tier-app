variable "env" { default = "dev" }
variable "cidr_block" { default = "10.0.0.0/16" }
variable "public_subnets" { default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "private_subnets" { default = ["10.0.101.0/24", "10.0.102.0/24"] }
variable "azs" { default = ["us-east-1a", "us-east-1b"] }
variable "instance_type" { default = "t3.micro" }
