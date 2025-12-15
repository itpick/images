# strace

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#strace

# Load into Docker
nix build .#load-strace-to-docker && ./result/bin/load-strace-to-docker
```
