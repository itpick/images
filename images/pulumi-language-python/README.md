# pulumi-language-python

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pulumi-language-python

# Load into Docker
nix build .#load-pulumi-language-python-to-docker && ./result/bin/load-pulumi-language-python-to-docker
```
