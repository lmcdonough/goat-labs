/* https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log.html */

data "aws_vpc" "tf_vpc" {
  filter {
    name   = "tag:environment_tag"
    values = ["dev"]
  }
}

output "vpc_arn" {
  value = data.aws_vpc.tf_vpc.arn
}

resource "aws_flow_log" "tf_vpc" {
  iam_role_arn    = aws_iam_role.tf_vpc.arn
  log_destination = aws_cloudwatch_log_group.tf_vpc.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.tf_vpc.id
}

resource "aws_cloudwatch_log_group" "tf_vpc" {
  name = "tf_vpc"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "tf_vpc" {
  name               = "tf_vpc"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "tf_vpc" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "tf_vpc" {
  name   = "tf_vpc"
  role   = aws_iam_role.tf_vpc.id
  policy = data.aws_iam_policy_document.tf_vpc.json
}
