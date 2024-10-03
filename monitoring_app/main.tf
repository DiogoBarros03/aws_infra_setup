terraform {
  backend "s3" {
    bucket = "050451375189-terraform-state-bucket"
    key    = "aws-infra/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "iam_user_and_role" {
  source = "../modules/iam_user_and_role"
}

module "security_group"{
  source = "../modules/security_group"
  create_cloud_native_monitoring_sg = true
  create_board_game_sg              = false

}

module "ecr"{
  source = "../modules/ecr"
}

module "eks"{
  source = "../modules/eks"
  worker_role_arn = module.iam_user_and_role.eks_worker_role_arn 
}

