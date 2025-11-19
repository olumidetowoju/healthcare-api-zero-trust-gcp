# 🧪 Lab 07 — Monitoring & Observability (Simulated Mode)
### *Design PHI-aware healthcare monitoring + audit pipelines with NO billing or real infra.*

---

# 📘 1. WHY OBSERVABILITY MATTERS IN HEALTHCARE

Healthcare APIs handle:
- PHI (Protected Health Information)
- Clinician workflows
- Telehealth traffic
- Insurance requests
- Patient access

Observability enables:
- **Audit trails** for HIPAA  
- **Intrusion detection**  
- **Access pattern analysis**  
- **API latency tracking**  
- **Error root-cause detection**  
- **Compliance reporting**  

**Analogy:**  
Monitoring = hospital surveillance cameras + alarms + logs.  
You can't deliver healthcare without it.

---

# 🧠 2. Observability Architecture (Simulated)

```mermaid
flowchart TD

APIGW[API Gateway] --> Logging
Proxy[Cloud Run FHIR Proxy] --> Logging
FHIR[FHIR Store] --> Audit[Audit Logs]

Logging --> Monitoring[Cloud Monitoring (Planned)]
Logging --> ErrorReporting[Error Reporting (Planned)]
Logging --> Trace[Cloud Trace (Planned)]
Audit --> SCC[Security Command Center (Planned)]

subgraph Observability Suite
  Logging
  Monitoring
  ErrorReporting
  Trace
  SCC
end
📊 3. Key Observability Components (Simulated)
✔ Cloud Logging
Logs for:

API Gateway request metadata

Cloud Run proxy requests

FHIR Store access attempts

Rejected requests

Error events

✔ Cloud Monitoring
Dashboards for:

Request latency

Error rate

4xx / 5xx ratios

FHIR read/write volume

✔ Error Reporting
Automatic grouping of:

Invalid FHIR payloads

Cloud Run crashes

Authentication errors

✔ Cloud Trace
Distributed tracing of:

API Gateway → Proxy → FHIR store hops

Slow requests

✔ Security Command Center
Detects:

Access anomalies

Outbound requests (exfiltration attempts)

SA misuse

🔐 4. IAM MODEL (Simulated)
Role	Assigned To	Reason
roles/logging.viewer	auditors	Read audit logs
roles/monitoring.viewer	ops team	Read metrics
roles/logging.privateLogViewer	privacy officer	See PHI access logs
roles/errorreporting.viewer	dev team	Error triage
roles/securitycenter.findingsViewer	security team	Threat detection

None of these are granted — documented only.

🧩 5. Terraform Module (Simulated)
File: terraform/monitoring/main.tf

This defines structure only — no real APIs/resources created.

hcl
Copy code
##############################################
# Monitoring & Observability Module (SIMULATED)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "dashboard_name" {
  description = "Name of observability dashboard (simulated)"
  default     = "stc-health-observability"
}

output "note" {
  value = "Observability module in Simulated Mode — no real dashboards or log sinks created."
}
📟 6. GCLOUD COMMANDS (Documentation Only — DO NOT RUN)
bash
Copy code
# DO NOT RUN — WOULD CREATE BILLABLE RESOURCES

# Create log sinks
gcloud logging sinks create fhir-access-sink ...

# Create monitoring dashboard
gcloud monitoring dashboards create --config-from-file=dashboard.json

# Enable Error Reporting
gcloud services enable clouderrorreporting.googleapis.com
These are examples for documentation.

🔍 7. VALIDATION CHECKLIST (Simulated)
✔ README created
✔ Terraform module created
✔ Diagram included
✔ IAM matrix defined
✔ Observability components documented
✔ No APIs enabled
✔ No real monitoring created
✔ Zero billing

🛡 8. HIPAA MAPPING
HIPAA Section	Reason
§164.312(b)	Audit controls (FHIR access, API logs)
§164.308(a)(1)	Security management processes
§164.308(a)(3)	Workforce accountability
§164.312(c)(1)	Integrity via log review

🎉 LAB 07 COMPLETE (Simulated Mode)
You now have:
✔ PHI-safe observability model
✔ Healthcare audit pipeline design
✔ Terraform monitoring module
✔ Zero-trust operational visibility
✔ Full GitHub documentation
✔ Zero cost

Next: Lab 08 — HIPAA Audit Logging (Simulated Mode)

