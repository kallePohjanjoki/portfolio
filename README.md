# pohjanjoki.com

Personal portfolio site for myself

[Live Here](https://www.pohjanjoki.com)

## Overview

Static site built with Astro. Infrastructure (resource group + Static Web App) is provisioned with Terraform, deployment is fully automated via CI/CD, and the custom domain / DNS is configured manually against GoDaddy.

## Stack

- **IaC:** Terraform (`azurerm` provider) — provisions the resource group and Azure Static Web App
- **Hosting:** Azure Static Web Apps (Free tier)
- **CI/CD:** GitHub Actions — every push to `main` builds and deploys automatically, no manual steps
- **DNS:** GoDaddy (domain registrar + DNS management, configured manually)

## Architecture

```
terraform apply → Azure Static Web App (resource group + app)
                          │
                          │  deployment token (output)
                          ▼
git push → GitHub Actions (build + deploy) → Azure Static Web Apps
     
```

- `terraform/main.tf` provisions the resource group; `terraform/apps.tf` provisions the Static Web App itself and outputs the default hostname and deployment token.
- The deployment token output by Terraform is stored as a GitHub Actions secret (`AZURE_STATIC_WEB_APPS_API_TOKEN`), used by the workflow to authenticate against Azure on every deploy.


## Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Outputs `portfolio_default_hostname` and `portfolio_deployment_token` (sensitive) — the token is used to configure the `AZURE_STATIC_WEB_APPS_API_TOKEN` GitHub Actions secret.

