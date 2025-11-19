
🔐 CMEK Encryption Flow
flowchart LR
Proxy[Cloud Run FHIR Proxy] --> KMS[(CMEK Key)]
FHIR[(FHIR Store)] --> KMS
KMS --> Log[(KMS Audit Log)]


