# vault-k8s

Container image for Vault, a cross-platform secrets manager and authentication tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | failed |

## Usage

```bash
# Build the image
nix build .#vault-k8s

# Load into Docker
nix build .#load-vault-k8s-to-docker && ./result/bin/load-vault-k8s-to-docker
```
