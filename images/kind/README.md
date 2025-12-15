# kind

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#kind

# Load into Docker
nix build .#load-kind-to-docker && ./result/bin/load-kind-to-docker
```
