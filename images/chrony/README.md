# chrony

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#chrony

# Load into Docker
nix build .#load-chrony-to-docker && ./result/bin/load-chrony-to-docker
```
