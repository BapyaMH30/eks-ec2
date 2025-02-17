module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name                        = var.instance_name
  instance_type               = var.instance_type
  ami                         = var.ami_id
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  create_iam_instance_profile = true
  iam_role_name               = var.iam_role_name
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies           = var.iam_policy

  user_data_base64 = base64encode(var.user_data)

  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      volume_size = 50
    },
  ]

  tags = var.tags
}

resource "aws_volume_attachment" "extra-attachment" {
  count = var.create_ebs_volume ? 1 : 0
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.extra-volume[0].id
  instance_id = module.ec2_instance.id
}

resource "aws_ebs_volume" "extra-volume" {
  count = var.create_ebs_volume ? 1 : 0
  availability_zone = module.ec2_instance.availability_zone
  size              = var.ebs_volume_size
}