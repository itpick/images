# ca-certificates

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#ca-certificates

# Load into Docker
nix build .#load-ca-certificates-to-docker && ./result/bin/load-ca-certificates-to-docker
```
