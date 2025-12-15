# dotnet-runtime

Minimal container image for .NET and the .NET Tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-runtime

# Load into Docker
nix build .#load-dotnet-runtime-to-docker && ./result/bin/load-dotnet-runtime-to-docker
```
