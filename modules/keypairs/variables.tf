variable "tags" {
  description = "Tags to be applied to AWS resources."
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "Name of the AWS region where S3 bucket is to be created."
  default     = "us-east-1"
  type        = string
}

variable "key_pair_name" {
  description = "Specifies the name to be assigned to the key pair that will be generated."
  default     = ""
  type        = string
}

variable "ssm_parameter_path" {
  description = "Specifies the SSM parameter name that will be used to store the generated key pair."
  default     = "/example/ssm"
  type        = string
}

variable "create_private_key" {
  description = "Whether to create the private key or not."
  default     = true
  type        = bool
}