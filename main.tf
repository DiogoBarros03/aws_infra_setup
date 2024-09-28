terraform {
  backend "s3" {
    bucket = "050451375189-state-bucket"
    key    = "aws-infra/terraform.tfstate"
    region = "us-west-1"
  }
}

module "iam_user_and_role" {
  source = "./modules/iam_user_and_role"
}

module "security_group"{
  source = "./modules/security_group"
}

module "ecr"{
  source = "./modules/ecr"
}

