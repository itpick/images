# vault-csi-provider-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#vault-csi-provider-fips

# Load into Docker
nix build .#load-vault-csi-provider-fips-to-docker && ./result/bin/load-vault-csi-provider-fips-to-docker
```
