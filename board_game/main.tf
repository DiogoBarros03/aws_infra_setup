terraform {
  backend "s3" {
    bucket = "050451375189-terraform-state-bucket"
    key    = "board_game/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "key_pair"{
  source = "../modules/key"
}

# module "security_group" {
#   source = "../modules/security_groups"

#   create_cloud_native_monitoring_sg = false
#   create_board_game_sg              = true

#   allowed_ports_board_game = [
#     {
#       from_port   = 25
#       to_port     = 25
#       description = "SMTP"
#     },
#     {
#       from_port   = 3000
#       to_port     = 10000
#       description = "Custom TCP"
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       description = "HTTP"
#     },
#     {
#       from_port   = 443
#       to_port     = 443
#       description = "HTTPS"
#     },
#     {
#       from_port   = 22
#       to_port     = 22
#       description = "SSH"
#     },
#     {
#       from_port   = 6443
#       to_port     = 6443
#       description = "Custom TCP (Kubernetes API)"
#     },
#     {
#       from_port   = 465
#       to_port     = 465
#       description = "SMTPS"
#     },
#     {
#       from_port   = 30000
#       to_port     = 32767
#       description = "Custom TCP"
#     }
#   ]
# }

