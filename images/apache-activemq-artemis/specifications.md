# apache-activemq-artemis Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1001 |
| Working directory | /var/lib/artemis-instance |
| Entrypoint | /docker-run.sh |
| CMD | run |
| Volumes | - |
| Stop signal | - |
| Environment variables | ANONYMOUS_LOGIN=falseARTEMIS_PASSWORD=artemisARTEMIS_USER=artemisEXTRA_ARGS=--http-host 0.0.0.0 -... |
