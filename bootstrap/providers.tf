provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project   = var.project
      Owner     = var.owner
      ManagedBy = "terraform"
      Stack     = "bootstrap"
    }
  }
}