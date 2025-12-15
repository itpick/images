# openldap-2.6-clients

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openldap-2.6-clients

# Load into Docker
nix build .#load-openldap-2.6-clients-to-docker && ./result/bin/load-openldap-2.6-clients-to-docker
```
