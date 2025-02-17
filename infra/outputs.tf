output "basion_ec2_ip" {
  description = "The ip of the ec2 instance."
  value       = module.ec2_runner.ec2_instance_private_dns
}