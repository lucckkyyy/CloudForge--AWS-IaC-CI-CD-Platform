.PHONY: fmt validate scan plan

fmt:
	terraform -chdir=terraform fmt -recursive
	terraform -chdir=bootstrap fmt

validate:
	terraform -chdir=terraform init -backend=false
	terraform -chdir=terraform validate

scan:
	checkov --config-file .checkov.yaml

plan:
	terraform -chdir=terraform plan
