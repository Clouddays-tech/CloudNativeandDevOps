# Default target, run all checks (lint, format, pre-commit)
all: lint format pre-commit

# Run TFLint to check Terraform files
lint:
	@tflint --config ./.tflint.hcl
	@terraform fmt -recursive

# Run terraform fmt to check if files are formatted
format:
	@terraform fmt -check -diff

# Run pre-commit hooks to check and format Terraform files
pre-commit:
	@pre-commit run --all-files

# Optional: reset files to the correct state, reformat and rerun pre-commit
reset:
	@terraform fmt -write=true
	@pre-commit run --all-files --force
