# aws-signer-notation-plugin

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-signer-notation-plugin

# Load into Docker
nix build .#load-aws-signer-notation-plugin-to-docker && ./result/bin/load-aws-signer-notation-plugin-to-docker
```
