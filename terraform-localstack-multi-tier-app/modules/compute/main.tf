resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[0]
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "${var.env}-web-server"
    Environment = var.env
  }
}

resource "aws_instance" "app" {
  ami           = "ami-12345678"
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[1 % length(var.subnet_ids)]
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "${var.env}-app-server"
    Environment = var.env
  }
}
