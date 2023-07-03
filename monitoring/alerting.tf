# Define the alerting configuration
resource "aws_cloudwatch_metric_alarm" "flask_app_cpu_alarm" {
  alarm_name          = "flask-app-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric checks the CPU utilization of the Flask application"
  alarm_actions       = [aws_sns_topic.alerts_topic.arn]
  dimensions = {
    InstanceId = aws_instance.flask_app.id
  }
}

resource "aws_cloudwatch_metric_alarm" "flask_app_memory_alarm" {
  alarm_name          = "flask-app-memory-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "This metric checks the memory utilization of the Flask application"
  alarm_actions       = [aws_sns_topic.alerts_topic.arn]
  dimensions = {
    InstanceId = aws_instance.flask_app.id
  }
}
