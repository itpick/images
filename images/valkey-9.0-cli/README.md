# valkey-9.0-cli

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#valkey-9.0-cli

# Load into Docker
nix build .#load-valkey-9.0-cli-to-docker && ./result/bin/load-valkey-9.0-cli-to-docker
```
