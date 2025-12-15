# dotnet-10-runtime

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-10-runtime

# Load into Docker
nix build .#load-dotnet-10-runtime-to-docker && ./result/bin/load-dotnet-10-runtime-to-docker
```
