output "endpoint" {
  value = aws_eks_cluster.app_eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = length(aws_eks_cluster.app_eks_cluster.certificate_authority) > 0 ? aws_eks_cluster.app_eks_cluster.certificate_authority[0].data : ""
}