# tofu-controller-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | no |
| User | 65532 |
| Working directory | - |
| Entrypoint | /sbin/tini -- tofu-controller |
| CMD | - |
| Volumes | - |
| Stop signal | - |
| Environment variables | GNUPGHOME=/tmpPATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/binSSL_CERT_FILE=/etc... |
