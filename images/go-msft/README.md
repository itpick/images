# go-msft

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#go-msft

# Load into Docker
nix build .#load-go-msft-to-docker && ./result/bin/load-go-msft-to-docker
```
