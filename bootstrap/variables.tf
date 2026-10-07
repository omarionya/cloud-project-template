# bootstrap/variables.tf
variable "region" { type = string }
variable "project" { type = string }
variable "owner" { type = string }

variable "github_owner" {
  type        = string
  description = "GitHub user or organization that owns the repos."
}

variable "github_repos" {
  type        = list(string)
  description = "Repository names (without owner) allowed to assume the roles."
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