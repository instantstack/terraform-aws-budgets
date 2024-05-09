# terraform-aws-budgets
Terraform module for budgets alerts management

## Usage
```hcl
locals {
  name = "monthly_budget"
  notification = [
    {
      "comparison_operator"        = "GREATER_THAN"
      "threshold"                  = 100
      "threshold_type"             = "PERCENTAGE"
      "notification_type"          = "ACTUAL"
      "subscriber_email_addresses" = ["fakeemail@example.com"]
    },
    {
      "comparison_operator"        = "GREATER_THAN"
      "threshold"                  = 100
      "threshold_type"             = "PERCENTAGE"
      "notification_type"          = "FORECASTED"
      "subscriber_email_addresses" = ["fakeemail@example.com"]
    }
  ]
}


module "budget" {
  source  = "instantstack/budgets/aws"
  version = "1.0.0"

  name                              = local.name
  budget_limit_amount               = 100
  budget_time_unit                  = "MONTHLY"
  notification                      = local.notification
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.budget](https://registry.terraform.io/providers/hashicorp/aws/5.10.0/docs/resources/budgets_budget) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.10.0/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_include_credit"></a> [budget\_include\_credit](#input\_budget\_include\_credit) | Include credit | `bool` | `true` | no |
| <a name="input_budget_include_discount"></a> [budget\_include\_discount](#input\_budget\_include\_discount) | Include discount | `bool` | `true` | no |
| <a name="input_budget_include_other_subscription"></a> [budget\_include\_other\_subscription](#input\_budget\_include\_other\_subscription) | Include other subscription | `bool` | `true` | no |
| <a name="input_budget_include_recurring"></a> [budget\_include\_recurring](#input\_budget\_include\_recurring) | Include recurring | `bool` | `true` | no |
| <a name="input_budget_include_refund"></a> [budget\_include\_refund](#input\_budget\_include\_refund) | Include refund | `bool` | `false` | no |
| <a name="input_budget_include_subscription"></a> [budget\_include\_subscription](#input\_budget\_include\_subscription) | Include subscription | `bool` | `true` | no |
| <a name="input_budget_include_support"></a> [budget\_include\_support](#input\_budget\_include\_support) | Include support | `bool` | `true` | no |
| <a name="input_budget_include_tax"></a> [budget\_include\_tax](#input\_budget\_include\_tax) | Include tax | `bool` | `true` | no |
| <a name="input_budget_include_upfront"></a> [budget\_include\_upfront](#input\_budget\_include\_upfront) | Include upfront | `bool` | `true` | no |
| <a name="input_budget_limit_amount"></a> [budget\_limit\_amount](#input\_budget\_limit\_amount) | Budget limit amount | `number` | `100` | no |
| <a name="input_budget_time_period_end"></a> [budget\_time\_period\_end](#input\_budget\_time\_period\_end) | Time period end | `string` | `"2087-06-15_00:00"` | no |
| <a name="input_budget_time_period_start"></a> [budget\_time\_period\_start](#input\_budget\_time\_period\_start) | Time period start | `string` | `"2024-01-01_00:00"` | no |
| <a name="input_budget_time_unit"></a> [budget\_time\_unit](#input\_budget\_time\_unit) | Time unit | `string` | `"MONTHLY"` | no |
| <a name="input_budget_use_amortized"></a> [budget\_use\_amortized](#input\_budget\_use\_amortized) | Use amortized | `bool` | `false` | no |
| <a name="input_budget_use_blended"></a> [budget\_use\_blended](#input\_budget\_use\_blended) | Use blended | `bool` | `false` | no |
| <a name="input_cost_filter"></a> [cost\_filter](#input\_cost\_filter) | Cost filter | `map(list(string))` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the budget | `string` | n/a | yes |
| <a name="input_notification"></a> [notification](#input\_notification) | Notification list | <pre>list(object({<br>      notification_type          = string<br>      comparison_operator        = string<br>      threshold                  = string<br>      threshold_type             = string<br>      subscriber_email_addresses = list(string)<br>    }))</pre> | n/a | yes |
| <a name="input_sns_notification_enabled"></a> [sns\_notification\_enabled](#input\_sns\_notification\_enabled) | SNS notification enabled - Not implemented yet | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_arn"></a> [budget\_arn](#output\_budget\_arn) | The ARN of the budget |
| <a name="output_budget_id"></a> [budget\_id](#output\_budget\_id) | The ID of the budget |

## Authors

Module managed by [Bruno Dias](https://github.com/brunordias) and [Ian Soares](https://github.com/Ian-Soares).

## License

Apache 2 Licensed. See LICENSE for full details.