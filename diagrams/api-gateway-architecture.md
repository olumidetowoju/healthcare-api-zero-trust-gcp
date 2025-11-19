🌐 API Gateway Zero Trust Architecture
```mermaid
flowchart LR
Client --> APIGW[API Gateway]
APIGW --> Proxy[Cloud Run FHIR Proxy]
Proxy --> FHIR[(FHIR Store)]
APIGW --> Auth[OIDC / JWT Verification]
