# squid

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#squid

# Load into Docker
nix build .#load-squid-to-docker && ./result/bin/load-squid-to-docker
```
