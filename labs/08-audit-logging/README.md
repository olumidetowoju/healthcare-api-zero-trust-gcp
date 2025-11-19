# 🧪 Lab 08 — HIPAA Audit Logging (Simulated Mode)
### *Design immutable PHI audit pipelines with no real GCP resources or billing.*

---

# 📘 1. WHY AUDIT LOGGING IS REQUIRED IN HEALTHCARE

HIPAA requires **full traceability** of PHI access:

- Who accessed PHI?
- What data did they access?
- When was it accessed?
- From where?
- Was it allowed?
- Was it unusual?

Audit logs support:

- Compliance evidence  
- Security investigations  
- Incident response  
- Forensic analysis  
- Breach reporting  
- Insider threat detection  

**Healthcare APIs MUST produce auditable logs.**

---

# 🧠 2. Audit Logging Architecture (Simulated)

```mermaid
flowchart TD
Client --> APIGW[API Gateway]
APIGW --> Proxy[Cloud Run FHIR Proxy]
Proxy --> FHIR[FHIR Store]
FHIR --> Audit[Audit Logs]

Audit --> BigQuery[(BigQuery Log Sink - Planned)]
Audit --> SIEM[(SOC / SIEM - Planned)]
Audit --> SCC[Security Command Center - Planned]

subgraph LoggingLayer
  Audit
  SCC
  SIEM
end
All components are planned, not deployed.

📂 3. Types of Logs Required for HIPAA
✔ Access Logs
Every FHIR read/write must generate:

pgsql
Copy code
user
time
resourceType
resourceId
action (read/write/delete)
sourceIp
requestId
✔ Error Logs
Failed validations → important for detection.

✔ Security Logs
Authentication failures, token expiration, SA misuse.

✔ Admin Activity Logs
Terraform changes, IAM policies, configuration drift.

✔ Data Access Logs
CMEK decrypt calls (KMS audit logs).

🔐 4. IAM Roles for Audit Security (Simulated)
Role	Purpose
roles/logging.viewer	Standard log readers
roles/logging.privateLogViewer	PHI-sensitive logs
roles/iam.securityReviewer	IAM changes viewer
roles/bigquery.dataViewer	Read-only BQ sink
roles/securitycenter.findingsViewer	Threat detection

None of these are deployed — only documented.

🧩 5. Terraform Module (Simulated)
File: terraform/audit/main.tf

This models audit sinks without creating resources.

hcl
Copy code
##############################################
# Audit Logging Module (SIMULATED MODE)
##############################################

terraform {
  required_version = ">= 1.5.0"
}

variable "sink_name" {
  description = "Name of audit log sink (simulated)"
  default     = "stc-health-audit-sink"
}

output "note" {
  value = "Audit Logging module (Simulated Mode) — no sinks or exports created."
}
📟 6. gcloud Commands (Documentation Only — DO NOT RUN)
bash
Copy code
# DO NOT RUN — WOULD CREATE COSTLY SINKS

# Create BigQuery Sink
gcloud logging sinks create fhir-access-sink \
    bigquery.googleapis.com/projects/.../datasets/audit \
    --log-filter='resource.type="audited_resource"'

# Create SCC notifications
gcloud scc notifications create ...
These are portfolio references.

🔍 7. Validation Checklist (Simulated)
You confirm:

✔ labs/08-audit-logging/README.md exists
✔ terraform/audit/main.tf exists
✔ Diagrams present
✔ IAM mapped
✔ PHI audit fields documented
✔ No GCP resources created
✔ Zero cost

🛡 8. HIPAA Mapping
HIPAA Section	Why Required
§164.312(b)	Audit controls for all PHI access
§164.308(a)(1)	Security management processes
§164.312(a)(1)	Access accountability
§164.312(c)(1)	Integrity checks

Audit logging is a mandatory HIPAA safeguard.

🎉 LAB 08 COMPLETE (Simulated Mode)
You now have:

✔ PHI audit model
✔ Security event pipeline
✔ Terraform audit module
✔ Zero-Trust logging strategy
✔ Logging → Monitoring → SCC chain
✔ Full GitHub documentation
✔ Zero billing

You have now completed all 8 core labs.

