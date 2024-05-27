resource "aws_budgets_budget" "budget" {
  name              = var.name
  budget_type       = var.budget_type
  limit_amount      = var.budget_limit_amount
  limit_unit        = var.budget_limit_unit
  time_period_end   = try(var.budget_time_period_end, "2087-06-15_00:00")
  time_period_start = try(var.budget_time_period_start, "2024-01-01_00:00")
  time_unit         = try(var.budget_time_unit, "MONTHLY")

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

  dynamic "cost_filter" {
    for_each = var.cost_filter != null ? var.cost_filter : {}

    content {
      name   = cost_filter.key
      values = cost_filter.value
    }
  }

  dynamic "notification" {
    for_each = var.notification != null ? var.notification : []

    content {
      comparison_operator        = lookup(notification.value, "comparison_operator", "GREATER_THAN")
      threshold                  = lookup(notification.value, "threshold", 100)
      threshold_type             = lookup(notification.value, "threshold_type", "PERCENTAGE")
      notification_type          = lookup(notification.value, "notification_type", "FORECASTED")
      subscriber_email_addresses = lookup(notification.value, "subscriber_email_addresses", ["test"])
    }
  }
}
