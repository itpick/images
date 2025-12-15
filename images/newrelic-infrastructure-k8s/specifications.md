# newrelic-infrastructure-k8s Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /usr/bin/newrelic-infra |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | NRIA_IS_CONTAINERIZED=trueNRIA_OVERRIDE_HOST_ROOT=/hostPATH=/usr/local/sbin:/usr/local/bin:/usr/b... |
