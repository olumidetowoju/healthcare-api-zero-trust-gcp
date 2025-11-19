# 🧪 Lab 04 — CMEK Encryption for Healthcare PHI (Simulated Mode)
### *Designing a secure, compliant cryptographic boundary for the FHIR Platform (zero cost).*

---

# 📘 1. THEORY — Why CMEK Matters in Healthcare

HIPAA requires:
- **Data-at-rest encryption**  
- **Key access control**  
- **Key rotation**  
- **Separation of cryptographic duties**  
- **Auditability** of all key operations  

Google Cloud encrypts everything by default.  
But **default Google-managed keys are NOT enough** for healthcare because:

### 🛑 Google-managed keys:
- Are shared infrastructure  
- Have no customer-controlled rotation  
- Cannot restrict access by principal  
- Cannot enforce separation of duties  
- Cannot generate audit logs per operation  

### 🟢 CMEK solves this  
Customer-Managed Encryption Keys allow you to:

- Fully own the key  
- Rotate keys  
- Control IAM on keys  
- Prevent unauthorized data access  
- Block decrypts even if attackers bypass IAM  
- Log each decrypt operation  

This is required for secure PHI handling.

---

# 🧠 2. CMEK Architecture (Simulated)

```mermaid
flowchart TD

FHIR[FHIR Store (planned)] --> KMS[CMEK Key (planned)]

CloudRun[Cloud Run FHIR Proxy (planned)] --> KMS

API[API Gateway (planned)] --> CloudRun

subgraph SecurityProject[Security Project (planned)]
  KMS
  KeyRing
  KeyRotation
  AuditLogs
end

subgraph PrimaryProject[Primary Healthcare Project (planned)]
  FHIR
  CloudRun
  API
end

UnauthorizedSA -->|Decrypt Blocked| KMS
🛠 3. Key Design (Simulated)
CMEK Key Structure
Layer	Description
Key Ring	Organizational container
Crypto Key	Main CMEK key for PHI
Key Versions	Rotated key versions
Rotation Schedule	Monthly or quarterly

Recommended Names
makefile
Copy code
KeyRing: stc-health-crypto
CryptoKey: stc-fhir-cmek
Location: us-central1
Rotation: every 90 days
🔐 4. IAM for Cryptographic Keys (Simulated)
🔹 Cryptographic Roles
Role	Why Needed
roles/cloudkms.cryptoKeyEncrypterDecrypter	FHIR Store access
roles/cloudkms.admin	Restricted, security-only role
roles/cloudkms.viewer	Auditors reviewing logs
roles/iam.serviceAccountUser	For Cloud Run SA

🔹 Service Accounts (Simulated)
Service Account	Purpose
fhir-proxy-sa	Reads/writes FHIR store
api-gateway-sa	Validates callers
auditor-sa	Reads logs, not PHI
kms-admin-sa	Rotates keys

🔧 5. Terraform Module (Simulated)
📄 File: terraform/cmek/main.tf

hcl
Copy code
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
  description = "Location for KMS resources"
  default     = "us-central1"
}

output "note" {
  value = "CMEK module in Simulated Mode — no real KMS resources created."
}
📟 6. Gcloud Commands (Documentation Only — DO NOT RUN)
bash
Copy code
# DO NOT RUN — WILL INCUR COSTS

gcloud kms keyrings create stc-health-crypto \
  --location=us-central1

gcloud kms keys create stc-fhir-cmek \
  --location=us-central1 \
  --keyring=stc-health-crypto \
  --purpose=encryption \
  --rotation-period=90d
Terraform would apply equivalent actions — but not in Simulated Mode.

🔍 7. Validation (Simulated)
You validate:

✔ labs/04-cmek/README.md exists
✔ terraform/cmek/main.tf exists
✔ Architecture diagrams included
✔ Key model defined
✔ IAM matrix documented
✔ NO GCP resources created
✔ No billing incurred

🛡 8. HIPAA Mapping
HIPAA Control	Reason
§164.312(a)(2)(iv)	Encryption of PHI
§164.312(c)(1)	Integrity preservation
§164.312(e)(1)	Secure transmission
§164.312(b)	Audit of decrypt operations
§164.308(a)(3)	Workforce separation (IAM)

🎉 Lab 04 Complete (Simulated Mode)
You now have:

✔ CMEK high-level architecture
✔ IAM model for key separation
✔ Terraform CMEK module
✔ Healthcare-grade encryption plan
✔ Zero deployment
✔ Zero billing
✔ Full documentation in GitHub

Next: Lab 05 — API Gateway + Cloud Run FHIR Proxy (Simulated Mode)

