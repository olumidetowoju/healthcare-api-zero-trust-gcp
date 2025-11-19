# 📘 CMEK Overview — Customer-Managed Encryption Keys  
### *Hybrid Style: 60% Textbook + 30% Analogy + 10% Enterprise*

---

# 📙 1. What is CMEK?
CMEK (Customer-Managed Encryption Keys) allows **you** — not Google — to control the encryption keys that secure PHI in your FHIR Store and API layers.

Google encrypts data by default using Google-managed keys.  
But for **HIPAA, Zero-Trust, and regulated workloads**, you need:

- Key separation  
- Key control  
- Key rotation  
- Key access logs  
- IAM-bound restrictions  

This is exactly what CMEK provides.

---

# 🏥 2. Analogy — CMEK as the Master Key  
Imagine a hospital with thousands of patient rooms.

- Google-managed keys = hallway key  
- CMEK = **your private master key**, stored in a locked safe  
- You decide **who** holds the key  
- You can rotate or revoke the key at any time  

If someone steals a badge (IAM), they still can’t decrypt PHI without CMEK approval.

---

# 🔐 3. Why Healthcare Requires CMEK
### Without CMEK:
❌ No control over key rotation  
❌ No audit logs per decrypt  
❌ Cannot enforce key-based access boundaries  
❌ Insider/phishing attacks more powerful  

### With CMEK:
✔ You own the key lifecycle  
✔ Decrypt events are logged  
✔ IAM can restrict access  
✔ Zero-Trust access can be enforced  
✔ FHIR datasets + CMEK = HIPAA alignment  

---

# 🧠 4. CMEK Architecture (Simulated)

```mermaid
flowchart TD
FHIR[(FHIR Store)] --> KMS[(CMEK - Cloud KMS)]
API[API Gateway] --> Proxy[Cloud Run FHIR Proxy]
Proxy --> KMS
KMS --> Audit[(KMS Audit Logs)]
Everything that touches PHI must be encrypted using CMEK.

🧩 5. CMEK Key Lifecycle
Stage	Description
Create	Create key ring & key
Authorize	Allow only specific service accounts to decrypt
Rotate	Create new key versions (automatic or manual)
Retire	Disable old key versions
Destroy	Permanently disable & schedule deletion

📜 6. HIPAA Mapping
CMEK supports:

✔ §164.312(a)(2)(iv) – Encryption
✔ §164.312(c)(1) – Integrity
✔ §164.312(b) – Audit
✔ §164.308(a)(3) – Access Control Separation

