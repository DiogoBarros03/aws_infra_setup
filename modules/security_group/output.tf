output "security_group_id" {
  value = length(aws_security_group.allow_port) > 0 ? aws_security_group.allow_port[0].id : ""
}

output "security_group_name" {
  value = length(aws_security_group.allow_port) > 0 ? aws_security_group.allow_port[0].name : ""
}

output "security_group_vpc_id" {
  value = length(aws_security_group.allow_port) > 0 ? aws_security_group.allow_port[0].vpc_id : ""
}

output "security_group_arn" {
  value = length(aws_security_group.allow_port) > 0 ? aws_security_group.allow_port[0].arn : ""
}

output "board_game_sg_id" {
  value = length(aws_security_group.board_game_sg) > 0 ? aws_security_group.board_game_sg[0].id : ""
}