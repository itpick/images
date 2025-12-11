# openldap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#openldap

# Load into Docker
nix build .#load-openldap-to-docker && ./result/bin/load-openldap-to-docker
```
