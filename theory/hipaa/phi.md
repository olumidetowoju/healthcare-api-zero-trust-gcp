
📘 PHI & Access — Understanding Protected Health Information
Hybrid Explanation (Textbook + Analogy + Enterprise)
📙 1. What is PHI?

PHI = Protected Health Information
Any data that identifies a patient + relates to health conditions, treatments, or payments.

Includes:

Name

Email

Birthday

MRN

Diagnoses

Lab results

Insurance info

Prescriptions

🏥 2. Analogy — PHI As "Identity + Condition"

If identity + health detail are both present → it is PHI.

Example:
“Patient #88a73c has diabetes” → PHI
“A person has diabetes” → Not PHI

🔐 3. PHI Rules for Cloud Architects

You must ensure:

✔ No public access
✔ Access logged
✔ Identity verified
✔ Transmission encrypted
✔ Data encrypted at rest
✔ API controlled via Zero-Trust

This is why Labs 03–08 exist.

🧠 4. PHI Flow Architecture (Simulated)
flowchart TD
Client --> APIGW
APIGW --> Proxy
Proxy --> FHIR[(FHIR Store - PHI)]
FHIR --> CMEK[(CMEK - Planned)]
FHIR --> Audit[(Audit Logs)]


PHI only flows through:

API Gateway

Cloud Run FHIR Proxy

FHIR Store

Audit logs (metadata only)

🧩 5. PHI Access Control Model

PHI must be accessed through policy + identity + boundary:

Layer	Description
Identity	OAuth2, JWT, mTLS, SA
Authorization	IAM policies
Boundary	API Gateway, VPC-SC
Encryption	CMEK, TLS
Audit	Logging, SCC

This multi-layer stack is mandatory for HIPAA compliance.

🛡 6. HIPAA Mapping

This file maps directly to:

✔ §164.312(a)(1) – Access Control
✔ §164.312(b) – Audit Controls
✔ §164.312(c)(1) – Integrity
✔ §164.312(e)(1) – Transmission Security

