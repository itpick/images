# tekton-nop-fips

## Build Information

| Metric | Value |
|--------|-------|
| Build Time | N/A |
| Build Status | unknown |

## Usage

```bash
# Build the image
nix build .#tekton-nop-fips

# Load into Docker
nix build .#load-tekton-nop-fips-to-docker && ./result/bin/load-tekton-nop-fips-to-docker
```
