# openldap-2.6-lloadd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openldap-2.6-lloadd

# Load into Docker
nix build .#load-openldap-2.6-lloadd-to-docker && ./result/bin/load-openldap-2.6-lloadd-to-docker
```
