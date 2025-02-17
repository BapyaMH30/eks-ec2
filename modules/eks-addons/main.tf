################################################################################
# EKS Addons
################################################################################

module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "1.19.0"

  cluster_name      = var.eks_cluster_name
  cluster_endpoint  = var.eks_cluster_endpoint
  cluster_version   = var.eks_cluster_version
  oidc_provider_arn = var.eks_oidc_provider_arn

  enable_aws_efs_csi_driver                    = var.enable_aws_efs_csi_driver
  enable_aws_cloudwatch_metrics                = var.enable_aws_cloudwatch_metrics
  enable_cluster_autoscaler                    = var.enable_cluster_autoscaler
  enable_secrets_store_csi_driver              = var.enable_secrets_store_csi_driver
  enable_secrets_store_csi_driver_provider_aws = var.enable_secrets_store_csi_driver_provider_aws

  enable_external_dns = var.enable_external_dns
  external_dns_route53_zone_arns = [
    "arn:aws:route53:::hostedzone/*",
  ]

  enable_external_secrets = var.enable_external_secrets
  enable_ingress_nginx    = var.enable_nginx_ingress_controller

  # Wait for all Cert-manager related resources to be ready
  enable_cert_manager = var.enable_cert_manager
  cert_manager = {
    wait = true
  }

  # Turn off mutation webhook for services to avoid ordering issue
  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller
  aws_load_balancer_controller = {
    set = [
      {
        name  = "enableServiceMutatorWebhook"
        value = "false"
      },
      {
        name  = "serviceMonitor.enabled"
        value = "true"
      }
    ]
  }

  enable_metrics_server    = var.enable_metrics_server
  enable_vpa               = var.enable_vpa
  tags = var.tags
}

# resource "random_password" "grafana_password" {
#   count  = var.enable_kube_prometheus_stack ? 1 : 0 
#   length  = 20
#   special = false
# }
