# Define the CloudWatch log group
resource "aws_cloudwatch_log_group" "my_log_group" {
  name              = "/my-app-logs"
  retention_in_days = 30
}

# Define the CloudWatch log stream
resource "aws_cloudwatch_log_stream" "my_log_stream" {
  name           = "my-app-stream"
  log_group_name = aws_cloudwatch_log_group.my_log_group.name
}

# Define the CloudWatch log metric filter
resource "aws_cloudwatch_log_metric_filter" "my_log_metric_filter" {
  name           = "my-app-filter"
  pattern        = "ERROR"
  log_group_name = aws_cloudwatch_log_group.my_log_group.name

  metric_transformation {
    name      = "ErrorCount"
    namespace = "MyApp"
    value     = "1"
  }
}
