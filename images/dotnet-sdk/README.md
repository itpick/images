# dotnet-sdk

Minimal container image for .NET and the .NET Tools

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-sdk

# Load into Docker
nix build .#load-dotnet-sdk-to-docker && ./result/bin/load-dotnet-sdk-to-docker
```
