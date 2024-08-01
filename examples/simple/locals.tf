locals {
  tags = {}
  alerts = {
    "NLBTargetGroupUnhealthy" = {
      alarm_name                = "NLBTargetGroupUnhealthy"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = 2
      alarm_statistic           = "Maximum"
      alarm_period              = 30
      alarm_namespace           = "AWS/NetworkELB"
      alarm_metric_name         = "UnHealthyHostCount"
      alarm_dimensions = {
        TargetGroup  = "tg_sufix_arn"
        LoadBalancer = "lb_arn_sufix"
      }
      alarm_threshold       = 2
      alarm_actions_enabled = true
      alarm_actions         = ["sns_topic_arn"]
    }
    "LambdaDuration" = {
      alarm_name                = "LambdaDuration"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = 2
      alarm_statistic           = "Average"
      alarm_period              = 60
      alarm_namespace           = "AWS/Lambda"
      alarm_metric_name         = "Duration"
      alarm_threshold           = 1800
      alarm_actions_enabled     = true
      alarm_actions             = ["sns_topic_arn"]
    }
    "LambdaErrors" = {
      alarm_name                = "LambdaErrors"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = 1
      alarm_statistic           = "Maximum"
      alarm_period              = 10
      alarm_namespace           = "AWS/Lambda"
      alarm_metric_name         = "Maximum"
      alarm_threshold           = 0.5
      alarm_actions_enabled     = true
      alarm_actions             = ["sns_topic_arn"]
    }
    "ActiveMQCpuUtilization" = {
      alarm_name                = "ActiveMQCpuUtilization"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = 2
      alarm_statistic           = "Average"
      alarm_period              = 60
      alarm_namespace           = "AWS/AmazonMQ"
      alarm_metric_name         = "CpuUtilization"
      alarm_dimensions = {
        Broker = format("%s-1", "broker_name")
      }
      alarm_threshold       = 70
      alarm_actions_enabled = true
      alarm_actions         = ["sns_topic_arn"]
    }
    "ActiveMQCurrentConnectionsCount" = {
      alarm_name                = "ActiveMQCurrentConnectionsCount"
      alarm_comparison_operator = "GreaterThanOrEqualToThreshold"
      alarm_evaluation_periods  = 2
      alarm_statistic           = "Average"
      alarm_period              = 60
      alarm_namespace           = "AWS/AmazonMQ"
      alarm_metric_name         = "CurrentConnectionsCount"
      alarm_dimensions = {
        Broker = format("%s-1", "broker_name")
      }
      alarm_threshold       = 10
      alarm_actions_enabled = true
      alarm_actions         = ["sns_topic_arn"]
    }
  }
}
