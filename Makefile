ENV ?= dev
DIR = envs/$(ENV)

fmt:      ; terraform fmt -recursive
validate: ; cd $(DIR) && terraform init -backend=false && terraform validate
lint:     ; tflint --recursive
scan:     ; checkov -d . --quiet
plan:     ; cd $(DIR) && terraform init && terraform plan
apply:    ; cd $(DIR) && terraform apply
destroy:  ; cd $(DIR) && terraform destroy
docs:     ; terraform-docs markdown table modules/* --output-file README.md