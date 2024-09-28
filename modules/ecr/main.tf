resource "aws_ecr_repository" "my-cloud-app" {
  name                 = "my-cloud-native-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}