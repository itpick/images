# rust-build-env

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 2s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#rust-build-env

# Load into Docker
nix build .#load-rust-build-env-to-docker && ./result/bin/load-rust-build-env-to-docker
```
