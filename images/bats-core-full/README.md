# bats-core-full

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-core-full

# Load into Docker
nix build .#load-bats-core-full-to-docker && ./result/bin/load-bats-core-full-to-docker
```
