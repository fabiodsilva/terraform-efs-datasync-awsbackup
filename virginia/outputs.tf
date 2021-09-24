output "efs_arn" {
  value       = module.efs.arn
  description = "EFS ARN"
}



#output "efs_source_subnet" {
#  value       = module.efs
#  description = "EFS ID"
#  sensitive   = true
#}

output "efs_mount_target_ids" {
  value       = module.efs.mount_target_ids
  description = "List of EFS mount target IDs (one per Availability Zone)"
}

output "efs_mount_target_ips" {
  sensitive   = true
  value       = module.efs.mount_target_ips
  description = "List of EFS mount target IPs (one per Availability Zone)"
}

output "efs_network_interface_ids" {
  value       = module.efs.network_interface_ids
  description = "List of mount target network interface IDs"
}


output "efs_id" {
  value       = module.efs.id
  description = "EFS ID"
}


#output "efs_replica_vpc_id"  {
#	value = module.efs_replica.vpc_id
#}


