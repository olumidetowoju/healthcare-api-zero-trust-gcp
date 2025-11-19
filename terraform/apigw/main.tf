##############################################
# API Gateway + Cloud Run Module (SIMULATED)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "api_name" {
  description = "API Gateway name (simulated)"
  default     = "stc-fhir-api"
}

variable "run_service_name" {
  description = "Cloud Run FHIR proxy service (simulated)"
  default     = "stc-fhir-proxy"
}

output "note" {
  value = "API Gateway + Cloud Run FHIR Proxy (Simulated Mode) — no real services deployed."
}
