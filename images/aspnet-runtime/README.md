# aspnet-runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 4s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#aspnet-runtime

# Load into Docker
nix build .#load-aspnet-runtime-to-docker && ./result/bin/load-aspnet-runtime-to-docker
```
