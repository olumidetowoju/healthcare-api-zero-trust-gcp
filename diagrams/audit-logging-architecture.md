📜 Audit Logging Architecture
```mermaid
flowchart TD
API --> APILog[(API Access Logs)]
Proxy --> ProxyLog[(Proxy Logs)]
FHIR --> FHIRLog[(FHIR Access Logs)]
KMS --> KMSLog[(Key Decrypt Logs)]

APILog --> SIEM[(SIEM / Security Team)]
ProxyLog --> SIEM
FHIRLog --> SIEM
KMSLog --> SIEM

SIEM --> SCC[(Security Command Center)]
