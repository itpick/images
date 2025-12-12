# bats

Bats provides a simple way to verify that the UNIX programs you write behave as expected

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Image Size

| Type | Size |
|------|------|
| Compressed | 87.79 MB |
| Uncompressed | ~219.48 MB |

## Usage

```bash
# Build the image
nix build .#bats

# Load into Docker
nix build .#load-bats-to-docker && ./result/bin/load-bats-to-docker
```
