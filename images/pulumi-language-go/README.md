# pulumi-language-go

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-go

# Load into Docker
nix build .#load-pulumi-language-go-to-docker && ./result/bin/load-pulumi-language-go-to-docker
```
