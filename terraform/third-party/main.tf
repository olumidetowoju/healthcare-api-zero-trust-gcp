##############################################
# Third-Party API Access Module (SIMULATED)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "partner_name" {
  description = "Name of the third-party partner"
  default     = "external-partner"
}

variable "access_level" {
  description = "FHIR access scope (simulated)"
  default     = "read-only"
}

output "note" {
  value = "Third-party access module in Simulated Mode — no real IAM bindings created."
}
