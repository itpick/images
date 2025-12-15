# bats-assert

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-assert

# Load into Docker
nix build .#load-bats-assert-to-docker && ./result/bin/load-bats-assert-to-docker
```
