# nextcloud-server-fips Specifications

Container image specifications and configuration details.

## Container Configuration

| Setting | Value |
|---------|-------|
| Has apk? | no |
| Has a shell? | yes |
| User | 0 |
| Working directory | /var/www/html |
| Entrypoint | /entrypoint.sh |
| CMD | apache2-foreground |
| Volumes | /var/cache/fontconfig/var/www/html |
| Stop signal | - |
| Environment variables | APACHE_BODY_LIMIT=1073741824APACHE_CONFDIR=/etc/apache2APACHE_ENVVARS=/etc/apache2/envvarsNEXTCLO... |
