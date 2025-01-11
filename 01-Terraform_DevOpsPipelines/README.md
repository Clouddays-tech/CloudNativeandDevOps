## Building Terraform CICD Pipeline in Azure DevOps

In this lab, I’ll demonstrate how to build a Terraform CI/CD pipeline for production environments. While this lab will create only a resource group using Terraform, the idea is to showcase how should Terraform CI/CD pipeline be configured. Detailed technical explanations and step-by-step instructions will be shown later and upload a video tutorial.

Pipeline Overview

The pipeline YAML files and Terraform code are available in this repository. Though the syntax is specific to Azure DevOps YAML pipelines, the same principles/workflows apply to other CI/CD platforms like GitHub Actions, GitLab, and Bamboo.

Here’s the pipeline workflow:

Branch Protection Policies
Implement branch protection to prevent direct merges into the main branch to ensure code changes are reviewed and validated before deployment.
Pull Request Validation
When a pull request is created, the pipeline triggers tasks for Terraform linting, formatting (fmt), and validation. Once these checks pass, a DevOps engineer must approve the pull request to merge feature branch to main.
Terraform Plan file Generation
After the pull request is approved and merged, the pipeline generates a Terraform plan file. This plan file is compressed and uploaded as an artifact in the pipeline.
Manual Approval and Release
The release stage is triggered only after manual approval in the pipeline. Then, Terraform will apply IAC codes using the plan file.

- Complete pipeline at https://medium.com/@mr.shwelinhtet/building-terraform-cicd-pipeline-in-azure-devops-2a9aebdfe3e4
