
#------------------------------------------------------------------------------
# Security Groups - SSM
#------------------------------------------------------------------------------
module "https_443_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/https-443"
  version = "4.16.2"
  # Ignoring Checkov secret_name false positive detection
  #checkov:skip=CKV2_AWS_5: "Ensure that Security Groups are attached to another resource"

  name        = "https-443-sg"
  description = "Allow https 443"
  vpc_id      = module.demo_vpc.vpc_id

  # Allow ingress rules to be accessed only within current VPC
  ingress_cidr_blocks = [module.demo_vpc.vpc_cidr_block]

  # Allow all rules for all protocols
  egress_rules = ["https-443-tcp"]

  tags = local.tags_generic
}

#------------------------------------------------------------------------------
# Restrict default VPC Security Group - Check: CKV2_AWS_12
#------------------------------------------------------------------------------

resource "aws_default_security_group" "default" {
  depends_on = [module.demo_vpc]

  vpc_id = module.demo_vpc.vpc_id

  ingress = []
  egress  = []

  tags = local.tags_generic
}
