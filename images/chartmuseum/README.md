# chartmuseum

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chartmuseum

# Load into Docker
nix build .#load-chartmuseum-to-docker && ./result/bin/load-chartmuseum-to-docker
```
