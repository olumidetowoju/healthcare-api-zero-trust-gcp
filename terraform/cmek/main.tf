##############################################
# Terraform CMEK Module (SIMULATED MODE)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "keyring_name" {
  description = "Key ring name (simulated)"
  default     = "stc-health-crypto"
}

variable "crypto_key_name" {
  description = "Crypto key name (simulated)"
  default     = "stc-fhir-cmek"
}

variable "location" {
  description = "Location for simulated KMS config"
  default     = "us-central1"
}

output "note" {
  value = "CMEK resources are simulated — no real keys created."
}
