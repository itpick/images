# vault

Container image for Vault, a cross-platform secrets manager and authentication tool

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 5m 11s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#vault

# Load into Docker
nix build .#load-vault-to-docker && ./result/bin/load-vault-to-docker
```
