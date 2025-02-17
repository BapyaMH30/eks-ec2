# Define the EKS cluster name
variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

# Define the EKS cluster endpoint
variable "eks_cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster"
  type        = string
}

# Define the EKS cluster version
variable "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  type        = string
}

# Define the OIDC provider ARN for the EKS cluster
variable "eks_oidc_provider_arn" {
  description = "The ARN of the OIDC provider for the EKS cluster"
  type        = string
}

# Enable Cluster Autoscaler
variable "enable_cluster_autoscaler" {
  description = "Enable Cluster Autoscaler"
  type        = bool
  default     = false
}

# Enable External Secrets
variable "enable_external_secrets" {
  description = "Enable External Secrets"
  type        = bool
  default     = false
}

# Enable Cert Manager
variable "enable_cert_manager" {
  description = "Enable Cert Manager"
  type        = bool
  default     = false
}

# Enable AWS Load Balancer Controller
variable "enable_aws_load_balancer_controller" {
  description = "Enable AWS Load Balancer Controller"
  type        = bool
  default     = false
}

# Enable AWS Load Balancer Controller
variable "enable_nginx_ingress_controller" {
  description = "Enable Nginx Ingress Controller"
  type        = bool
  default     = false
}


# Enable Metrics Server
variable "enable_metrics_server" {
  description = "Enable Metrics Server"
  type        = bool
  default     = false
}

# Enable Secrets Store CSI Driver
variable "enable_secrets_store_csi_driver" {
  description = "Enable Secrets Store CSI Driver"
  type        = bool
  default     = true
}

# Enable Secrets Store CSI Driver Provider AWS
variable "enable_secrets_store_csi_driver_provider_aws" {
  description = "Enable Secrets Store CSI Driver Provider for AWS"
  type        = bool
  default     = true
}

# Enable AWS CloudWatch Metrics
variable "enable_aws_cloudwatch_metrics" {
  description = "Enable AWS CloudWatch Metrics"
  type        = bool
  default     = false
}

# Tags for the resources
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# Enable External DNS
variable "enable_external_dns" {
  description = "Flag to enable External DNS"
  type        = bool
  default     = false
}

# Enable AWS EFS CSI Driver
variable "enable_aws_efs_csi_driver" {
  description = "Flag to enable AWS EFS CSI Driver"
  type        = bool
  default     = false
}

# Enable Vertical Pod Autoscaler (VPA)
variable "enable_vpa" {
  description = "Flag to enable Vertical Pod Autoscaler (VPA)"
  type        = bool
  default     = false
}

# Enable Ingress NGINX
variable "enable_ingress_nginx" {
  description = "Enable Ingress NGINX"
  type        = bool
  default     = false
}