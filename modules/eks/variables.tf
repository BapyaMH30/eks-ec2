variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  type        = string
}


variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be created."
  type        = string
}

variable "private_subnets" {
  description = "A list of subnet IDs for the private subnets where the EKS worker nodes will run."
  type        = list(string)
}

variable "eks_managed_node_groups" {
  description = "A map of EKS managed node group configurations."
  type = map(object({
    ami_type       = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
    labels         = optional(map(string), {})
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to apply to the EKS resources."
  type        = map(string)
  default     = {}
}

variable "cluster_endpoint_public_access" {
  description = "Enable or disable public access to the EKS cluster endpoint."
  type        = bool
  default     = false
}

variable "cluster_endpoint_private_access" {
  description = "Enable or disable private access to the EKS cluster endpoint."
  type        = bool
  default     = true
}


variable "access_entries_users_arns" {
  description = "List of access entries users arn to add to the cluster"
  type        = any
  default     = []
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Indicates whether or not to add the cluster creator (the identity used by Terraform) as an administrator via access entry"
  type        = bool
  default     = false
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "List of CIDR blocks to be allowed to connect cluster"
}