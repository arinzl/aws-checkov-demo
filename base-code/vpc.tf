
#------------------------------------------------------------------------------
# VPC Module
#------------------------------------------------------------------------------
module "demo_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${var.app_name}-${var.environment}-vpc"
  cidr = var.vpc_cidr_range

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = var.private_subnets_list


  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  create_igw         = false
  enable_nat_gateway = false
  enable_ipv6        = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.tags_generic

}
