# sigstore-scaffolding-fips-ctlog-verifyfulcio

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#sigstore-scaffolding-fips-ctlog-verifyfulcio

# Load into Docker
nix build .#load-sigstore-scaffolding-fips-ctlog-verifyfulcio-to-docker && ./result/bin/load-sigstore-scaffolding-fips-ctlog-verifyfulcio-to-docker
```
