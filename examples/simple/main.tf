module "monitoring_alerts" {
  source   = "../../"
  for_each = local.alerts

  alarm_name                                  = try(each.value.alarm_name, null)
  alarm_comparison_operator                   = try(each.value.alarm_comparison_operator, null)
  alarm_evaluation_periods                    = try(each.value.alarm_evaluation_periods, null)
  alarm_metric_name                           = try(each.value.alarm_metric_name, null)
  alarm_namespace                             = try(each.value.alarm_namespace, null)
  alarm_period                                = try(each.value.alarm_period, null)
  alarm_statistic                             = try(each.value.alarm_statistic, null)
  alarm_threshold                             = try(each.value.alarm_threshold, null)
  alarm_threshold_metric_id                   = try(each.value.alarm_threshold_metric_id, null)
  alarm_actions_enabled                       = try(each.value.alarm_actions_enabled, true)
  alarm_actions                               = try(each.value.alarm_actions, null)
  alarm_description                           = try(each.value.alarm_description, null)
  alarm_datapoints_to_alarm                   = try(each.value.alarm_datapoints_to_alarm, null)
  alarm_dimensions                            = try(each.value.alarm_dimensions, null)
  alarm_insufficient_data_actions             = try(each.value.alarm_insufficient_data_actions, null)
  alarm_ok_actions                            = try(each.value.alarm_ok_actions, null)
  alarm_unit                                  = try(each.value.alarm_unit, null)
  alarm_extended_statistic                    = try(each.value.alarm_extended_statistic, null)
  alarm_treat_missing_data                    = try(each.value.alarm_treat_missing_data, "missing")
  alarm_evaluate_low_sample_count_percentiles = try(each.value.alarm_evaluate_low_sample_count_percentiles, null)
  alarm_tags                                  = try(each.value.tags, {})
  alarm_metric_querry_metric_map              = try(each.value.alarm_metric_querry_metric_map, null)
  general_tags                                = local.tags
}
