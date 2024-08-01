resource "aws_cloudwatch_metric_alarm" "alarm" {
  count = var.alarm_name != null && var.alarm_comparison_operator != null && var.alarm_evaluation_periods != null ? 1 : 0

  alarm_name                            = var.alarm_name
  comparison_operator                   = var.alarm_comparison_operator
  evaluation_periods                    = var.alarm_evaluation_periods
  metric_name                           = var.alarm_metric_name
  namespace                             = var.alarm_namespace
  period                                = var.alarm_period
  statistic                             = var.alarm_statistic
  threshold                             = var.alarm_threshold
  threshold_metric_id                   = var.alarm_threshold_metric_id
  actions_enabled                       = var.alarm_actions_enabled
  alarm_actions                         = var.alarm_actions
  alarm_description                     = var.alarm_description
  datapoints_to_alarm                   = var.alarm_datapoints_to_alarm
  dimensions                            = var.alarm_dimensions
  insufficient_data_actions             = var.alarm_insufficient_data_actions
  ok_actions                            = var.alarm_ok_actions
  unit                                  = var.alarm_unit
  extended_statistic                    = var.alarm_extended_statistic
  treat_missing_data                    = var.alarm_treat_missing_data
  evaluate_low_sample_count_percentiles = var.alarm_evaluate_low_sample_count_percentiles
  tags                                  = merge(var.general_tags, var.alarm_tags)
  dynamic "metric_query" {
    for_each = var.alarm_metric_querry_id != null ? [1] : []
    content {
      id         = var.alarm_metric_querry_id
      account_id = var.alarm_metric_querry_account_id
      expression = var.alarm_metric_querry_expression
      label      = var.alarm_metric_querry_label
      dynamic "metric" {
        for_each = var.alarm_metric_querry_expression == null && var.alarm_metric_querry_metric_map != null ? var.alarm_metric_querry_metric_map : {}
        content {
          metric_name = metric.value.metric_name
          period      = metric.value.period
          stat        = metric.value.stat
          dimensions  = metric.value.dimensions
          unit        = metric.value.unit
          namespace   = metric.value.namespace
        }

      }
      period      = var.alarm_metric_querry_period
      return_data = var.alarm_metric_querry_return_data
    }

  }
}
