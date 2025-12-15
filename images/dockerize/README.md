# dockerize

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dockerize

# Load into Docker
nix build .#load-dockerize-to-docker && ./result/bin/load-dockerize-to-docker
```
