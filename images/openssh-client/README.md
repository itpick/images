# openssh-client

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#openssh-client

# Load into Docker
nix build .#load-openssh-client-to-docker && ./result/bin/load-openssh-client-to-docker
```
