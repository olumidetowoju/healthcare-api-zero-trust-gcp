##############################################
# Monitoring & Observability Module (SIMULATED)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "dashboard_name" {
  description = "Healthcare observability dashboard (simulated)"
  default     = "stc-health-observability"
}

output "note" {
  value = "Monitoring module in Simulated Mode — no real dashboards created."
}
