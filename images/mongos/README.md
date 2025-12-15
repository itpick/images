# mongos

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#mongos

# Load into Docker
nix build .#load-mongos-to-docker && ./result/bin/load-mongos-to-docker
```
