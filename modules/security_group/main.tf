data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "allow_port" {
  name        = "cloud_native_monitoring_app"
  count       = var.create_cloud_native_monitoring_sg ? 1 : 0
  description = "Security group to allow traffic on a specified port"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow inbound traffic on the specified port"
    from_port   = var.allowed_ports_cloud_native_monitoring
    to_port     = var.allowed_ports_cloud_native_monitoring
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
    Name = "sg-cloud_native_monitoring_app"
  }
}

resource "aws_security_group" "board_game_sg" {
  count       = var.create_board_game_sg ? 1 : 0
  name        = "board_game"
  description = "Security group for board-game"
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.allowed_ports_board_game
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_board_game"
  }
}
