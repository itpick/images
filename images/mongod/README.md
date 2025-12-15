# mongod

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongod

# Load into Docker
nix build .#load-mongod-to-docker && ./result/bin/load-mongod-to-docker
```
