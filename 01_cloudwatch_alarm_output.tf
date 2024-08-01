output "alarm_arn" {
  description = "The ARN of the CloudWatch Metric Alarm."
  value       = var.alarm_name != null && var.alarm_comparison_operator != null && var.alarm_evaluation_periods != null ? aws_cloudwatch_metric_alarm.alarm[0].arn : "no alarm set"
}

output "alarm_id" {
  description = "The ID of the health check."
  value       = var.alarm_name != null && var.alarm_comparison_operator != null && var.alarm_evaluation_periods != null ? aws_cloudwatch_metric_alarm.alarm[0].id : "no alarm set"
}
