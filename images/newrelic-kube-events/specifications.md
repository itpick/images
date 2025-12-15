# newrelic-kube-events Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 65532 |
| Working directory | - |
| Entrypoint | /sbin/tini -- /usr/bin/nri-kube-events |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | METADATA=truePATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/... |
