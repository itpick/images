# bats-file

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#bats-file

# Load into Docker
nix build .#load-bats-file-to-docker && ./result/bin/load-bats-file-to-docker
```
