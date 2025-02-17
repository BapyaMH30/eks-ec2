# data "aws_caller_identity" "current" {}

########
# EC2 
########
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "runner_sg" {
  source = "../modules/security-group"

  vpc_id                     = var.vpc_id
  security_group_name        = var.runner_security_group_name
  security_group_description = var.runner_security_group_description
  ingress_cidr_blocks        = var.runner_ingress_cidr_blocks

}

module "key_pair" {
  source = "../modules/keypairs"

  key_pair_name      = var.keypair_name
  ssm_parameter_path = "/${var.environment}/${var.org_name}${var.keypair_name}"
  tags = {
    environment = var.environment
  }
}

module "ec2_runner" {
  source             = "../modules/ec2"
  instance_name      = var.runner_instance_name
  instance_type      = var.runner_instance_type
  create_ebs_volume  = var.create_ebs_volume
  ebs_volume_size    = var.runner_ebs_volume_size
  subnet_id          = var.private_subnet_id
  security_group_ids = [module.runner_sg.security_group_id]
  vpc_id             = var.vpc_id
  ami_id             = data.aws_ami.amazon-linux-2.id
  key_name           = module.key_pair.key_pair_name
  iam_role_name      = var.ec2_server_role_name
  iam_policy         = var.ec2_iam_policy
  user_data = file("${path.module}/../scripts/user_data.sh")
  tags = {
    environment = var.environment
  }
}
