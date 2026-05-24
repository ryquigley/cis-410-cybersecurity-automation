# Week 8 Comparison

## Manual Deployment
Manual deployment required building the Docker image locally, tagging the image, authenticating with Artifact Registry, pushing the image, and configuring Cloud Run manually through the Google Cloud console.

## Terraform Deployment
Terraform simplified infrastructure provisioning by automating Artifact Registry and Cloud Run resource creation using Infrastructure as Code. This improved repeatability and reduced manual configuration mistakes.

## GitHub Actions
GitHub Actions provided CI/CD automation by automatically building and deploying the application through workflow pipelines. Workflow logs and deployment outputs improved visibility into deployment success and troubleshooting.
