# openldap

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 94.28 MB |
| Uncompressed | ~235.70 MB |

## Usage

```bash
# Build the image
nix build .#openldap

# Load into Docker
nix build .#load-openldap-to-docker && ./result/bin/load-openldap-to-docker
```
