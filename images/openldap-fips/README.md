# openldap-fips

OpenLDAP is a free, open-source implementation of the Lightweight Directory Access Protocol (LDAP) developed by the OpenLDAP Project

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openldap-fips

# Load into Docker
nix build .#load-openldap-fips-to-docker && ./result/bin/load-openldap-fips-to-docker
```
