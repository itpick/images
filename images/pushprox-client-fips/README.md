# pushprox-client-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#pushprox-client-fips

# Load into Docker
nix build .#load-pushprox-client-fips-to-docker && ./result/bin/load-pushprox-client-fips-to-docker
```
