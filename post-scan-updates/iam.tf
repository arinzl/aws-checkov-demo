#--------------------------------------------------------------------------
# SSM EC2 IAM assumable role 
#--------------------------------------------------------------------------

resource "random_id" "random_id" {
  byte_length = 5

}

module "vpc_iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "4.17.1"

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  role_requires_mfa       = false
  create_role             = true
  create_instance_profile = true

  role_name = "${var.app_name}-vpc-role-${random_id.random_id.hex}"

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]

  tags = local.tags_generic
}

#------------------------------------------------------------------------------
# Unrestraint access for vpc flow log role to all logs - Check: CKV_AWS_111
#------------------------------------------------------------------------------
resource "aws_iam_policy" "vpc_logging_iam_policy" {
  name   = "VPC-logging-boundary-policy"
  path   = "/"
  policy = data.aws_iam_policy_document.vpc_flow_logs_role_boundary_policy.json

  tags = local.tags_generic
}
