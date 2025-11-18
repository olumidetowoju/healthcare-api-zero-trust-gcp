# 🧪 Lab 01 — GCP Project Bootstrap  
### *Secure foundation for the Healthcare API Zero-Trust Platform*

---

# 📘 1. Theory (Textbook Style)

## 🏥 Why Two-Project Architecture?
To meet HIPAA and Zero-Trust requirements, GCP environments must separate:

- PHI workloads  
- Security services  
- Audit logs  
- Encryption keys  
- API gateways  

**Analogy:**  
A hospital separates patient rooms (PHI) from the admin office (security).  
Projects do the same.

---

# 🧠 2. Architecture Diagram

```mermaid
flowchart TD
  AdminUser --> SA[Admin Service Account]
  SA --> Primary[Primary Healthcare Project]
  SA --> Security[Security Shared Project]

  subgraph PrimaryProject
      API[API Services Enabled]
      Labels[Compliance Labels]
  end

  subgraph SecurityProject
      KMS[CMEK Keys]
      Logs[Audit Logs]
      Monitoring[Security Monitoring]
  end
🔧 3. Hands-On Deployment
Step 1 — Authenticate
bash
Copy code
gcloud auth login
gcloud auth application-default login
Step 2 — Set Billing Account
bash
Copy code
gcloud beta billing accounts list
BILLING=<YOUR_BILLING_ACCOUNT_ID>
Step 3 — Create Projects
bash
Copy code
PRIMARY_ID="stc-health-primary"
SECURITY_ID="stc-health-security"

gcloud projects create $PRIMARY_ID
gcloud projects create $SECURITY_ID
Link billing:

bash
Copy code
gcloud beta billing projects link $PRIMARY_ID --billing-account=$BILLING
gcloud beta billing projects link $SECURITY_ID --billing-account=$BILLING
Step 4 — Admin Service Account
bash
Copy code
gcloud iam service-accounts create stc-admin-sa \
  --project=$PRIMARY_ID \
  --display-name="SecureTheCloud Admin Automation SA"
Assign permissions:

bash
Copy code
gcloud projects add-iam-policy-binding $PRIMARY_ID \
  --member="serviceAccount:stc-admin-sa@$PRIMARY_ID.iam.gserviceaccount.com" \
  --role="roles/resourcemanager.projectIamAdmin"

gcloud projects add-iam-policy-binding $PRIMARY_ID \
  --member="serviceAccount:stc-admin-sa@$PRIMARY_ID.iam.gserviceaccount.com" \
  --role="roles/serviceusage.serviceUsageAdmin"
Step 5 — Enable APIs
bash
Copy code
APIS=(
serviceusage.googleapis.com
cloudresourcemanager.googleapis.com
iam.googleapis.com
cloudkms.googleapis.com
healthcare.googleapis.com
compute.googleapis.com
storage.googleapis.com
servicenetworking.googleapis.com
vpcaccess.googleapis.com
apigateway.googleapis.com
logging.googleapis.com
monitoring.googleapis.com
securitycenter.googleapis.com
)

for API in "${APIS[@]}"; do
  gcloud services enable $API --project=$PRIMARY_ID
  gcloud services enable $API --project=$SECURITY_ID
done
Step 6 — Apply Labels
bash
Copy code
gcloud resource-manager labels update $PRIMARY_ID \
  --update=env=prod,owner=stc,hipaa=true
⚙️ 4. Terraform Bootstrap (bootstrap module)
File: terraform/bootstrap/main.tf

hcl
Copy code
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.primary_project_id
  region  = "us-central1"
}

provider "google-beta" {
  project = var.primary_project_id
  region  = "us-central1"
}

variable "primary_project_id" {}
variable "security_project_id" {}
variable "billing_account" {}
🔍 5. Validation Steps
Confirm project exists:
bash
Copy code
gcloud projects describe $PRIMARY_ID
Confirm APIs enabled:
bash
Copy code
gcloud services list --enabled --project=$PRIMARY_ID
Confirm service account:
bash
Copy code
gcloud iam service-accounts list --project=$PRIMARY_ID
🛡 6. HIPAA Mapping
Section	Description
§164.308(a)(1)	Security management process
§164.308(a)(3)	Workforce security
§164.312(a)(1)	Access control
§164.312(b)	Audit controls
§164.312(c)(1)	Integrity
§164.312(e)(1)	Transmission security

🎉 Lab 01 Complete
You now have the foundation of your Healthcare FHIR Zero-Trust GCP platform.

Next lab: Secure FHIR Store.

