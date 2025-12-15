# jupyterhub-k8s-hub Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 1000 |
| Working directory | /srv/jupyterhub |
| Entrypoint | /sbin/tini -- |
| CMD | jupyterhub --config /usr/local/etc/jupyterhub/jupyterhub_config.py |
| Volumes | - |
| Stop signal | - |
| Environment variables | CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin... |
