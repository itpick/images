# dockerd

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dockerd

# Load into Docker
nix build .#load-dockerd-to-docker && ./result/bin/load-dockerd-to-docker
```
