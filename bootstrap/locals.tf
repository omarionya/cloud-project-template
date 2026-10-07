data "aws_caller_identity" "current" {}

locals {
  account_id        = data.aws_caller_identity.current.account_id
  state_bucket_name = "${var.project}-tfstate-${local.account_id}"

  repo_prefix = {
    for name, id in var.github_repos :
    name => "repo:${var.github_owner}@${var.github_owner_id}/${name}@${id}"
  }

  plan_subjects = flatten([
    for p in values(local.repo_prefix) : [
      "${p}:pull_request",
      "${p}:ref:refs/heads/main",
    ]
  ])

  apply_subjects = flatten([
    for p in values(local.repo_prefix) : concat(
      var.allow_main_branch_apply ? ["${p}:ref:refs/heads/main"] : [],
      [for e in var.apply_environments : "${p}:environment:${e}"]
    )
  ])
}