##############################################
# Terraform Bootstrap Module (SIMULATED MODE)
# Healthcare API Zero-Trust Platform (GCP)
##############################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

# NOTE:
# In Simulated Mode, no provider authentication
# or real deployment is triggered.

variable "primary_project_id" {
  description = "Simulated Primary Healthcare Project ID (no real project created)"
}

variable "security_project_id" {
  description = "Simulated Security Shared Project ID (no real project created)"
}

variable "billing_account" {
  description = "Billing account (not used in Simulated Mode)"
}

output "note" {
  value = "This bootstrap module is part of Simulated Mode. No resources are created."
}
