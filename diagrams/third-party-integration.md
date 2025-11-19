🤝 Third-Party Integration Architecture
```mermaid
flowchart LR
ExternalApp[Third-Party App] --> APIGW[API Gateway]
APIGW --> Proxy[Cloud Run Proxy]
Proxy --> FHIR[(FHIR Store)]
