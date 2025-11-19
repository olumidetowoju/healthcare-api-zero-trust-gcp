# 📘 FHIR Store — How Healthcare API Stores PHI

## 🏥 1. What is a FHIR Store?
A FHIR Store is like a **secure medical record vault** in Google Cloud’s Healthcare API.

It stores:
- Patient demographics  
- Vital signs  
- Encounters  
- Diagnoses  
- Labs  
- Medications  

Each item is a *FHIR resource* stored in JSON.

---

## 🔒 2. Why Not Store FHIR in Firestore or SQL?
Because a FHIR Store:
- Validates FHIR R4 structure  
- Supports FHIR search  
- Handles history/versioning  
- Is optimized for PHI  
- Integrates with audit logs  

SQL/Firestore do *not* do this safely for healthcare.

---

## 🗄 3. FHIR Store Architecture (Simulated)

```mermaid
flowchart TD
FHIRStore[(FHIR Store)] --> CMEK[(CMEK Key - Planned)]
FHIRStore --> Audit[(Audit Logs - Planned)]
🛠 4. What You Design in This Course
In Simulated Mode:

You define the architecture

Document IAM

Plan CMEK encryption

Create Terraform structure

Ensure HIPAA & Zero-Trust alignment

