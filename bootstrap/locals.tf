data "aws_caller_identity" "current" {}

locals {
  account_id        = data.aws_caller_identity.current.account_id
  state_bucket_name = "${var.project}-tfstate-${local.account_id}"

  plan_subjects = [
    for r in var.github_repos : "repo:${var.github_owner}/${r}:pull_request"
  ]

  apply_subjects = flatten([
    for r in var.github_repos : concat(
      ["repo:${var.github_owner}/${r}:ref:refs/heads/main"],
      [for e in var.apply_environments : "repo:${var.github_owner}/${r}:environment:${e}"]
    )
  ])
}