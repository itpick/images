# pulumi-language-yaml

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-yaml

# Load into Docker
nix build .#load-pulumi-language-yaml-to-docker && ./result/bin/load-pulumi-language-yaml-to-docker
```
