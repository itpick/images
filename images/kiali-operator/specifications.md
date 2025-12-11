# kiali-operator Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /opt/ansible |
| Entrypoint | tini -- /usr/local/bin/ansible-operator run --watches-file=./watches.yaml |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | HOME=/opt/ansiblePATH=/usr/share/ansible-operator/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/us... |
