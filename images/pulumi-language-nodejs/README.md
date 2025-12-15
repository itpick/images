# pulumi-language-nodejs

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-nodejs

# Load into Docker
nix build .#load-pulumi-language-nodejs-to-docker && ./result/bin/load-pulumi-language-nodejs-to-docker
```
