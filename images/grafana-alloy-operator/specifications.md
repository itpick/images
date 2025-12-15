# grafana-alloy-operator Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1001 |
| Working directory | /opt/helm |
| Entrypoint | /usr/local/bin/helm-operator run --watches-file ./watches.yaml |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/opt/helmPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc... |
