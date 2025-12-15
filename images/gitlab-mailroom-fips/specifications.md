# gitlab-mailroom-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 1000 |
| Working directory | - |
| Entrypoint | /scripts/entrypoint.sh |
| CMD | /usr/bin/mail_room -c /var/opt/gitlab/mail_room.yml --log-exit-as json |
| Volumes | - |
| Stop signal | - |
| Environment variables | CONFIG_TEMPLATE_DIRECTORY=/etcFIPS_MODE=1GNUTLS_FORCE_FIPS_MODE=3GOLANG_FIPS=1OPENSSL_FORCE_FIPS_... |
