# krb5-server-ldap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#krb5-server-ldap

# Load into Docker
nix build .#load-krb5-server-ldap-to-docker && ./result/bin/load-krb5-server-ldap-to-docker
```
