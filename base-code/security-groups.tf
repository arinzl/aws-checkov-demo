
#------------------------------------------------------------------------------
# Security Groups - SSM
#------------------------------------------------------------------------------
module "https_443_security_group" {
  source      = "terraform-aws-modules/security-group/aws//modules/https-443"
  version     = "4.16.2"
  name        = "https-443-sg"
  description = "Allow https 443"
  vpc_id      = module.demo_vpc.vpc_id

  # Allow ingress rules to be accessed only within current VPC
  ingress_cidr_blocks = [module.demo_vpc.vpc_cidr_block]

  # Allow all rules for all protocols
  egress_rules = ["https-443-tcp"]

  tags = local.tags_generic
}

