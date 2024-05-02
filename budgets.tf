resource "aws_budgets_budget" "budget" {
  count = var.create_budgets == true && var.aws_region == "us-east-1" ? 1 : 0

  name              = "${var.customer}-account-monthly-${data.aws_caller_identity.current.account_id}"
  budget_type       = "COST"
  limit_amount      = var.budget_limit_amount
  limit_unit        = "USD"
  time_period_end   = try(var.budget_time_period_end, "2087-06-15_00:00")
  time_period_start = try(var.budget_time_period_start, "2024-01-01_00:00")
  time_unit         = "MONTHLY"

  cost_types {
    include_credit             = var.budget_include_credit
    include_discount           = var.budget_include_discount
    include_other_subscription = var.budget_include_other_subscription
    include_recurring          = var.budget_include_recurring
    include_refund             = var.budget_include_refund
    include_subscription       = var.budget_include_subscription
    include_support            = var.budget_include_support
    include_tax                = var.budget_include_tax
    include_upfront            = var.budget_include_upfront
    use_amortized              = var.budget_use_amortized
    use_blended                = var.budget_use_blended
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.budget_subscriber_emails
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.budget_subscriber_emails
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.budget_subscriber_emails
    threshold                  = 130
    threshold_type             = "PERCENTAGE"
  }
}
