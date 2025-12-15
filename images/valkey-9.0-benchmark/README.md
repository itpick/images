# valkey-9.0-benchmark

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#valkey-9.0-benchmark

# Load into Docker
nix build .#load-valkey-9.0-benchmark-to-docker && ./result/bin/load-valkey-9.0-benchmark-to-docker
```
