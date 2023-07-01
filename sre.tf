# Define the SRE resources

# Define the CloudWatch dashboard
resource "aws_cloudwatch_dashboard" "my_dashboard" {
  dashboard_name = "MyAppDashboard"
  dashboard_body = <<EOF
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-1234567890abcdef0", { "stat": "Average", "period": 300 } ],
          [ ".", "NetworkIn", ".", ".", { "stat": "Average", "period": 300 } ],
          [ ".", "NetworkOut", ".", ".", { "stat": "Average", "period": 300 } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-west-2",
        "title": "EC2 Instance Metrics",
        "legend": {
          "position": "bottom"
        },
        "yAxis": {
          "left": {
            "min": 0,
            "max": 100
          }
        }
      }
    },
    {
      "type": "metric",
      "x": 0,
      "y": 6,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", "my-rds-instance", { "stat": "Average", "period": 300 } ],
          [ ".", "DatabaseConnections", ".", ".", { "stat": "Average", "period": 300 } ],
          [ ".", "FreeStorageSpace", ".", ".", { "stat": "Average", "period": 300 } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region": "us-west-2",
        "title": "RDS Metrics",
        "legend": {
          "position": "bottom"
        },
        "yAxis": {
          "left": {
            "min": 0
          }
        }
      }
    }
  ]
}
EOF
}

# Define the CloudWatch alarm
resource "aws_cloudwatch_metric_alarm" "my_alarm" {
  alarm_name          = "MyAppAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "ErrorCount"
  namespace           = "MyApp"
  period              = 300
  statistic           = "SampleCount"
  threshold           = 1
  alarm_description   = "Alarm when error count exceeds 1"
  alarm_actions       = [aws_sns_topic.my_topic.arn]
}

# Define the SNS topic
resource "aws_sns_topic" "my_topic" {
  name = "MyAppTopic"
}

# Define the SNS subscription
resource "aws_sns_topic_subscription" "my_subscription" {
  topic_arn = aws_sns_topic.my_topic.arn
  protocol  = "email"
  endpoint  = "sre@example.com"
}
