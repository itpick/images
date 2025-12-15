# bats-core

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-core

# Load into Docker
nix build .#load-bats-core-to-docker && ./result/bin/load-bats-core-to-docker
```
