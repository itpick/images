# socat

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#socat

# Load into Docker
nix build .#load-socat-to-docker && ./result/bin/load-socat-to-docker
```
