
🏥 FHIR Store Architecture
flowchart TD
FHIR[(FHIR Store)] --> CMEK[(CMEK Key)]
FHIR --> History[(Version History)]
FHIR --> Audit[(Audit Logs)]
Proxy[Cloud Run Proxy] --> FHIR


