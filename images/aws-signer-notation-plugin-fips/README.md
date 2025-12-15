# aws-signer-notation-plugin-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#aws-signer-notation-plugin-fips

# Load into Docker
nix build .#load-aws-signer-notation-plugin-fips-to-docker && ./result/bin/load-aws-signer-notation-plugin-fips-to-docker
```
