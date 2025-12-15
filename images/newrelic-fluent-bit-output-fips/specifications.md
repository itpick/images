# newrelic-fluent-bit-output-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 0 |
| Working directory | - |
| Entrypoint | /usr/bin/fluent-bit |
| CMD | -c /fluent-bit/etc/fluent-bit.conf -e /fluent-bit/bin/out_newrelic.so |
| Volumes | - |
| Stop signal | - |
| Environment variables | PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc/ssl/certs/ca-... |
