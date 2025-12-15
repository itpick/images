# miniperl

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#miniperl

# Load into Docker
nix build .#load-miniperl-to-docker && ./result/bin/load-miniperl-to-docker
```
