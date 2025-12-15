# pssh

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pssh

# Load into Docker
nix build .#load-pssh-to-docker && ./result/bin/load-pssh-to-docker
```
