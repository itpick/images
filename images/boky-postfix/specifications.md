# boky-postfix Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /tmp |
| Entrypoint | - |
| CMD | /bin/sh -c /scripts/run.sh |
| Volumes | /etc/postfix/var/lib/rspamd/dkim/var/spool/postfix |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
