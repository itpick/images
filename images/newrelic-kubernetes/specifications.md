# newrelic-kubernetes Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /bin/nri-kubernetes |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | METADATA=truePATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/... |
