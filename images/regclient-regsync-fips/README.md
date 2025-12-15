# regclient-regsync-fips

regclient is a client interface to OCI conformant registries and content shipped with the OCI Image Layout

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#regclient-regsync-fips

# Load into Docker
nix build .#load-regclient-regsync-fips-to-docker && ./result/bin/load-regclient-regsync-fips-to-docker
```
