# bats-support

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-support

# Load into Docker
nix build .#load-bats-support-to-docker && ./result/bin/load-bats-support-to-docker
```
