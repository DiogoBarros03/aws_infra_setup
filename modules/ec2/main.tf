
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_key_pair" "existing_key" {
  key_name = "my_ec2_key_pair"
}

data "aws_security_group" "board_game_sg" {
  filter {
    name   = "group-name"
    values = ["board_game"]
  }
}
resource "aws_instance" "instances_board_game" {
  count = var.instances_count

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.existing_key.key_name

  root_block_device {
    volume_size = 25        
    volume_type = "gp2"      
    delete_on_termination = true 
  }

  tags = {
    Name = "${count.index == 0 ? "Master" : "Worker"}_${count.index + 1}"
  }
}
