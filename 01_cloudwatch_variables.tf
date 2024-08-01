variable "alarm_name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account"
  type        = string
  default     = null
}

variable "alarm_comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand."
  type        = string
  validation {
    condition = (
      var.alarm_comparison_operator == "GreaterThanOrEqualToThreshold" ||
      var.alarm_comparison_operator == "GreaterThanThreshold" ||
      var.alarm_comparison_operator == "LessThanThreshold" ||
      var.alarm_comparison_operator == "LessThanOrEqualToThreshold" ||
      var.alarm_comparison_operator == "LessThanLowerOrGreaterThanUpperThreshold" ||
      var.alarm_comparison_operator == "LessThanLowerThreshold" ||
      var.alarm_comparison_operator == "GreaterThanUpperThreshold"
    )
    error_message = "The comparison operator must be one of the following: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold, LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, GreaterThanUpperThreshold."
  }
  default = null
}

variable "alarm_evaluation_periods" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account."
  type        = number
  default     = null
}

variable "alarm_metric_name" {
  description = "The name for the alarm's associated metric."
  type        = string
  default     = null
}

variable "alarm_namespace" {
  description = "The namespace for the alarm's associated metric."
  type        = string
  default     = null
}

variable "alarm_period" {
  description = "The period in seconds over which the specified statistic is applied. Valid values are 10, 30, or any multiple of 60."
  type        = number
  validation {
    condition = (
      var.alarm_period == 10 ||
      var.alarm_period == 30 ||
      (var.alarm_period % 60 == 0 && var.alarm_period > 0)
    ) || var.alarm_period == null
    error_message = "The period must be 10, 30, or any multiple of 60 seconds."
  }
  default = null
}

variable "alarm_statistic" {
  description = "The statistic to apply to the alarm's associated metric. Valid values are SampleCount, Average, Sum, Minimum, Maximum."
  type        = string
  default     = null
  validation {
    condition = (
      var.alarm_statistic == null ||
      var.alarm_statistic == "SampleCount" ||
      var.alarm_statistic == "Average" ||
      var.alarm_statistic == "Sum" ||
      var.alarm_statistic == "Minimum" ||
      var.alarm_statistic == "Maximum"
    )
    error_message = "The statistic must be one of the following: SampleCount, Average, Sum, Minimum, Maximum."
  }
}

variable "alarm_threshold" {
  description = "The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  type        = number
  default     = null
}

variable "alarm_threshold_metric_id" {
  description = "If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  type        = string
  default     = null
}

variable "alarm_actions_enabled" {
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
  type        = bool
  default     = true
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
  default     = null
}

variable "alarm_datapoints_to_alarm" {
  description = "The description for the alarm."
  type        = number
  default     = null
}

variable "alarm_dimensions" {
  description = "The dimensions for the alarm's associated metric."
  type        = map(string)
  default     = null
}

variable "alarm_insufficient_data_actions" {
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "alarm_ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  type        = list(string)
  default     = null
}

variable "alarm_unit" {
  description = "The unit for the alarm's associated metric."
  type        = string
  default     = null
}

variable "alarm_extended_statistic" {
  description = "The percentile statistic for the metric associated with the alarm."
  type        = string
  validation {
    condition     = var.alarm_extended_statistic == null || can(regex("^p(\\d{1,2}(\\.\\d)?|100(\\.0)?)$", var.alarm_extended_statistic))
    error_message = "The extended_statistic must be a value between p0.0 and p100.0."
  }
  default = null
}

variable "alarm_treat_missing_data" {
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching, and notBreaching. Defaults to missing."
  type        = string
  validation {
    condition = (
      var.alarm_treat_missing_data == "missing" ||
      var.alarm_treat_missing_data == "ignore" ||
      var.alarm_treat_missing_data == "breaching" ||
      var.alarm_treat_missing_data == "notBreaching"
    )
    error_message = "The treat_missing_data value must be one of the following: missing, ignore, breaching, or notBreaching."
  }
  default = "missing"
}

variable "alarm_evaluate_low_sample_count_percentiles" {
  description = "Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. Valid values are: ignore, evaluate."
  type        = string
  validation {
    condition     = var.alarm_evaluate_low_sample_count_percentiles == "ignore" || var.alarm_evaluate_low_sample_count_percentiles == "evaluate"
    error_message = "The evaluate_low_sample_count_percentiles value must be either 'ignore' or 'evaluate'."
  }
  default = "evaluate"
}

variable "alarm_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = {}
}

variable "alarm_metric_querry_id" {
  description = "A short name used to tie this object to the results in the response. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression."
  type        = string
  validation {
    condition     = can(regex("^[a-z][a-zA-Z0-9_]*$", var.alarm_metric_querry_id)) || var.alarm_metric_querry_id == null
    error_message = "The id must start with a lowercase letter and can only contain letters, numbers, and underscores."
  }
  default = null
}

variable "alarm_metric_querry_account_id" {
  description = "The ID of the account where the metrics are located, if this is a cross-account alarm."
  type        = string
  default     = null
}

variable "alarm_metric_querry_expression" {
  description = "The math expression to be performed on the returned data, if this object is performing a math expression. This expression can use the id of the other metrics to refer to those metrics, and can also use the id of other expressions to use the result of those expressions."
  type        = string
  default     = null
}

variable "alarm_metric_querry_label" {
  description = "A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents."
  type        = string
  default     = null
}

variable "alarm_metric_querry_metric_map" {
  description = "A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents."
  type = map(object({
    metric_name = string
    period      = number
    stat        = string
    dimensions  = map(string)
    unit        = string
    namespace   = string
  }))
  default = null
}

variable "alarm_metric_querry_period" {
  description = "Granularity in seconds of returned data points."
  type        = number
  validation {
    condition = (
      var.alarm_metric_querry_period == 10 ||
      var.alarm_metric_querry_period == 30 ||
      (var.alarm_metric_querry_period % 60 == 0 && var.alarm_metric_querry_period > 0)
    ) || var.alarm_metric_querry_period == null
    error_message = "The period must be 10, 30, or any multiple of 60 seconds."
  }
  default = null
}

variable "alarm_metric_querry_return_data" {
  description = "Specify exactly one metric_query to be true to use that metric_query result as the alarm."
  type        = bool
  default     = null
}
