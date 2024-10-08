## Requirements

The following requirements are needed by this module:

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (5.59.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.59.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_cloudwatch_metric_alarm.alarm](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/cloudwatch_metric_alarm) (resource)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions)

Description: The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN).

Type: `list(string)`

Default: `null`

### <a name="input_alarm_actions_enabled"></a> [alarm\_actions\_enabled](#input\_alarm\_actions\_enabled)

Description: Indicates whether or not actions should be executed during any changes to the alarm's state.

Type: `bool`

Default: `true`

### <a name="input_alarm_comparison_operator"></a> [alarm\_comparison\_operator](#input\_alarm\_comparison\_operator)

Description: The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand.

Type: `string`

Default: `null`

### <a name="input_alarm_datapoints_to_alarm"></a> [alarm\_datapoints\_to\_alarm](#input\_alarm\_datapoints\_to\_alarm)

Description: The description for the alarm.

Type: `number`

Default: `null`

### <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description)

Description: The description for the alarm.

Type: `string`

Default: `null`

### <a name="input_alarm_dimensions"></a> [alarm\_dimensions](#input\_alarm\_dimensions)

Description: The dimensions for the alarm's associated metric.

Type: `map(string)`

Default: `null`

### <a name="input_alarm_evaluate_low_sample_count_percentiles"></a> [alarm\_evaluate\_low\_sample\_count\_percentiles](#input\_alarm\_evaluate\_low\_sample\_count\_percentiles)

Description: Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. Valid values are: ignore, evaluate.

Type: `string`

Default: `null`

### <a name="input_alarm_evaluation_periods"></a> [alarm\_evaluation\_periods](#input\_alarm\_evaluation\_periods)

Description: The descriptive name for the alarm. This name must be unique within the user's AWS account.

Type: `number`

Default: `null`

### <a name="input_alarm_extended_statistic"></a> [alarm\_extended\_statistic](#input\_alarm\_extended\_statistic)

Description: The percentile statistic for the metric associated with the alarm.

Type: `string`

Default: `null`

### <a name="input_alarm_insufficient_data_actions"></a> [alarm\_insufficient\_data\_actions](#input\_alarm\_insufficient\_data\_actions)

Description: The list of actions to execute when this alarm transitions into an INSUFFICIENT\_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN).

Type: `list(string)`

Default: `null`

### <a name="input_alarm_metric_name"></a> [alarm\_metric\_name](#input\_alarm\_metric\_name)

Description: The name for the alarm's associated metric.

Type: `string`

Default: `null`

### <a name="input_alarm_metric_querry_account_id"></a> [alarm\_metric\_querry\_account\_id](#input\_alarm\_metric\_querry\_account\_id)

Description: The ID of the account where the metrics are located, if this is a cross-account alarm.

Type: `string`

Default: `null`

### <a name="input_alarm_metric_querry_expression"></a> [alarm\_metric\_querry\_expression](#input\_alarm\_metric\_querry\_expression)

Description: The math expression to be performed on the returned data, if this object is performing a math expression. This expression can use the id of the other metrics to refer to those metrics, and can also use the id of other expressions to use the result of those expressions.

Type: `string`

Default: `null`

### <a name="input_alarm_metric_querry_id"></a> [alarm\_metric\_querry\_id](#input\_alarm\_metric\_querry\_id)

Description: A short name used to tie this object to the results in the response. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression.

Type: `string`

Default: `null`

### <a name="input_alarm_metric_querry_label"></a> [alarm\_metric\_querry\_label](#input\_alarm\_metric\_querry\_label)

Description: A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents.

Type: `string`

Default: `null`

### <a name="input_alarm_metric_querry_metric_map"></a> [alarm\_metric\_querry\_metric\_map](#input\_alarm\_metric\_querry\_metric\_map)

Description: A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents.

Type:

```hcl
map(object({
    metric_name = string
    period      = number
    stat        = string
    dimensions  = map(string)
    unit        = string
    namespace   = string
  }))
```

Default: `null`

### <a name="input_alarm_metric_querry_period"></a> [alarm\_metric\_querry\_period](#input\_alarm\_metric\_querry\_period)

Description: Granularity in seconds of returned data points.

Type: `number`

Default: `null`

### <a name="input_alarm_metric_querry_return_data"></a> [alarm\_metric\_querry\_return\_data](#input\_alarm\_metric\_querry\_return\_data)

Description: Specify exactly one metric\_query to be true to use that metric\_query result as the alarm.

Type: `bool`

Default: `null`

### <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name)

Description: The descriptive name for the alarm. This name must be unique within the user's AWS account

Type: `string`

Default: `null`

### <a name="input_alarm_namespace"></a> [alarm\_namespace](#input\_alarm\_namespace)

Description: The namespace for the alarm's associated metric.

Type: `string`

Default: `null`

### <a name="input_alarm_ok_actions"></a> [alarm\_ok\_actions](#input\_alarm\_ok\_actions)

Description: The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN).

Type: `list(string)`

Default: `null`

### <a name="input_alarm_period"></a> [alarm\_period](#input\_alarm\_period)

Description: The period in seconds over which the specified statistic is applied. Valid values are 10, 30, or any multiple of 60.

Type: `number`

Default: `null`

### <a name="input_alarm_statistic"></a> [alarm\_statistic](#input\_alarm\_statistic)

Description: The statistic to apply to the alarm's associated metric. Valid values are SampleCount, Average, Sum, Minimum, Maximum.

Type: `string`

Default: `null`

### <a name="input_alarm_tags"></a> [alarm\_tags](#input\_alarm\_tags)

Description: A map of tags to assign to the resource. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.

Type: `map(string)`

Default: `{}`

### <a name="input_alarm_threshold"></a> [alarm\_threshold](#input\_alarm\_threshold)

Description: The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models.

Type: `number`

Default: `null`

### <a name="input_alarm_threshold_metric_id"></a> [alarm\_threshold\_metric\_id](#input\_alarm\_threshold\_metric\_id)

Description: If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY\_DETECTION\_BAND function.

Type: `string`

Default: `null`

### <a name="input_alarm_treat_missing_data"></a> [alarm\_treat\_missing\_data](#input\_alarm\_treat\_missing\_data)

Description: Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching, and notBreaching. Defaults to missing.

Type: `string`

Default: `"missing"`

### <a name="input_alarm_unit"></a> [alarm\_unit](#input\_alarm\_unit)

Description: The unit for the alarm's associated metric.

Type: `string`

Default: `null`

### <a name="input_general_tags"></a> [general\_tags](#input\_general\_tags)

Description: General tags provided for the whole module

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_alarm_arn"></a> [alarm\_arn](#output\_alarm\_arn)

Description: The ARN of the CloudWatch Metric Alarm.

### <a name="output_alarm_id"></a> [alarm\_id](#output\_alarm\_id)

Description: The ID of the health check.
