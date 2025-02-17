variable "aws_region" {
  type    = string
  default = "us-west-2"
}

#########
# Bastion EC2
#########

variable "runner_instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "runner_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "private_subnet_id" {
  type        = string
  default = ""
}

variable "create_ebs_volume" {
  description = "whether to create extra ebs volume or not"
  type        = bool
  default     = false
}

variable "runner_ebs_volume_size" {
  description = "The EBS size attached to Runner EC2"
  type        = number
}

variable "ec2_server_role_name" {
  description = "The name of the IAM role"
  type        = string
  default     = "runner-role"
}

variable "ec2_iam_policy" {
  description = "pass the list of IAM policies to be attached to ec2 runner"
  type        = map(any)
  default = {
    AmazonSSMManagedInstanceCore       = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    SecretsManagerReadWrite            = "arn:aws:iam::aws:policy/SecretsManagerReadWrite",
    AmazonS3FullAccess                 = "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    AmazonEC2ContainerRegistryReadOnly = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    AmazonEKSClusterPolicy             = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    AmazonRDSFullAccess                = "arn:aws:iam::aws:policy/AmazonRDSFullAccess",
    AmazonEC2FullAccess                = "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    AmazonElasticFileSystemFullAccess  = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
  }
}

variable "keypair_name" {
  description = "The name of the EC2 key pair to be used"
  type        = string
  default     = "test-keypair"
}

# Variable for the SSM Parameter path
variable "ssm_parameter_path" {
  description = "The path of the SSM parameter"
  type        = string
  default     = "/path/to/parameter"
}

variable "environment" {
  description = "The tag value for environment"
  type        = string
  default     = "dev"
}

variable "org_name" {
  description = "The tag value for org_name"
  type        = string
  default     = "fosfer"
}

#########
# Bastion SG
#########
variable "runner_security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "allow-ssh-sg"
}

variable "runner_security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group for allowing access"
}

variable "cidr_blocks" {
  description = "List of CIDR blocks that are allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "runner_ingress_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

#####
# EKS
#####


variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  type        = string
}
variable "access_entries_users_arns" {
  description = "The list of Users ARNs"
  default     = []
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

variable "cluster_endpoint_public_access" {
  description = "Enable or disable public access to the EKS cluster endpoint."
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable or disable private access to the EKS cluster endpoint."
  type        = bool
  default     = true
}



#######
# EKS Addons
#######

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

# Enable Ingress NGINX
variable "enable_ingress_nginx" {
  description = "Enable Ingress NGINX"
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

variable "eks_security_group_name" {
  description = "Security Group Name for EKS"
  type        = string
  default     = "eks-sg"
}

variable "eks_security_group_description" {
  description = "Security Group Description for EKS"
  type        = string
  default     = "Security Group required for EKS within vpc"
}

variable "eks_private_subnet_ids" {
  type        = list(string)
  default = []
}
