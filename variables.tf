variable "budget_limit_amount" {
  description = "Budget limit amount"
  type        = number
  default     = 100

  validation {
    condition     = var.budget_limit_amount > 0
    error_message = "Budget limit amount must be greater than 0"
  }
}

variable "budget_type" {
  description = "Budget type"
  type        = string
  default     = "COST"
}

variable "budget_limit_unit" {
  description = "Budget limit unit"
  type        = string
  default     = "USD"

  validation {
    condition     = contains(["USD", "PERCENTAGE", "GB"], var.budget_limit_unit)
    error_message = "Budget limit unit must be USD, PERCENTAGE or GB"
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
  default = []
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