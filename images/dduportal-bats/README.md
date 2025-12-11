# dduportal-bats

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 3s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dduportal-bats

# Load into Docker
nix build .#load-dduportal-bats-to-docker && ./result/bin/load-dduportal-bats-to-docker
```
