# open-liberty-kernel

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#open-liberty-kernel

# Load into Docker
nix build .#load-open-liberty-kernel-to-docker && ./result/bin/load-open-liberty-kernel-to-docker
```
