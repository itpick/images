# polaris

Polaris is an open source policy engine for Kubernetes that validates and remediates resource configuration

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#polaris

# Load into Docker
nix build .#load-polaris-to-docker && ./result/bin/load-polaris-to-docker
```
