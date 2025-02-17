variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "allow-ssh-sg"
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group for allowing access"
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "cidr_blocks" {
  description = "List of CIDR blocks that are allowed"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_cidr_blocks" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of egress rules to create where 'cidr_blocks' is used"
  type        = list(map(string))
  default     = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = "0.0.0.0/0"
  }]
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
  default     = {}
}