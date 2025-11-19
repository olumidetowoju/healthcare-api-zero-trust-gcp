
📘 KMS & HSM — Key Management for Healthcare
Hybrid Style (Textbook + Real-World + Enterprise Security)
📙 1. What is Cloud KMS?

Cloud KMS = Key Management Service
It stores encryption keys for:

Databases

Storage

FHIR datasets

Audit logs

Cloud Run services

KMS is the core of healthcare encryption.

🧱 2. What is an HSM?

HSM = Hardware Security Module
A physically secured device that stores keys in hardware.

HSM in GCP = Cloud HSM

A dedicated, tamper-resistant device for cryptographic operations.

🏥 3. Analogy — The Double Lock Safe

KMS = Digital safe

HSM = Physical safe

CMEK = Your master key stored inside

Even if someone breaks into your cloud environment, HSM ensures your key cannot be extracted.

🧠 4. KMS Architecture (Simulated)
flowchart TD
FHIR[(FHIR Store)] --> KMS[(KMS Key Version)]
KMS --> HSM[(HSM Backed Key Material)]
KMS --> Audit[(KMS Audit Logs)]
API[API Gateway] --> Proxy[Cloud Run]
Proxy --> KMS

🔐 5. KMS Key Roles & IAM Model
Key Roles:

roles/cloudkms.cryptoKeyEncrypterDecrypter → Allows encrypt/decrypt

roles/cloudkms.viewer → View key metadata

roles/cloudkms.admin → Manage keys (strictly limited)

Good Practice for Healthcare:

Cloud Run FHIR proxy gets encrypt/decrypt only

API Gateway SA gets no encryption rights

KMS admin is a separate security account

Auditors use viewer-only

🧩 6. Key Versioning

Every CMEK key has:

A primary version

Multiple previous versions

A rotation schedule

A crypto timeline for compliance

Healthcare prefers:

🔁 Monthly or quarterly rotation
🛡 7. HIPAA Mapping

KMS + HSM support:
✔ §164.312(a)(2)(iv) – Encryption of PHI
✔ §164.312(c)(1) – Integrity check
✔ §164.312(b) – Audit logging
✔ §164.308(a)(4) – Separation of duties

