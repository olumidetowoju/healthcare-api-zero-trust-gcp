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
This repository is a **professional, enterprise-grade training course** teaching you how to build a secure, compliant, and production-ready **Healthcare API Platform** on **Google Cloud Platform (GCP)** using:

- Google Cloud Healthcare API (FHIR)
- Zero-Trust Architecture  
- HIPAA Security Controls  
- VPC Service Controls (VPC-SC)  
- CMEK/HSM Encryption  
- API Gateway for 3rd-party access  
- Cloud Run serving the FHIR proxy  
- Terraform Automation  

Everything is built hands-on inside your **real GCP project**.

---

# 📦 **Course Package Structure**

📦 healthcare-api-zero-trust-gcp
┣ 📚 01-foundation-theory
┣ 🧪 02-hands-on-labs
┣ ⚙️ 03-terraform-modules
┣ 🗺️ 04-diagrams
┗ 📑 05-binder-pdfs

yaml
Copy code

---

# 📚 **01 — Foundation Theory**

### ▶️ **1.1 FHIR Fundamentals**
- [FHIR Introduction](theory/fhir/intro.md)
- [FHIR Store](theory/fhir/store.md)
- [FHIR Security](theory/fhir/security.md)

### ▶️ **1.2 HIPAA Security**
- [HIPAA Safeguards](theory/hipaa/safeguards.md)
- [PHI & Access](theory/hipaa/phi.md)

### ▶️ **1.3 Zero Trust Architecture**
- [Zero Trust Overview](theory/zero-trust/intro.md)
- [VPC Service Controls](theory/zero-trust/vpc-sc.md)

### ▶️ **1.4 Encryption & CMEK**
- [CMEK Overview](theory/security/cmek.md)
- [KMS & HSM](theory/security/kms.md)

---

# 🧪 **02 — Hands-On Labs (Fully Deployable)**

### 🔨 [Lab 01 — Project Bootstrap](labs/01-bootstrap)

### 🔨 [Lab 02 — Create Secure FHIR Store](labs/02-fhir-store)

### 🔨 [Lab 03 — Zero-Trust Perimeter (VPC-SC)](labs/03-zero-trust-vpc-sc)

### 🔨 [Lab 04 — CMEK Encryption](labs/04-cmek)

### 🔨 [Lab 05 — API Gateway + Cloud Run FHIR Proxy](labs/05-api-gateway)

### 🔨 [Lab 06 — Third-Party API Access](labs/06-third-party-access)

### 🔨 [Lab 07 — Monitoring & Observability](labs/07-observability)

### 🔨 [Lab 08 — HIPAA Audit Logging](labs/08-audit-logging)

---

# ⚙️ **03 — Terraform Modules**

- [Bootstrap Module](terraform/bootstrap)
- [FHIR Infrastructure Module](terraform/fhir)
- [VPC-SC Module](terraform/vpc-sc)
- [CMEK Encryption Module](terraform/cmek)
- [API Gateway Module](terraform/apigw)
- [Third-Party Access Module](terraform/third-party)

---

# 🗺️ **04 — Architecture Diagrams**
➡️ [Architecture Diagrams](diagrams)

---

# 📑 **05 — Binder PDFs**
➡️ [Binder Documentation](binder)

---

# 🛡️ **HIPAA Mapping (Course-Wide)**

✔ Access Control — *§164.312(a)(1)*  
✔ Transmission Security — *§164.312(e)(1)*  
✔ Integrity — *§164.312(c)(1)*  
✔ Audit Controls — *§164.312(b)*  
✔ Workforce Security — *§164.308(a)(3)*  

---

# 💬 Support  
Open issues here:  
https://github.com/olumidetowoju/healthcare-api-zero-trust-gcp/issues

