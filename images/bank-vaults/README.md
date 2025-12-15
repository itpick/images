# bank-vaults

Minimal Image for Bank Vaults, a CLI tool to init, unseal and configure Vault

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bank-vaults

# Load into Docker
nix build .#load-bank-vaults-to-docker && ./result/bin/load-bank-vaults-to-docker
```
