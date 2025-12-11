# dotnet

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | 11s |
| Build Status | success |

## Usage

```bash
# Build the image
nix build .#dotnet

# Load into Docker
nix build .#load-dotnet-to-docker && ./result/bin/load-dotnet-to-docker
```
