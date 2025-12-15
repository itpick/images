# k9s

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#k9s

# Load into Docker
nix build .#load-k9s-to-docker && ./result/bin/load-k9s-to-docker
```
