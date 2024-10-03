variable "allowed_ports_cloud_native_monitoring" {
  description = "Allowed port for inbound traffic for my monitoring application"
  type        = number
  default     = 5001
}

variable "allowed_ports_board_game" {
  type    = list(object({
    from_port   = number
    to_port     = number
    description = string
  }))
  default = []
}

variable "create_cloud_native_monitoring_sg" {
  type    = bool
  default = true
}

variable "create_board_game_sg" {
  type    = bool
  default = false
}
