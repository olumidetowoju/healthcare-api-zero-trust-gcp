
🌐 API Gateway Zero Trust Architecture
flowchart LR
Client --> APIGW[API Gateway]
APIGW --> Proxy[Cloud Run FHIR Proxy]
Proxy --> FHIR[(FHIR Store)]
APIGW --> Auth[OIDC / JWT Verification]


