# bootstrap/variables.tf
variable "region" { type = string }
variable "project" { type = string }
variable "owner" { type = string }

variable "github_owner" {
  type        = string
  description = "GitHub user or organization that owns the repos."
}

variable "github_owner_id" {
  type = string
}

variable "github_repos" {
  type        = map(string)
  description = "Repository name => numeric repository ID"
}

variable "apply_environments" {
  type        = list(string)
  description = "GitHub Environments allowed to assume the apply role."
  default     = ["dev", "prod"]
}

variable "apply_policy_arns" {
  type        = list(string)
  description = "Managed policies attached to the apply role. Tighten per project."
}

variable "allow_main_branch_apply" {
  type        = bool
  default     = false
  description = "Let jobs on main without a GitHub Environment assume the apply role. Leave false so applies go through Environment approvals."
}