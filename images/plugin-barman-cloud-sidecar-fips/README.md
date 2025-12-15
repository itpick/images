# plugin-barman-cloud-sidecar-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#plugin-barman-cloud-sidecar-fips

# Load into Docker
nix build .#load-plugin-barman-cloud-sidecar-fips-to-docker && ./result/bin/load-plugin-barman-cloud-sidecar-fips-to-docker
```
