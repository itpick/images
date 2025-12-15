# zitadel

ZITADEL is an open-source identity and access management (IAM) system that simplifies user authentication and authorization for applications

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#zitadel

# Load into Docker
nix build .#load-zitadel-to-docker && ./result/bin/load-zitadel-to-docker
```
