# aws-privateca-issuer

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-privateca-issuer

# Load into Docker
nix build .#load-aws-privateca-issuer-to-docker && ./result/bin/load-aws-privateca-issuer-to-docker
```
