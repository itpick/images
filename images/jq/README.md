# jq

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#jq

# Load into Docker
nix build .#load-jq-to-docker && ./result/bin/load-jq-to-docker
```
