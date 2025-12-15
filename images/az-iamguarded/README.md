# az-iamguarded

Azure CLI (IAM Guarded)

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#az-iamguarded

# Load into Docker
nix build .#load-az-iamguarded-to-docker && ./result/bin/load-az-iamguarded-to-docker
```
