# 🧪 Lab 02 — Secure FHIR Store (Simulated Mode)
### *HIPAA-grade healthcare data modeling with no billing risk*

---

# 📘 1. THEORY — What is a FHIR Store?

A **FHIR Store** in Google Cloud Healthcare API is a fully-managed location to store:
- **Patient**
- **Observation**
- **Encounter**
- **Condition**
- **MedicationRequest**
- **Practitioner**

FHIR uses JSON/REST with strict rules for **PHI (Protected Health Information)**.

---

# 🧠 2. Why a FHIR Store Requires Strong Security

PHI is highly sensitive.  
Your architecture must enforce:

### ✔ Identity-bound access  
### ✔ CMEK encryption  
### ✔ Audit logs  
### ✔ Zero-Trust restrictions  
### ✔ IAM separation  
### ✔ No public endpoints  

**Analogy:**  
A FHIR store is like a *vault* where every medical record is a safety deposit box.  
Only specific people with the correct key get access.

---

# 🗺 3. Architecture Diagram (Simulated)

```mermaid
flowchart TD
  Clinician --> App[Healthcare App]
  App --> API[API Gateway (planned)]
  API --> FHIRProxy[Cloud Run FHIR Proxy (planned)]
  FHIRProxy --> FHIRStore[(FHIR Store - Planned)]
  FHIRStore --> CMEK[(CMEK Key - Planned)]
  FHIRStore --> Audit[(Audit Logs - Planned)]
🧩 4. Access Control Model (Design Only)
Key IAM Roles (Planned):
Role	Purpose
roles/healthcare.fhirStoreViewer	Read FHIR records
roles/healthcare.fhirStoreEditor	Write/update records
roles/healthcare.admin	Admin (strictly controlled)
roles/iam.serviceAccountUser	Proxy → FHIR store

Service Accounts (Planned):
SA	Description
fhir-proxy-sa	Cloud Run service connecting to FHIR
api-gateway-sa	Validates requests
auditor-sa	Reads audit logs (min access)

None of these are created in Simulated Mode — but they are documented for architecture.

🔧 5. Terraform Module (Simulated)
Path: terraform/fhir/main.tf

We build the structure so your repo looks identical to a real deployment.

hcl
Copy code
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
🔨 6. gcloud Commands (Documented Only — DO NOT RUN)
In real deployments, you would create the dataset + FHIR store:

bash
Copy code
gcloud healthcare datasets create <dataset> --location=us-central1
gcloud healthcare fhir-stores create <store> \
  --dataset=<dataset> \
  --location=us-central1 \
  --version=R4
In Simulated Mode:
These commands are not run — you only document them.

🔍 7. Validation (Simulated)
You should verify:

✔ Terraform module exists
✔ FHIR store structure documented
✔ IAM model defined
✔ Architecture diagram included
✔ README present in labs/02-fhir-store
✔ Nothing deployed to GCP

🛡 8. HIPAA Mapping
This lab aligns with:

Control	Reason
§164.312(a)(1)	FHIR access modeling
§164.312(b)	Audit logging planning
§164.312(c)(1)	Data integrity modeling
§164.312(e)(1)	Secure transmission (API Gateway planned)

🎉 Lab 02 Complete (Simulated Mode)
You now have:

✔ FHIR architecture
✔ Terraform module structure
✔ IAM security model
✔ Zero-Trust FHIR planning
✔ PHI protection design
✔ Zero billing risk

Next: Lab 03 — Zero-Trust Perimeter (VPC-SC) (Simulated)

