# msft-prod-packages

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#msft-prod-packages

# Load into Docker
nix build .#load-msft-prod-packages-to-docker && ./result/bin/load-msft-prod-packages-to-docker
```
