# 📘 Zero Trust Architecture — Introduction  
### *Hybrid Style (Textbook + Analogy + Enterprise)*

---

# 📙 1. What is Zero Trust?
Zero Trust is a **security philosophy** where no user, identity, network, or system is trusted by default — even if they are “inside” your environment.

### Core Principles:
- **Verify explicitly**  
- **Least privilege access**  
- **Assume breach**  
- **Continuous evaluation**  

---

# 🏥 2. Healthcare Analogy  
Imagine a hospital where:
- Every doctor must scan their badge *for every room*  
- Every medication must be checked *for every patient*  
- Every access is logged *every time*  

No shortcuts.  
No “trusted staff”.  
Everything is verified.

That is Zero Trust in healthcare systems.

---

# 🔐 3. Why Zero Trust Matters for FHIR & PHI
FHIR APIs expose:
- Sensitive patient identity  
- Medical records  
- Lab results  
- Diagnoses  
- Medications  

PHI (Protected Health Information) must be protected against:
- Stolen credentials  
- Insider threats  
- Compromised services  
- Lateral movement  
- Exfiltration attacks  

Zero Trust ensures:
- API calls are authenticated  
- Identities are validated  
- Permissions are minimal  
- Data cannot leave secured boundaries  

---

# 🧠 4. Zero Trust Architecture (Simulated)

```mermaid
flowchart LR
User --> Auth[Identity Verification (OIDC/JWT)]
Auth --> Context[Context Awareness]
Context --> PolicyDeny{Policy Engine}
PolicyDeny -->|Allow| Resource
PolicyDeny -->|Deny| Blocked
Key components:

Authentication

Authorization

Policy engine

Monitoring

Boundary controls (VPC-SC)

Encryption (CMEK)

Auditing

🧱 5. Google Cloud Zero Trust Stack
Layer	GCP Component
Identity	IAM, SA tokens, OIDC
Policy	IAM Conditions, VPC-SC
Boundary	Private Service Connect, Firewall
Compute	Cloud Run with identity binding
Data	CMEK-encrypted FHIR Store
Audit	Cloud Logging + SCC

This course models each component in sequence.

🛡 6. HIPAA Mapping
Zero Trust supports:
✔ §164.312(a)(1) – Access Control
✔ §164.312(b) – Audit Controls
✔ §164.312(c)(1) – Integrity
✔ §164.312(e)(1) – Transmission Security

