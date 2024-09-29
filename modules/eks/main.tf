data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_group" "custom_sg" {
  id = "sg-028f8637d0284fad8"
}

data "aws_iam_role" "iam_eks_role" {
  name = "eks-cluster-role"
}

resource "aws_eks_cluster" "app_eks_cluster" {
  name     = "cloud-native-cluster"
  role_arn = data.aws_iam_role.iam_eks_role.arn

  vpc_config {
    subnet_ids         = data.aws_subnets.default_subnets.ids
    security_group_ids = [data.aws_security_group.custom_sg.id]
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.app_eks_cluster.name
  node_group_name = "nodes-groups"
  node_role_arn   = var.worker_role_arn 

  subnet_ids = data.aws_subnets.default_subnets.ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t2.micro"]
}
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "vpc-cni"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  configuration_values = jsonencode({
    env = {
      ENABLE_PREFIX_DELEGATION = "false" 
      WARM_PREFIX_TARGET       = "0"     
    }
  })
}


resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "coredns"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "kube-proxy"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
}