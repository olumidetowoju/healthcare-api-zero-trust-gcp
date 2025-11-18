# 🏥 **Healthcare API Zero-Trust (GCP)**  
### **Enterprise Healthcare Security Architecture & Hands-On Course**

[![GCP](https://img.shields.io/badge/Cloud-GCP-blue)](#)
[![FHIR](https://img.shields.io/badge/Standard-FHIR-orange)](#)
[![HIPAA](https://img.shields.io/badge/Compliance-HIPAA-green)](#)
[![Zero Trust](https://img.shields.io/badge/Security-Zero--Trust-red)](#)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)](#)
[![Course](https://img.shields.io/badge/Type-Hands--On%20Course-yellow)](#)

---

# 🌐 Overview  
This repository is a **professional, enterprise-grade training course** teaching you how to build a fully secure, compliant, and production-ready **Healthcare API Platform** on **Google Cloud Platform (GCP)** using:

- Google Cloud Healthcare API (FHIR)
- Zero-Trust Architecture  
- HIPAA Security Controls  
- VPC Service Controls (VPC-SC)  
- CMEK/HSM encryption  
- API Gateway for 3rd-party access  
- Cloud Run serving the FHIR proxy  
- Terraform automation  

This course is designed for **Cloud Security Architects, Platform Engineers, Healthcare SaaS Builders, and API Security Specialists**.

Everything is built hands-on inside your **real GCP project**.

---

# 📦 **ZIP-Style Course Package Structure**

📦 healthcare-api-zero-trust-gcp
┣ 📚 01-foundation-theory
┣ 🧪 02-hands-on-labs
┣ ⚙️ 03-terraform-modules
┣ 🗺️ 04-diagrams
┗ 📑 05-binder-pdfs

yaml
Copy code

Each section is clickable below.

---

# 📚 **01 — Foundation Theory**  

## ▶️ **1.1 FHIR Fundamentals**
- theory/fhir/intro.md  
- theory/fhir/store.md  
- theory/fhir/security.md  

```mermaid
flowchart TD
  Clinician --> FHIR_API
  FHIR_API --> FHIRStore[(FHIR Store R4)]
  FHIRStore --> CMEK[(CMEK Key - Cloud KMS)]
  FHIRStore --> Logs[(Audit Logs)]
▶️ 1.2 HIPAA Security
theory/hipaa/safeguards.md

theory/hipaa/phi.md

mermaid
Copy code
flowchart LR
  PHI --> Encryption
  Encryption --> AccessControls
  AccessControls --> AuditLogs
  AuditLogs --> Monitoring
▶️ 1.3 Zero-Trust Architecture
theory/zero-trust/intro.md

theory/zero-trust/vpc-sc.md

mermaid
Copy code
flowchart LR
  Request --> IdentityCheck --> Context --> Decision
▶️ 1.4 Encryption & CMEK
theory/security/cmek.md

theory/security/kms.md

mermaid
Copy code
flowchart TD
  App --> KMS
  KMS --> DecryptKey
  DecryptKey --> FHIRStore
🧪 02 — Hands-On Labs (Fully Deployable)
🔨 Lab 01 — Project Bootstrap
➡️ labs/01-bootstrap

🔨 Lab 02 — Create Secure FHIR Store
➡️ labs/02-fhir-store

🔨 Lab 03 — Zero-Trust Perimeter (VPC-SC)
➡️ labs/03-zero-trust-vpc-sc

🔨 Lab 04 — CMEK Encryption
➡️ labs/04-cmek

🔨 Lab 05 — API Gateway + Cloud Run FHIR Proxy
➡️ labs/05-api-gateway

🔨 Lab 06 — Third-Party API Access
➡️ labs/06-third-party-access

🔨 Lab 07 — Monitoring & Observability
➡️ labs/07-observability

🔨 Lab 08 — HIPAA Audit Logging
➡️ labs/08-audit-logging

⚙️ 03 — Terraform Modules
Reusable infrastructure modules:

terraform/bootstrap

terraform/fhir

terraform/vpc-sc

terraform/cmek

terraform/apigw

terraform/third-party

🗺️ 04 — Architecture Diagrams
➡️ diagrams/

📑 05 — Binder PDF Documentation
➡️ binder/

🛡️ HIPAA Mapping (Course-Wide)
✔ Access Control — §164.312(a)(1)
✔ Transmission Security — §164.312(e)(1)
✔ Integrity — §164.312(c)(1)
✔ Audit Controls — §164.312(b)
✔ Workforce Security — §164.308(a)(3)

💬 Support
Have issues? Open an issue here:
https://github.com/olumidetowoju/healthcare-api-zero-trust-gcp/issues

