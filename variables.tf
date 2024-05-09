variable "budget_limit_amount" {
  description = "Budget limit amount"
  type        = number
  default     = 100

  validation {
    condition     = var.budget_limit_amount > 0
    error_message = "Budget limit amount must be greater than 0"
  }
}

variable "name" {
  description = "Name of the budget"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "Name must be provided"
  }
}

variable "budget_include_credit" {
  description = "Include credit"
  type        = bool
  default     = true
}

variable "budget_include_discount" {
  description = "Include discount"
  type        = bool
  default     = true
}

variable "budget_include_other_subscription" {
  description = "Include other subscription"
  type        = bool
  default     = true
}

variable "budget_include_recurring" {
  description = "Include recurring"
  type        = bool
  default     = true
}

variable "budget_include_refund" {
  description = "Include refund"
  type        = bool
  default     = false
}

variable "budget_include_subscription" {
  description = "Include subscription"
  type        = bool
  default     = true
}

variable "budget_include_support" {
  description = "Include support"
  type        = bool
  default     = true
}

variable "budget_include_tax" {
  description = "Include tax"
  type        = bool
  default     = true
}

variable "budget_include_upfront" {
  description = "Include upfront"
  type        = bool
  default     = true
}

variable "budget_use_amortized" {
  description = "Use amortized"
  type        = bool
  default     = false
}

variable "budget_use_blended" {
  description = "Use blended"
  type        = bool
  default     = false
}

variable "budget_time_period_start" {
  description = "Time period start"
  type        = string
  default     = "2024-01-01_00:00"
}

variable "budget_time_period_end" {
  description = "Time period end"
  type        = string
  default     = "2087-06-15_00:00"
}

variable "budget_time_unit" {
  description = "Time unit"
  type        = string
  default     = "MONTHLY"

  validation {
    condition     = contains(["DAILY", "MONTHLY", "QUARTERLY", "ANNUALLY"], var.budget_time_unit)
    error_message = "Time unit must be DAILY, MONTHLY, QUARTERLY or ANNUALLY"
  }
}

variable "notification" {
  description = "Notification list"
  type = list(object({
    notification_type          = string
    comparison_operator        = string
    threshold                  = string
    threshold_type             = string
    subscriber_email_addresses = list(string)
  }))

  validation {
    condition     = contains(["GREATER_THAN", "LESS_THAN", "EQUAL_TO"], var.notification.0.comparison_operator)
    error_message = "Comparison operator must be GREATER_THAN, LESS_THAN or EQUAL_TO"
  }

  validation {
    condition     = contains(["PERCENTAGE", "ABSOLUTE_VALUE"], var.notification.0.threshold_type)
    error_message = "Threshold type must be PERCENTAGE or ABSOLUTE_VALUE"
  }

  validation {
    condition     = contains(["ACTUAL", "FORECASTED"], var.notification.0.notification_type)
    error_message = "Notification type must be ACTUAL or FORECASTED"
  }

  validation {
    condition     = length(var.notification.*.subscriber_email_addresses) > 0
    error_message = "Subscriber email addresses must be provided"
  }
}

variable "cost_filter" {
  description = "Cost filter"
  type        = map(list(string))
  default     = {}
}

variable "sns_notification_enabled" {
  description = "SNS notification enabled - Not implemented yet"
  type        = bool
  default     = false

  validation {
    condition     = var.sns_notification_enabled == false
    error_message = "SNS notification is not implemented yet"
  }
}