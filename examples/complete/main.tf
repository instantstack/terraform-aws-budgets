locals {
  name = "ec2_prod_budget"
  cost_filter = {
    "Service" = ["Amazon Elastic Compute Cloud - Compute"]
    "Env"     = ["prod"]
  }
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
  source = "../../"

  name                              = local.name
  budget_limit_amount               = 100
  budget_include_credit             = true
  budget_include_discount           = true
  budget_include_other_subscription = true
  budget_include_recurring          = true
  budget_include_refund             = false
  budget_include_subscription       = true
  budget_include_support            = true
  budget_include_tax                = true
  budget_include_upfront            = true
  budget_use_amortized              = false
  budget_use_blended                = false
  budget_time_period_end            = "2087-06-15_00:00"
  budget_time_period_start          = "2024-01-01_00:00"
  budget_time_unit                  = "MONTHLY"
  cost_filter                       = local.cost_filter
  notification                      = local.notification
}
