# 🌐 Healthcare API — End-to-End Architecture Overview

```mermaid
flowchart TD
Client --> APIGW[API Gateway]
APIGW --> Proxy[Cloud Run FHIR Proxy]
Proxy --> FHIR[(FHIR Store)]
FHIR --> CMEK[(CMEK Encryption)]
FHIR --> Audit[(Audit Logs)]

Audit --> SCC[Security Command Center]
Proxy --> Monitoring[(Monitoring / Metrics)]
