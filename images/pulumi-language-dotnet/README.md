# pulumi-language-dotnet

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-dotnet

# Load into Docker
nix build .#load-pulumi-language-dotnet-to-docker && ./result/bin/load-pulumi-language-dotnet-to-docker
```
