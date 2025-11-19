
📘 VPC Service Controls — Deep Dive
Hybrid Style (Textbook + Analogy + Enterprise)
📙 1. What Are VPC Service Controls?

VPC-SC is Google Cloud’s strongest data exfiltration protection mechanism.

It creates a virtual security perimeter around managed services such as:

FHIR Store

Cloud Storage

BigQuery

KMS

Logging

It is designed for healthcare compliance.

🏥 2. Analogy — Hospital Perimeter

Think of VPC-SC as a security moat around your hospital.
Even if someone sneaks inside the building, they cannot leave with patient records.

🔐 3. Why VPC-SC Matters for PHI
Without VPC-SC:

Compromised identity = PHI exfiltration

Rogue SA = unlimited access

Malware can export data

With VPC-SC:

Only authorized networks can touch PHI

External networks are blocked

API calls with external origins fail

Attackers cannot transfer data out

🧱 4. VPC-SC Architecture (Simulated)
flowchart TD

subgraph Perimeter[Service Perimeter]
  Dataset[(FHIR Dataset)]
  FHIR[(FHIR Store)]
  KMS[(CMEK)]
  Audit[(Audit Logs)]
end

Internet -->|Blocked| FHIR
InternalUser -->|Within Perimeter| FHIR
CompromisedIdentity -->|Blocked| Dataset

🧩 5. Key VPC-SC Concepts (Simulated)
1️⃣ Service Perimeters

Define allowed network boundaries.

2️⃣ Access Levels

Context-aware rules:

Device trust

User identity

IP ranges

3️⃣ Perimeter Bridges

Allows cross-project communication.

4️⃣ Restricted Services

Healthcare API (FHIR) & KMS included.

🛠 6. How This Maps to Your Architecture

In this course:

Component	Perimeter Role
FHIR Store	Protected resource
CMEK	Key protection zone
Cloud Run FHIR Proxy	Access mediator
API Gateway	Entry point, not inside perimeter
Logging	Part of audit perimeter
🛡 7. HIPAA Mapping

VPC-SC aligns to:
✔ §164.312(a)(1) – Access Control
✔ §164.312(b) – Audit Controls
✔ §164.312(e)(1) – Transmission Security
✔ §164.308(a)(1) – Security Management

