variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "budget_limit_amount" {
  description = "Budget limit amount"
  type        = number
  default     = 100
}

variable "name" {
  description = "Name of the budget"
  type        = string
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

variable "notification" {
  description = "Notification list"
  type        = list(any)
}

variable "sns_notification_enabled" {
  description = "SNS notification enabled"
  type        = bool
  default     = false
}