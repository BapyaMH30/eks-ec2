module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = var.ingress_cidr_blocks
  egress_with_cidr_blocks = var.egress_cidr_blocks
  tags                    = var.tags
}
