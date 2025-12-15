# openssh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh

# Load into Docker
nix build .#load-openssh-to-docker && ./result/bin/load-openssh-to-docker
```
