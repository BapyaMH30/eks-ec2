Format for terraform.tfvars
```
aws_region             = "us-west-2"
runner_instance_name   = "basion-host"
runner_instance_type   = "t3.medium"
runner_ebs_volume_size = 100
keypair_name           = "fosfer-basion-key"
environment            = "dev"
org_name               = "fosfer"
vpc_id                 = "vpc-060335a7c3748b60c"
private_subnet_id      = "subnet-0ad3ed519878ad8be"
cluster_name           = "fosfer-eks"
cluster_version        = 1.31
eks_private_subnet_ids = ["subnet-0ad3ed519878ad8be","subnet-08c77cdef82130ca8"]
```