data "aws_caller_identity" "current" {}

# data "aws_iam_policy_document" "vpc_flow_logs_role_boundary_policy" {
#   statement {
#     sid    = "ServiceBoundaries"
#     effect = "Allow"
#     actions = [
#       "logs:CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
#       "logs:DescribeLogStreams"
#     ]
#     resources = ["arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/vpc-flow-log/${module.demo_vpc.vpc_id}:*"]
#   }
# }
