data "aws_vpc" "default-vpc"{
    default=true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = data.aws_vpc.default-vpc.tags["Name"]
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
  role_arn = aws_iam_role.iam_eks_role.arn

  
  vpc_config {
    subnet_ids         = data.aws_subnet_ids.default_subnets.ids
    security_group_ids = [data.aws_security_group.custom_sg.id]
  } 

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "vpc-cni"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "coredns"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.app_eks_cluster.name
  addon_name   = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
}