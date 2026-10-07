terraform {
  backend "s3" {
    bucket       = "apigateway-tfstate-919466768129"
    key          = "orders-api/prod/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true
    encrypt      = true
  }
}