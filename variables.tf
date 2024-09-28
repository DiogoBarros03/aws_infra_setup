variable "aws_region" {
  description = "Region aws"
  type        = string
  default     = "eu-west-1"
}

variable "allowed_port" {
  description = "Allowed port for inbound traffic for my application"
  type        = number
  default     = 5001
}