##############################################
# Audit Logging Module (SIMULATED MODE)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "sink_name" {
  description = "Simulated audit sink name"
  default     = "stc-health-audit-sink"
}

output "note" {
  value = "Audit Logging module (Simulated Mode) — no audit sinks or exports created."
}
