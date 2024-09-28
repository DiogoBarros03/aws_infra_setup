module "iam_user_and_role" {
  source = "./modules/iam_user_and_role"
}

module "security_group"{
  source = "./modules/security_group"
}

module "ecr"{
  source = "./modules/ecr"
}