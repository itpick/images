# dotnet-9-sdk

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#dotnet-9-sdk

# Load into Docker
nix build .#load-dotnet-9-sdk-to-docker && ./result/bin/load-dotnet-9-sdk-to-docker
```
