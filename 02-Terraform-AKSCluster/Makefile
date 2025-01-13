TFLINT_CONFIG=$(shell pwd)/.tflint.hcl

# Default target, run all checks (lint, format, pre-commit)
all: lint format pre-commit

# Run TFLint to check Terraform files
lint:
	@tflint --config $(TFLINT_CONFIG) --recursive --call-module-type=all
	@terraform fmt -recursive
	@echo "linting done"

sec:
	@trivy fs --scanners secret,misconfig ./ --skip-dirs ./kubernetes-* --severity HIGH,CRITICAL,MEDIUM --tf-vars terraform.tfvars

format:
	@terraform fmt -check -diff

# Run pre-commit hooks to check and format Terraform files
pre-commit:
	@pre-commit run --all-files

# Optional: reset files to the correct state, reformat and rerun pre-commit
reset:
	@terraform fmt -write=true
	@pre-commit run --all-files --force
