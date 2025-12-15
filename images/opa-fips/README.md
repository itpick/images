# opa-fips

Open Policy Agent (OPA) is an open source, general-purpose policy engine

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#opa-fips

# Load into Docker
nix build .#load-opa-fips-to-docker && ./result/bin/load-opa-fips-to-docker
```
