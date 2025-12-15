# bats-detik

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-detik

# Load into Docker
nix build .#load-bats-detik-to-docker && ./result/bin/load-bats-detik-to-docker
```
