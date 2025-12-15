# apache-kvrocks Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 999 |
| Working directory | - |
| Entrypoint | kvrocks -c /var/lib/kvrocks/kvrocks.conf --dir /var/lib/kvrocks --pidfile /var/run/kvrocks/kvrock... |
| CMD | - |
| Volumes | /var/lib/kvrocks |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
