# aspnet-10-targeting-pack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aspnet-10-targeting-pack

# Load into Docker
nix build .#load-aspnet-10-targeting-pack-to-docker && ./result/bin/load-aspnet-10-targeting-pack-to-docker
```
