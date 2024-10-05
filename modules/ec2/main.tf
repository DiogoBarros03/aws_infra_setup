data "aws_key_pair" "existing_key" {
  key_name = "my_ec2_key_pair"
}

resource "aws_instance" "instances_board_game" {
  count = var.instances_count

  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.existing_key.key_name

  vpc_security_group_ids = [var.board_game_sg_id]

  root_block_device {
    volume_size           = count.index == 5 ? 30 : 25
    volume_type           = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = "${count.index == 0 ? "Master" : count.index == 1 || count.index == 2 ? "Worker_${count.index}" : count.index == 3 ? "SonarQube" : count.index == 4 ? "Nexus" : count.index == 5 ? "Jenkins" : "Unknown"}"
  }
}

