################################################################################
# Flow Log
################################################################################

resource "aws_flow_log" "flow_log" {
  count = var.enable_flow_log ? 1 : 0

  log_destination_type     = var.flow_log_destination_type
  log_destination          = aws_cloudwatch_log_group.flow_log[0].arn
  log_format               = var.flow_log_log_format
  iam_role_arn             = aws_iam_role.vpc_flow_log_cloudwatch[0].arn
  traffic_type             = var.flow_log_traffic_type
  vpc_id                   = module.vpc_main.vpc_id
  max_aggregation_interval = var.flow_log_max_aggregation_interval

  tags = merge(local.common_tags, tomap({
    "Name" : "${local.project_name_prefix}-vpc-flow-log"
  }))
}

################################################################################
# Flow Log CloudWatch
################################################################################

resource "aws_cloudwatch_log_group" "flow_log" {
  count             = var.flow_log_destination_type == "cloud-watch-logs" && var.enable_flow_log ? 1 : 0
  name              = "${local.project_name_prefix}-vpc-flow-log"
  retention_in_days = var.flow_log_cloudwatch_log_group_retention_in_days

  tags = merge(local.common_tags, tomap({
    "Name" : "${local.project_name_prefix}-vpc-flow-log"
  }))
}

resource "aws_iam_role" "vpc_flow_log_cloudwatch" {
  count              = var.flow_log_destination_type == "cloud-watch-logs" && var.enable_flow_log ? 1 : 0
  name               = "${local.project_name_prefix}-vpc-flow-log"
  assume_role_policy = data.aws_iam_policy_document.flow_log_cloudwatch_assume_role.json

  tags = merge(local.common_tags, tomap({
    "Name" : "${local.project_name_prefix}-vpc-flow-log"
  }))
}

data "aws_iam_policy_document" "flow_log_cloudwatch_assume_role" {
  statement {
    sid = "AWSVPCFlowLogsAssumeRole"
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "vpc_flow_log_cloudwatch" {
  role       = aws_iam_role.vpc_flow_log_cloudwatch[0].name
  policy_arn = aws_iam_policy.vpc_flow_log_cloudwatch[0].arn
}

resource "aws_iam_policy" "vpc_flow_log_cloudwatch" {
  count  = var.flow_log_destination_type == "cloud-watch-logs" && var.enable_flow_log ? 1 : 0
  name   = "${local.project_name_prefix}-vpc-flow-log"
  policy = data.aws_iam_policy_document.vpc_flow_log_cloudwatch.json

  tags = merge(local.common_tags, tomap({
    "Name" : "${local.project_name_prefix}-vpc-flow-log"
  }))
}

data "aws_iam_policy_document" "vpc_flow_log_cloudwatch" {
  statement {
    sid    = "AWSVPCFlowLogsPushToCloudWatch"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]
    resources = ["*"]
  }
}
