output "ec2_id" {
  description = "The ID of the instance created."
  value       = module.ec2_instance.id
}

output "ec2_eip" {
  description = "The public DNS IP4 of instance created."
  value       = module.ec2_instance.public_dns
}


output "ec2_instance_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_instance.arn
}

output "ec2_instance_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = module.ec2_instance.capacity_reservation_specification
}

output "ec2_instance_instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = module.ec2_instance.instance_state
}

output "ec2_instance_primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = module.ec2_instance.primary_network_interface_id
}

output "ec2_instance_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2_instance.private_dns
}

