variable "vpc_id" {
  description = "The VPC ID where the EC2 will be created."
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to create."
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance."
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the instance."
  type        = string
}

variable "ebs_volume_size" {
  description = "The EBS root Volume Size"
  type        = number
  default     = 10
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the instance."
  type        = list(string)
}

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}


variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (`iam_role_name` or `name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "iam_role_path" {
  description = "IAM role path"
  type        = string
  default     = null
}

variable "iam_role_description" {
  description = "Description of the role"
  type        = string
  default     = null
}

variable "iam_policy" {
  description = "Policies attached to the IAM role"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "The user data script which runs at startup"
  type        = string
  default     = <<-EOT
    #!/bin/bash
    echo "Hello!"
  EOT
}

variable "tags" {
  description = "Tags to be applied to AWS resources."
  type        = map(string)
  default     = {}
}

variable "create_ebs_volume" {
  description = "whether to create extra ebs volume or not"
  type        = bool
  default     = false
}