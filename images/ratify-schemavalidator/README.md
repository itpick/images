# ratify-schemavalidator

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ratify-schemavalidator

# Load into Docker
nix build .#load-ratify-schemavalidator-to-docker && ./result/bin/load-ratify-schemavalidator-to-docker
```
