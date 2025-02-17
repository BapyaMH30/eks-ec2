output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = module.eks.cluster_arn
}

output "cluster_version" {
  description = "EKS cluster version."
  value       = module.eks.cluster_version
}

output "eks_oidc_provider_arn" {
  description = "EKS oidc provider ARN."
  value       = module.eks.oidc_provider_arn
}


output "cluster_certificate_authority_data" {
  description = "Cluster CA certificate."
  value       = module.eks.cluster_certificate_authority_data
}

output "node_security_group_id" {
  description = "ID of the node security group"
  value       = module.eks.node_security_group_id # Correct reference to the module's output
}