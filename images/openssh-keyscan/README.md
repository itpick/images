# openssh-keyscan

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh-keyscan

# Load into Docker
nix build .#load-openssh-keyscan-to-docker && ./result/bin/load-openssh-keyscan-to-docker
```
