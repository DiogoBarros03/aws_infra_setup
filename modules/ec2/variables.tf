variable "instances_count"{
  type        = number
  default     = 6
}

variable "ami_id"{
  type = string 
  default = "ami-0d64bb532e0502c46"
}

variable "board_game_sg_id" {
  description = "Security group ID associated to EC2 instances board_game"
  type        = string
}