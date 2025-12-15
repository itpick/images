# bank-vaults-template

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bank-vaults-template

# Load into Docker
nix build .#load-bank-vaults-template-to-docker && ./result/bin/load-bank-vaults-template-to-docker
```
