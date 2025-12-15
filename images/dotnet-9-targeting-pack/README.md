# dotnet-9-targeting-pack

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-9-targeting-pack

# Load into Docker
nix build .#load-dotnet-9-targeting-pack-to-docker && ./result/bin/load-dotnet-9-targeting-pack-to-docker
```
