output "budget_id" {
  value       = aws_budgets_budget.budget.id
  description = "The ID of the budget"
}

output "budget_arn" {
  value       = aws_budgets_budget.budget.arn
  description = "The ARN of the budget"
}