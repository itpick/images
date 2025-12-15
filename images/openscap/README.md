# openscap

NIST Certified SCAP 1.2 toolkit

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openscap

# Load into Docker
nix build .#load-openscap-to-docker && ./result/bin/load-openscap-to-docker
```
