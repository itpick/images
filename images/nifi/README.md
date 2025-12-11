# nifi

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2m 34s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#nifi

# Load into Docker
nix build .#load-nifi-to-docker && ./result/bin/load-nifi-to-docker
```
