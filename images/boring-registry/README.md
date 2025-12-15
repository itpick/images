# boring-registry

Minimal image with the boring-registry server application

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#boring-registry

# Load into Docker
nix build .#load-boring-registry-to-docker && ./result/bin/load-boring-registry-to-docker
```
