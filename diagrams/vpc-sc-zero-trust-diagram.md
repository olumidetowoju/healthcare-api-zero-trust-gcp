🔒 VPC Service Controls — Zero Trust PHI Boundary
```mermaid
flowchart TD

subgraph Perimeter[Service Perimeter]
  FHIR[(FHIR Store)]
  CMEK[(CMEK)]
  Audit[(Audit Logs)]
end

Internet -->|Blocked| FHIR
Proxy[Cloud Run] --> FHIR
