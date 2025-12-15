# dotnet-8-runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-8-runtime

# Load into Docker
nix build .#load-dotnet-8-runtime-to-docker && ./result/bin/load-dotnet-8-runtime-to-docker
```
