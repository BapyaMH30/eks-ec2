#######
# EKS 
#######
module "eks" {
  source          = "../modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id          = var.vpc_id
  private_subnets = var.eks_private_subnet_ids

  eks_managed_node_groups         = var.eks_managed_node_groups
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  access_entries_users_arns       = var.access_entries_users_arns

  tags = {
    project     = "terraform"
    environment = var.environment
    org         = var.org_name
  }

}

data "aws_vpc" "selected" {
  id = var.vpc_id
}

module "node-sg-group" {
  source = "../modules/security-group"

  vpc_id                     = var.vpc_id
  security_group_name        = var.eks_security_group_name
  security_group_description = var.eks_security_group_description
  ingress_cidr_blocks = [{
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    description = "Allow all access"
    cidr_blocks = data.aws_vpc.selected.cidr_block
    }]

  egress_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = "0.0.0.0/0"
  }]
  depends_on = [module.eks]
}

#######
# EKS Addons
#######

resource "null_resource" "eks_addon_wait" {
  provisioner "local-exec" {
    command = "echo 'Sleeping for 15 minutes...' && sleep 900"
  }
}

module "eks_addons" {
  source = "../modules/eks-addons"
  depends_on = [null_resource.eks_addon_wait]

  eks_cluster_name      = module.eks.cluster_name
  eks_cluster_endpoint  = module.eks.cluster_endpoint
  eks_cluster_version   = module.eks.cluster_version
  eks_oidc_provider_arn = module.eks.eks_oidc_provider_arn

  enable_aws_efs_csi_driver = var.enable_aws_efs_csi_driver
  enable_aws_cloudwatch_metrics                = var.enable_aws_cloudwatch_metrics
  enable_cluster_autoscaler                    = var.enable_cluster_autoscaler
  enable_secrets_store_csi_driver              = var.enable_secrets_store_csi_driver
  enable_secrets_store_csi_driver_provider_aws = var.enable_secrets_store_csi_driver_provider_aws

  enable_external_dns     = var.enable_external_dns
  enable_external_secrets = var.enable_external_secrets
  enable_ingress_nginx    = var.enable_ingress_nginx

  enable_cert_manager = var.enable_cert_manager

  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller
  enable_metrics_server               = var.enable_metrics_server

  tags = {
    environment = var.environment
  }
}