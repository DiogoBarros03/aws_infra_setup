# Terraform AWS Infrastructure Setup

This repository contains the Terraform configuration for provisioning AWS resources such as EKS (Elastic Kubernetes Service), IAM roles, Security Groups, and VPCs.

## Overview

- **EKS Cluster**: Sets up an AWS Elastic Kubernetes Service (EKS) cluster.
- **IAM Roles**: Defines the necessary IAM roles and policies for the cluster and worker nodes.
- **VPC and Security Groups**: Configures networking, including VPC and security groups for the cluster.

## Directory Structure

- **/.github/workflows**: Contains the CI/CD pipeline for infrastructure provisioning.
- **/modules/ecr**: Contains Terraform configurations for managing AWS ECR (Elastic Container Registry).
- **/modules/eks**: Terraform configuration for provisioning the EKS cluster.
- **/modules/iam_user_and_role**: IAM user and role setup for the EKS cluster.
- **/modules/security_group**: Contains the configuration for VPC and security group setup.
- **/main.tf**: The main entry file for Terraform provisioning.
- **/provider.tf**: Contains provider definitions (AWS).
- **/variables.tf**: Variables file to handle dynamic inputs.

## Related Repository

This project works alongside the Kubernetes repository where the Python application is deployed using the infrastructure provisioned here.

See the related repository: [AWS Cloud Native App](<https://github.com/DiogoBarros03/cloud-native-monotoring-app>)

## How to Use

1. Initialize the Terraform project.
2. Apply the configuration to provision AWS resources.
3. Ensure you have valid AWS credentials.

For detailed instructions, refer to the Terraform documentation.

## References

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS EKS Documentation](https://docs.aws.amazon.com/eks)