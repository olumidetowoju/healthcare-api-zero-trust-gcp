##############################################
# Terraform VPC Service Controls (SIMULATED)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "perimeter_name" {
  description = "Name of the service perimeter"
  default     = "stc-health-perimeter"
}

variable "protected_projects" {
  description = "Projects inside the Zero-Trust perimeter"
  type        = list(string)
  default     = ["stc-health-primary", "stc-health-security"]
}

output "note" {
  value = "VPC-SC module in Simulated Mode — no real perimeter created."
}
