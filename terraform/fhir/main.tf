##############################################
# Terraform FHIR Store Module (SIMULATED MODE)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "fhir_store_name" {
  description = "Name of the FHIR store (simulated)"
  default     = "stc-fhir-store"
}

variable "dataset_name" {
  description = "Dataset name (simulated)"
  default     = "stc-health-dataset"
}

output "note" {
  value = "FHIR Store module in Simulated Mode — no real Healthcare API resources created."
}
