# dapr-injector

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dapr-injector

# Load into Docker
nix build .#load-dapr-injector-to-docker && ./result/bin/load-dapr-injector-to-docker
```
