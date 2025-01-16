TFLINT_CONFIG=$(shell pwd)/.tflint.hcl

# Default target, run all checks (lint, format, pre-commit)
all: lint validate pre-commit

# Run TFLint to check Terraform files
lint:
	@tflint --config $(TFLINT_CONFIG) --recursive --call-module-type=all
	@echo "linting done"
	@terraform fmt -recursive
	@echo "tf fmt done"

validate:
	@terraform validate
	@echo "tf validation done"
	

sec:
	@trivy fs --scanners secret,misconfig ./ --skip-dirs ./kubernetes-* --severity HIGH,CRITICAL  --tf-vars terraform.tfvars -q

format:
	@terraform fmt -check -diff


pre-commit:
	@pre-commit run --all-files


reset:
	@terraform fmt -write=true
	@pre-commit run --all-files --force
