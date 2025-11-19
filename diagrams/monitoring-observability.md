
📊 Monitoring & Observability Architecture
flowchart TD
APIGW --> Metrics[(Monitoring Metrics)]
Proxy --> Logs[(Logging)]
FHIR --> Audit[(Audit Logs)]
Audit --> SCC[(Security Command Center)]
Logs --> Dash[(Dashboards)]
Metrics --> Dash


