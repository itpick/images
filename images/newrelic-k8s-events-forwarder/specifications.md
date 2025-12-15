# newrelic-k8s-events-forwarder Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | - |
| Entrypoint | /sbin/tini -- |
| CMD | /usr/bin/newrelic-infra-service |
| Volumes | - |
| Stop signal | - |
| Environment variables | NRIA_HTTP_SERVER_ENABLED=trueNRIA_IS_CONTAINERIZED=trueNRIA_IS_SECURE_FORWARD_ONLY=trueNRIA_OVERR... |
