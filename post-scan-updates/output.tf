output "vpc_flow_logs_role_info" {

  description = "VPC Flow log role"
  value       = module.demo_vpc.vpc_flow_log_cloudwatch_iam_role_arn
}


output "vpc_flow_logs_arn_info" {

  description = "VPC Flow log ARN"
  value       = module.demo_vpc.vpc_flow_log_destination_arn
}

output "vpc_id_info" {

  description = "VPC ID"
  value       = module.demo_vpc.vpc_id
}
