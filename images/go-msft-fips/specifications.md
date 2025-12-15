# go-msft-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | - |
| Entrypoint | /usr/bin/go |
| CMD | help |
| Volumes | - |
| Stop signal | - |
| Environment variables | GODEBUG=fips140=onGOEXPERIMENT=systemcryptoGOFLAGS=-tags=requirefipsPATH=/usr/local/sbin:/usr/loc... |
