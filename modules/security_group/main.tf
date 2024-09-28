data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "allow_port" {
  name        = "allow-specified-port"
  description = "Security group to allow traffic on a specified port"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow inbound traffic on the specified port"
    from_port   = var.allowed_port
    to_port     = var.allowed_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-specified-port-sg"
  }
}
